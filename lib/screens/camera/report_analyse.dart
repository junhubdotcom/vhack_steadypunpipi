import 'dart:io';
import 'package:flutter/material.dart';
import 'package:steadypunpipi_vhack/models/report.dart';
import 'package:steadypunpipi_vhack/models/report_data.dart';
import 'package:steadypunpipi_vhack/screens/map/map.dart';
import 'package:steadypunpipi_vhack/screens/reportList/report_detail.dart';
import 'package:steadypunpipi_vhack/widget/camera/fill_box.dart';
import 'package:steadypunpipi_vhack/widget/camera/label.dart';
import 'package:steadypunpipi_vhack/widget/camera/level.dart';

class ReportAnalyse extends StatefulWidget {
  final Report report;
  final String imgPath;
  const ReportAnalyse({
    required this.report,
    required this.imgPath,
    super.key,
  });

  @override
  State<ReportAnalyse> createState() => _ReportAnalyseState();
}

class _ReportAnalyseState extends State<ReportAnalyse> {
  late TextEditingController issue_controller;
  late TextEditingController time_controller;
  late TextEditingController location_controller;
  late TextEditingController nearby_landmark_controller;
  late TextEditingController description_controller;
  late String titleDropdownValue;
  late String issueTypeDropdownValue;
  late String departmentResponsibleDropdownValue;

  @override
  void initState() {
    super.initState();
    issue_controller = TextEditingController(text: "${widget.report.title}");
    time_controller = TextEditingController(text: "${widget.report.time}");
    location_controller =
        TextEditingController(text: "${widget.report.location}");
    nearby_landmark_controller = TextEditingController();
    description_controller = TextEditingController();
    widget.report.fetchLocation().then((_) {
      setState(() {
        location_controller.text = widget.report.location;
      });
    });
    titleDropdownValue = "${widget.report.title}";
    issueTypeDropdownValue = "${widget.report.issueType}";
    departmentResponsibleDropdownValue =
        "${widget.report.responsibleDepartment}";
  }

  @override
  void dispose() {
    issue_controller.dispose();
    time_controller.dispose();
    location_controller.dispose();
    nearby_landmark_controller.dispose();
    description_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.chevron_left,
              size: 35,
            )),
        centerTitle: true,
        title: Text(
          'Report',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.file(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.32,
                File(widget.imgPath),
                fit: BoxFit.cover,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(title: "Title"),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          filled: true,
                          fillColor: Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none)),
                      value: titleDropdownValue,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16),
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          titleDropdownValue = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Pothole',
                          child: Text('Pothole'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Fallen Tree',
                          child: Text('Fallen Tree'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Clogged Drain',
                          child: Text('Clogged Drain'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Broken Streetlight',
                          child: Text('Broken Streetlight'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Damaged Sidewalk',
                          child: Text('Damaged Sidewalk'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Blocked Street Sign',
                          child: Text('Blocked Street Sign'),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Label(title: "Issue Type"),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          filled: true,
                          fillColor: Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none)),
                      value: issueTypeDropdownValue,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16),
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          issueTypeDropdownValue = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Road and Traffic Issues',
                          child: Text('Road and Traffic Issues'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Public Infrastructure',
                          child: Text('Public Infrastructure'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Environment and Safety',
                          child: Text('Environment and Safety'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Utility Issues',
                          child: Text('Utility Issues'),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 12,
                    // ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(title: "Urgency Level"),
                              Level(levelText: '${widget.report.urgency}'),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Label(title: "Severity Level"),
                              Level(levelText: '${widget.report.severity}'),
                            ],
                          ),
                        ],
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Label(title: "Time"),
                    FillBox(
                      textEditingController: time_controller,
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Label(title: "Location"),
                    FillBox(
                      textEditingController: location_controller,
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_searching),
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Label(title: "Nearby Landmark"),
                    FillBox(
                      textEditingController: nearby_landmark_controller,
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 5, left: 10),
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.black, // Background color
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.add),
                        color: Colors.white, // Icon color
                      ),
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Label(title: "Department Responsible"),
                    DropdownButtonFormField<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          filled: true,
                          fillColor: Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none)),
                      value: departmentResponsibleDropdownValue,
                      style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 16),
                      icon: Icon(Icons.arrow_drop_down),
                      onChanged: (String? newValue) {
                        setState(() {
                          departmentResponsibleDropdownValue = newValue!;
                        });
                      },
                      items: [
                        DropdownMenuItem<String>(
                          value: 'Jabatan Kerja Raya',
                          child: Text('Jabatan Kerja Raya'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Pihak Berkuasa Tempatan',
                          child: Text('Pihak Berkuasa Tempatan'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Jabatan Pengangkutan Jalan',
                          child: Text('Jabatan Pengangkutan Jalan'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Agensi Pengurusan Bencana Negara',
                          child: Text('Agensi Pengurusan Bencana Negara'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'SWCorp',
                          child: Text('SWCorp'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'BOMBA',
                          child: Text('BOMBA'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Tenaga Nasional Berhad',
                          child: Text('Tenaga Nasional Berhad'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Penyedia Air Negeri',
                          child: Text('Penyedia Air Negeri'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Jabatan Alam Sekitar',
                          child: Text('Jabatan Alam Sekitar'),
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: 8,
                    // ),
                    Label(title: "Desscription (Optional)"),
                    FillBox(
                      textEditingController: description_controller,
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapPage()));
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                          ),
                        ),
                        // SizedBox(width: 5),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ElevatedButton(
                            onPressed: () {
                              _showTopSnackBar(context);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => MapPage()));

                              // if (widget.imgPath != null) {
                              //   try {
                              //     Navigator.push(
                              //       context,
                              //       MaterialPageRoute(
                              //         builder: (context) => ReportDetailPage(
                              //           image: widget.imgPath,
                              //           title: titleDropdownValue,
                              //           time: time_controller.text,
                              //           status: "Reported",
                              //           isIoTVerified: false,
                              //         ),
                              //       ),
                              //     );
                              //   } catch (e) {
                              //     print("Navigation failed: $e");
                              //   }
                              // } else {
                              //   print("Image path is null");
                              // }

                              // final newReport = {
                              //   "image": widget.imgPath,
                              //   "title": titleDropdownValue,
                              //   "time": time_controller.text,
                              //   "status": "Reported",
                              //   "isIoTVerified": false,
                              // };
                              // reportData.add(newReport);
                              // addReportDetail(
                              //     image: widget.imgPath,
                              //     title: titleDropdownValue,
                              //     time: time_controller.text,
                              //     status: "Reported",
                              //     isIoTVerified: false);

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => ReportDetailPage(
                              //             image: widget.imgPath,
                              //             title: titleDropdownValue,
                              //             time: time_controller.text,
                              //             status: "Reported",
                              //             isIoTVerified: false
                              //             // viewAfterSubmit: true,
                              //             )));
                            },
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff9eed88)),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showTopSnackBar(BuildContext context) {
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: MediaQuery.of(context).padding.top + 10, // Adjusts for status bar
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 5,
                  spreadRadius: 1,
                )
              ],
            ),
            child: Row(
              children: [
                Icon(Icons.check_circle, color: Colors.white, size: 30),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "The report has been submitted",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Remove the snackbar after 3 seconds
    Future.delayed(Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
