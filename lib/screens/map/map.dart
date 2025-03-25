import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:geolocator/geolocator.dart';
import 'package:popover/popover.dart';
import 'package:steadypunpipi_vhack/models/map/noti_service.dart';
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

  bool _isInMode = false;

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

  String _generateRandomAddress() {
    final List<String> _addressList = [
      'Jalan Bukit Bintang, Kuala Lumpur, 55100, Malaysia',
      'Lot 10, Jalan Bukit Bintang, Kuala Lumpur, 50250, Malaysia',
      'Pavilion Kuala Lumpur, Jalan Bukit Bintang, 55100, Malaysia',
      'Berjaya Times Square, Jalan Imbi, Bukit Bintang, 55100, Kuala Lumpur',
      'Jalan Ampang, Kuala Lumpur, 50450, Malaysia',
      'Suria KLCC, Jalan Ampang, Kuala Lumpur, 50088, Malaysia',
      'Intermark Mall, Jalan Tun Razak, off Jalan Ampang, 50400, Kuala Lumpur',
      'Gleneagles Hospital, 282 & 286, Jalan Ampang, 50450, Kuala Lumpur',
      'Persiaran Surian, Petaling Jaya, 47810, Selangor',
      'Sunway Giza Mall, Persiaran Surian, Kota Damansara, 47810, Selangor',
      'Tropicana Gardens Mall, Persiaran Surian, 47810, Petaling Jaya, Selangor',
      'Persiaran Surian, near MRT Kota Damansara, 47810, Petaling Jaya, Selangor',
      'Lebuhraya Damansara-Puchong (LDP), 47301, Selangor',
      'IOI Mall Puchong, Lebuhraya Damansara-Puchong, 47100, Selangor',
      'Kelana Jaya LRT, Lebuhraya Damansara-Puchong, 47301, Selangor',
      'One Utama Shopping Centre, Lebuhraya Damansara-Puchong, 47800, Petaling Jaya',
      'Jalan Kuching, Kuala Lumpur, 51200, Malaysia',
      'Sentul Boulevard, Jalan Kuching, 51200, Kuala Lumpur',
      'Batu Caves Temple, Jalan Kuching, 68100, Selangor',
      'Plaza Arkadia, Desa ParkCity, Jalan Kuching, 52200, Kuala Lumpur',
    ];

    final int _randomIndex = Random().nextInt(_addressList.length);
    return _addressList[_randomIndex];
  }

  void _handlePrompt(int prompt) {
    if (prompt != 9) {
      setState(() {
        final String randomAddress = _generateRandomAddress();
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
          address: randomAddress,
          count: 0,
        );
      });
    } else {
      setState(() {
        _isInMode = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(context),
      body: Stack(
        children: [
          _userLocation == null
              ? const Center(child: Text("Loading"))
              : googleMapping(),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [menuButton(), bottomWidgets()],
              ),
            ),
          ),
        ],
      ),
    );
  }

  GoogleMap googleMapping() {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) {
        if (!_mapController.isCompleted) {
          _mapController.complete(controller);
        }
      },
      initialCameraPosition: CameraPosition(
        target: _userLocation ?? LatLng(0, 0), // Fallback to a default location
        zoom: 15.0,
      ),
      zoomControlsEnabled: false,
      markers: {
        if (_userLocation != null)
          Marker(
            markerId: MarkerId('userLocation'),
            icon: BitmapDescriptor.defaultMarker,
            position: _userLocation!,
            infoWindow: InfoWindow(title: 'You'),
          ),
        for (int i = 0; i < issues.getReportCount(); i++)
          if (issues.getReport(i) != null && issues.getReport(i)!['pos'] != null)
            Marker(
              markerId: MarkerId('issue$i'),
              icon: _getMarkerColor(issues.getReport(i)!),
              position: issues.getReport(i)!['pos'],
              infoWindow: InfoWindow(title: issues.getReport(i)!['title']),
            ),
      },
    );
  }

  BitmapDescriptor _getMarkerColor(Map<String, dynamic> report) {
    final urgencyLevel = report['urgencyLevel']?.toLowerCase();
    final severityLevel = report['severityLevel']?.toLowerCase();

    if (urgencyLevel == 'low' && severityLevel == 'low') {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
    } else if (urgencyLevel == 'medium' || severityLevel == 'moderate') {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueYellow);
    } else if (urgencyLevel == 'high' || severityLevel == 'severe') {
      return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
    }
    return BitmapDescriptor.defaultMarker; // Default fallback
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

          if (_isInMode) {
            for (int i = 0; i < issues.getReportCount(); i++) {
              final report = issues.getReport(i)!;
              final distance = Geolocator.distanceBetween(
              _userLocation!.latitude,
              _userLocation!.longitude,
              report['pos'].latitude,
              report['pos'].longitude,
              );

              print(distance);
              
              if (distance < 300) {
                NotiService().showNotification(
                  title: report['title'],
                  body: '${report['title']} is ${distance.toStringAsFixed(2)} meters away.',
                );
              }
            }
          }
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
              !_isInMode ? Icon(Icons.play_arrow_rounded, color: Colors.black, size: 36,)
              : Icon(Icons.pause, color: Colors.black, size: 36,),
              StartMenu),
            customActionButton(
              Icon(Icons.add, color: Colors.black, size: 36,),
              AddMenu
            ),
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
        onTap: () => menu == StartMenu ? !_isInMode ? showPopover(
            context: context,
            bodyBuilder: (context) => StartMenu(),
            width: 150,
            height: 100,
            direction: PopoverDirection.top,
          )
          : setState(() => _isInMode = false)
        : Navigator.push(context, MaterialPageRoute(builder: (context) => CameraPage())),
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
