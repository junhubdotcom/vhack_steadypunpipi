import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import 'package:steadypunpipi_vhack/widget/map/addbutton_menu.dart';
import 'package:steadypunpipi_vhack/widget/map/issue_card.dart';
import 'package:steadypunpipi_vhack/widget/map/startbutton_menu.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

 
class MapPage extends StatefulWidget{
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage>{

  final _scaffoldKey = GlobalKey<ScaffoldState>();
  static const LatLng _pGooglePlex = LatLng(45.521563, -122.677433);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.white),
              child: Text('Drawer Header'),
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
        ),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: _pGooglePlex, 
                zoom: 15.0
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, right: 18.0, bottom: 18.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
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
                  ),
                  Column(
                    children: [
                      Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Builder(
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
                                child: Icon(Icons.play_arrow_rounded, color: Colors.black, size: 36,),
                              ),
                              onTap: () => showPopover(
                                context: context, 
                                bodyBuilder: (context) => StartMenu(),
                                width: 150,
                                height: 100,
                                direction: PopoverDirection.top,
                              ),
                            );
                          }
                        ),
                        Builder(
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
                              child: Icon(Icons.add, color: Colors.black, size: 36,),
                            ),
                            onTap: () => showPopover(
                                context: context, 
                                bodyBuilder: (context) => AddMenu(),
                                width: 150,
                                height: 100,
                                direction: PopoverDirection.top,
                              ),
                            );
                          }
                        ),
                      ],
                      ),
                      SizedBox(height: 18,),
                      SearchBar(
                        leading: Icon(Icons.search, color: Colors.black,),
                        hintText: 'Search',
                        backgroundColor: WidgetStateProperty.all(Colors.white),
                        shadowColor: WidgetStateProperty.all(Colors.black54),
                        elevation: WidgetStateProperty.all(4),
                        padding: WidgetStateProperty.all(EdgeInsets.only(left: 18, right: 18)),
                      ),
                      SizedBox(height: 18,),
                      SingleChildScrollView(
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
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}