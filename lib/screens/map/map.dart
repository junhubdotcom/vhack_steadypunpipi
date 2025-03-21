import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_sliding_box/flutter_sliding_box.dart';
import 'package:popover/popover.dart';
import 'package:steadypunpipi_vhack/widget/map/addbutton_menu.dart';
import 'package:steadypunpipi_vhack/widget/map/addbutton_popup.dart';
import 'package:steadypunpipi_vhack/widget/map/issue_card.dart';
import 'package:steadypunpipi_vhack/widget/map/startbutton_menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';


 
class MapPage extends StatefulWidget{
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>{

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  final Location _locationController = Location();
  final Completer<GoogleMapController> _mapController = Completer<GoogleMapController>();
  
  BitmapDescriptor? potholeIcon;
  LatLng? _userLocation;
  
  static const List<LatLng> _positions = [
    LatLng(37.3317, -122.0291),
    LatLng(37.3396, -122.0224),
  ];

  @override
  void initState(){
    super.initState();

    getLocationUpdates();
    BitmapDescriptor.asset(
        ImageConfiguration(size: Size(48, 48)), 'assets/images/pothole.png')
        .then((onValue) {
      potholeIcon = onValue;
    });
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      drawer: drawer(),
      body: SafeArea(
        child: Stack(
          children: [
            _userLocation == null ? 
            const Center(
              child: Text("Loading")
            ) 
            : googleMapping(),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  menuButton(),
                  bottomWidgets()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  GoogleMap googleMapping() {
    return GoogleMap(
      onMapCreated: (GoogleMapController controller) => _mapController.complete(controller),
      initialCameraPosition: CameraPosition(
        target: _userLocation!, 
        zoom: 15.0,
      ),
      zoomControlsEnabled: false,
      markers: {
        ..._positions.map((position) {
          return Marker(
        markerId: MarkerId(position.toString()),
        icon: potholeIcon ?? BitmapDescriptor.defaultMarker,
        position: position,
        infoWindow: InfoWindow(title: 'Pothole'),
          );
        }).toSet(),
        Marker(
          markerId: MarkerId('userLocation'),
          icon: BitmapDescriptor.defaultMarker,
          position: _userLocation!,
          infoWindow: InfoWindow(title: 'You'),
        ),
      },
    );
  }

  Future<void> _cameraToPosition(LatLng position) async {
    final GoogleMapController controller = await _mapController.future;
    CameraPosition _newCameraPosition = CameraPosition(
      target: position, 
      zoom: 15.0
    );
    await controller.animateCamera(CameraUpdate.newCameraPosition(_newCameraPosition));
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

    _locationController.onLocationChanged.listen((LocationData currentLocation) {
      if (currentLocation.latitude != null && currentLocation.longitude != null) {
        setState(() {
          _userLocation = LatLng(currentLocation.latitude!, currentLocation.longitude!);
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
            Icon(Icons.play_arrow_rounded, color: Colors.black, size: 36,), 
            StartMenu
          ),
          customActionButton(
            Icon(Icons.add, color: Colors.black, size: 36,), 
            AddMenu
          ),
        ],
        ),
        SizedBox(height: 18,),
        searchBar(),
        SizedBox(height: 18,),
        issueCardRow(),
      ],
    );
  }

  SearchBar searchBar() {
    return SearchBar(
      leading: Icon(Icons.search, color: Colors.black,),
      hintText: 'Search',
      backgroundColor: WidgetStateProperty.all(Colors.white),
      shadowColor: WidgetStateProperty.all(Colors.black54),
      elevation: WidgetStateProperty.all(4),
      padding: WidgetStateProperty.all(EdgeInsets.only(left: 18, right: 18)),
    );
  }

  SingleChildScrollView issueCardRow() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Padding(
        padding: const EdgeInsets.only(top: 9.0, bottom: 9.0, left: 3, right: 3),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          IssueCard(
            title: 'Pothole',
            address: 'No 123, Lorong 123, Jalan 123',
            count: '12',
          ),
          SizedBox(width: 12,),
          IssueCard(
            title: 'Broken Light',
            address: 'No 123, Lorong 123, Jalan 123',
            count: '8',
          ),
          SizedBox(width: 12,),
          IssueCard(
            title: 'Flooded Street',
            address: 'No 123, Lorong 123, Jalan 123',
            count: '5',
          ),
          ],
        ),
      ),
    );
  }

  Builder customActionButton(Widget icon, Type menu) {
    return Builder(
      builder: (context) {
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
              maxHeight: MediaQuery.of(context).size.height*0.75,
            )
          )
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
                ]
            ),
            child: icon,
          ),
        );
      }
    );
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
          ]
        ),
        child: Icon(Icons.menu, color: Colors.black,),
      ),
      onTap: () => _scaffoldKey.currentState?.openDrawer(),
    );
  }

  Drawer drawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            child: Text(
              'The Watcher', 
              style: TextStyle(
                color: Colors.black, 
                fontSize: 24, 
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          ListTile(
            title: const Text('Item 1'),
            onTap: () {
            },
          ),
          ListTile(
            title: const Text('Item 2'),
            onTap: () {
            },
          ),
        ],
      )
    );
  }
}