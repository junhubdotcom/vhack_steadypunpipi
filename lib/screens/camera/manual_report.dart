import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:steadypunpipi_vhack/models/report.dart';
import 'package:steadypunpipi_vhack/widget/camera/fill_box.dart';
import 'package:steadypunpipi_vhack/widget/camera/label.dart';

class ManualReport extends StatefulWidget {
  const ManualReport({super.key});

  @override
  State<ManualReport> createState() => _ManualReportState();
}

class _ManualReportState extends State<ManualReport> {
  String? imgPath;
  var imagePicker;
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
    imagePicker = ImagePicker();
    issue_controller = TextEditingController();
    time_controller = TextEditingController();
    location_controller = TextEditingController();
    nearby_landmark_controller = TextEditingController();
    description_controller = TextEditingController();
    titleDropdownValue = "Select title";
    issueTypeDropdownValue = "Select issue type";
    departmentResponsibleDropdownValue = "Select department responsible";
  }

  Future<void> _pickImageFromGallery() async {
    XFile? image = await imagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      print("No image selected");
      return;
    }
    setState(() {
      imgPath = image.path;
    });
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
          'Manual Report',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              imgPath != null
                  ? Image.file(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height * 0.32,
                      File(imgPath!),
                      fit: BoxFit.cover,
                    )
                  : GestureDetector(
                      onTap: () {
                        _pickImageFromGallery();
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.32,
                          decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: Colors.black, width: 1)),
                          child: Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 40,
                          )),
                    ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Label(title: "Title"),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          filled: true,
                          fillColor: Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none)),
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
                          value: 'Accident',
                          child: Text('Accident'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Broken Streetlight',
                          child: Text('Broken Streetlight'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Road Construction',
                          child: Text('Road Construction'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Road Obstruction',
                          child: Text('Road Obstruction'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Label(title: "Issue Type"),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          filled: true,
                          fillColor: Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none)),
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
                    SizedBox(
                      height: 8,
                    ),
                    Label(title: "Time"),
                    FillBox(
                      textEditingController: time_controller,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Label(title: "Location"),
                    FillBox(
                      textEditingController: location_controller,
                      trailing: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.location_searching),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Label(title: "Nearby Landmark"),
                    FillBox(
                      textEditingController: nearby_landmark_controller,
                    ),
                    Container(
                      width: 40,
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
                    SizedBox(
                      height: 8,
                    ),
                    Label(title: "Department Responsible"),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                          filled: true,
                          fillColor: Color(0xffd9d9d9),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: BorderSide.none)),
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
                    SizedBox(
                      height: 8,
                    ),
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
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Cancel',
                              style: TextStyle(color: Colors.white),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black),
                          ),
                        ),
                        SizedBox(width: 5),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          child: ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Submit',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xff9eed88)),
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
      ),
    );
  }
}
