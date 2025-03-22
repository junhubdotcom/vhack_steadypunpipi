import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:popover/popover.dart';
import 'package:steadypunpipi_vhack/screens/camera/camera.dart';
import 'package:steadypunpipi_vhack/widget/map/addbutton_menu.dart';
import 'package:steadypunpipi_vhack/widget/map/addbutton_popup.dart';
import 'package:steadypunpipi_vhack/widget/map/drawer.dart';
import 'package:steadypunpipi_vhack/widget/map/issue_card.dart';
import 'package:steadypunpipi_vhack/widget/map/startbutton_menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:steadypunpipi_vhack/models/map/issues_controller.dart';
import 'package:steadypunpipi_vhack/models/map/event_bus.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController =
      Completer<GoogleMapController>();

  BitmapDescriptor? potholeIcon,
      fallenTreeIcon,
      accidentIcon,
      brokenStreetlightIcon,
      roadConstructionIcon,
      blockedRoadIcon;
  LatLng? _userLocation;

  Issues issues = Issues();
  late StreamSubscription<int> _promptSubscription;
  late StreamSubscription<LocationData> _locationSubscription;

  final List<Widget> _widgetArray = [
    Image.asset('assets/images/pothole.png', height: 36, width: 36),
    Image.asset('assets/images/fallentree.png', height: 36, width: 36),
    Image.asset('assets/images/accident.png', height: 36, width: 36),
    Image.asset('assets/images/broken_streetlight.png', height: 36, width: 36),
    Image.asset('assets/images/road_construction.png', height: 36, width: 36),
    Image.asset('assets/images/blocked_road.png', height: 36, width: 36),
  ];

  @override
  void initState() {
    super.initState();

    getLocationUpdates();

    BitmapDescriptor.asset(
            ImageConfiguration(size: Size(48, 48)), 'assets/images/pothole.png')
        .then((onValue) {
      potholeIcon = onValue;
    });
    BitmapDescriptor.asset(ImageConfiguration(size: Size(48, 48)),
            'assets/images/fallentree.png')
        .then((onValue) {
      fallenTreeIcon = onValue;
    });
    BitmapDescriptor.asset(ImageConfiguration(size: Size(48, 48)),
            'assets/images/accident.png')
        .then((onValue) {
      accidentIcon = onValue;
    });
    BitmapDescriptor.asset(ImageConfiguration(size: Size(48, 48)),
            'assets/images/broken_streetlight.png')
        .then((onValue) {
      brokenStreetlightIcon = onValue;
    });
    BitmapDescriptor.asset(ImageConfiguration(size: Size(48, 48)),
            'assets/images/road_construction.png')
        .then((onValue) {
      roadConstructionIcon = onValue;
    });
    BitmapDescriptor.asset(ImageConfiguration(size: Size(48, 48)),
            'assets/images/blocked_road.png')
        .then((onValue) {
      blockedRoadIcon = onValue;
    });

    _promptSubscription = EventBus().stream.listen((int prompt) {
      _handlePrompt(prompt);
    });
  }

  @override
  void dispose() {
    _promptSubscription.cancel();
    _locationSubscription.cancel();
    _locationSubscription.cancel();
    super.dispose();
  }

  void _handlePrompt(int prompt) {
    setState(() {
      issues.addReport(
        id: prompt,
        pos: _userLocation!,
        title: prompt == 1
            ? 'Pothole'
            : prompt == 2
                ? 'Fallen Tree'
                : prompt == 3
                    ? 'Accident'
                    : prompt == 4
                        ? 'Broken Streetlight'
                        : prompt == 5
                            ? 'Road Construction'
                            : prompt == 6
                                ? 'Blocked Road'
                                : 'Other',
        address: 'Unknown',
        count: 0,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context),
      drawer: drawer(context),
      body: SafeArea(
        child: Stack(
          children: [
            _userLocation == null
                ? const Center(child: Text("Loading"))
                : googleMapping(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [menuButton(), bottomWidgets()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GoogleMap googleMapping() {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) =>
          _mapController.complete(controller),
      initialCameraPosition: CameraPosition(
        target: _userLocation!,
        zoom: 15.0,
      ),
      zoomControlsEnabled: false,
      markers: {
        Marker(
          markerId: MarkerId('userLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: _userLocation!,
          infoWindow: InfoWindow(title: 'You'),
        ),
        for (int i = 0; i < issues.getReportCount(); i++)
          Marker(
            markerId: MarkerId('issue$i'),
            icon: issues.getReport(i)!['id'] == 1
                ? potholeIcon!
                : issues.getReport(i)!['id'] == 2
                    ? fallenTreeIcon!
                    : issues.getReport(i)!['id'] == 3
                        ? accidentIcon!
                        : issues.getReport(i)!['id'] == 4
                            ? brokenStreetlightIcon!
                            : issues.getReport(i)!['id'] == 5
                                ? roadConstructionIcon!
                                : issues.getReport(i)!['id'] == 6
                                    ? blockedRoadIcon!
                                    : BitmapDescriptor.defaultMarker,
            position: issues.getReport(i)!['pos'],
            infoWindow: InfoWindow(title: issues.getReport(i)!['title']),
          ),
      },
    );
  }

  Future<void> _cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition =
        CameraPosition(target: position, zoom: 15.0);
    await controller
        .animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
  }

  Future<void> getLocationUpdates() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await _locationController.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _locationController.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _locationController.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _locationController.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationSubscription = _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _userLocation =
              LatLng(currentLocation.latitude!, currentLocation.longitude!);
          _cameraToPosition(_userLocation!);
        });
      }
    });
  }

  Column bottomWidgets() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            customActionButton(
                Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.black,
                  size: 36,
                ),
                StartMenu),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CameraPage()));
              },
              child: Container(
                width: 54,
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                      )
                    ]),
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 36,
                ),
              ),
            ),
            // customActionButton(
            //   Icon(Icons.add, color: Colors.black, size: 36,),
            //   AddMenu
            // ),
          ],
        ),
        SizedBox(
          height: 18,
        ),
        searchBar(),
        SizedBox(
          height: 18,
        ),
        issueCardRow(),
      ],
    );
  }

  SingleChildScrollView issueCardRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding:
            const EdgeInsets.only(top: 9.0, bottom: 9.0, left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            for (int i = 0; i < issues.getReportCount(); i++)
              IssueCard(
                icon: _widgetArray[issues.getReport(i)!['id'] - 1],
                title: issues.getReport(i)!['title'],
                address: issues.getReport(i)!['address'],
                count: issues.getReport(i)!['count'].toString(),
              ),
          ],
        ),
      ),
    );
  }

  SearchBar searchBar() {
    return SearchBar(
      leading: Icon(
        Icons.search,
        color: Colors.black,
      ),
      hintText: 'Search',
      backgroundColor: WidgetStateProperty.all(Colors.white),
      shadowColor: WidgetStateProperty.all(Colors.black54),
      elevation: WidgetStateProperty.all(4),
      padding: WidgetStateProperty.all(EdgeInsets.only(left: 18, right: 18)),
    );
  }

  Builder customActionButton(Widget icon, Type menu) {
    return Builder(builder: (context) {
      return GestureDetector(
        onTap: () => showPopover(
          context: context,
          bodyBuilder: (context) => menu == StartMenu ? StartMenu() : AddMenu(),
          width: 150,
          height: 100,
          direction: PopoverDirection.top,
        ),
        onDoubleTap: menu == AddMenu
            ? () => showSlidingBox(
                context: context,
                box: SlidingBox(
                  body: reportWidget(),
                  maxHeight: MediaQuery.of(context).size.height * 0.75,
                ))
            : null,
        child: Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                )
              ]),
          child: icon,
        ),
      );
    });
  }

  GestureDetector menuButton() {
    return GestureDetector(
      child: Container(
        width: 54,
        height: 45,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(9),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4,
                spreadRadius: 0,
                offset: Offset(0, 4),
              )
            ]),
        child: Icon(
          Icons.menu,
          color: Colors.black,
        ),
      ),
      onTap: () => _scaffoldKey.currentState?.openDrawer(),
    );
  }
}
