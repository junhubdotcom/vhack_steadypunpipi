import 'dart:async';

import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:steadypunpipi_vhack/widget/map/addbutton_menu.dart';
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
  
  LatLng? _userLocation;

  @override
  void initState(){
    super.initState();
    getLocationUpdates();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: drawerListView(),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            _userLocation == null ? 
            const Center(
              child: Text("Loading")
            ) 
            : GoogleMap(
              onMapCreated: (GoogleMapController controller) => _mapController.complete(controller),
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
                  infoWindow: InfoWindow(title: 'Your Location'),
                ),
              },
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
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
          onTap: () => showPopover(
            context: context, 
            bodyBuilder: (context) => menu == StartMenu ? StartMenu() : AddMenu(),
            width: 150,
            height: 100,
            direction: PopoverDirection.top,
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

  ListView drawerListView() {
    return ListView(
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
    );
  }
}