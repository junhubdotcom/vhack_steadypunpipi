import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:steadypunpipi_vhack/screens/camera/photo.dart';

class CameraPage extends StatefulWidget {
  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? cameraController;
  String? imgPath;
  var imagePicker;

  @override
  void initState() {
    super.initState();
    _initializedCamera();
    imagePicker = new ImagePicker();
  }

  Future<void> _initializedCamera() async {
    final cameras = await availableCameras();
    if (cameras.isEmpty) {
      print('No camera available');
      return;
    }
    cameraController = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );
    try {
      await cameraController!.initialize();
      setState(() {});
    } catch (e) {
      print('Camera initialization error: $e');
    }
  }

  void dispose() {
    cameraController?.dispose();
    super.dispose();
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

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Photo(
                  imgPath: imgPath!,
                )));
  }

  Future<void> _onCapturePressed(context) async {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return;
    }
    try {
      XFile image = await cameraController!.takePicture();
      setState(() {
        imgPath = image.path;
      });
      print("Imag saved at: ${image.path}");
    } catch (e) {
      print("Capture error: $e");
    }

    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => Photo(
                  imgPath: imgPath!,
                )));
  }

  Widget _cameraPreviewWidget() {
    if (cameraController == null || !cameraController!.value.isInitialized) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return AspectRatio(
      aspectRatio: cameraController!.value.aspectRatio,
      child: CameraPreview(cameraController!),
    );
  }

  Widget _cameraControlWidget(context) {
    return Align(
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Center(
            child: IconButton(
              onPressed: () {
                _pickImageFromGallery();
              },
              icon: Icon(
                Icons.photo_library_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          Center(
            child: SizedBox(
              width: 70,
              height: 70,
              child: FloatingActionButton(
                child: Icon(
                  Icons.camera_alt,
                  size: 35,
                  color: Colors.black,
                ),
                backgroundColor: Colors.white,
                shape: CircleBorder(),
                onPressed: () {
                  _onCapturePressed(context);
                },
              ),
            ),
          ),
          Center(
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.autorenew,
                color: Colors.white,
                size: 40,
              ),
            ),
          ),
          // SizedBox(
          //   width: 40,
          // ),
        ],
      ),
    );
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
              Icons.chevron_left_rounded,
              color: Colors.white,
              size: 45,
            )),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(flex: 1, child: _cameraPreviewWidget()),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120,
                width: double.infinity,
                padding: EdgeInsets.all(15),
                color: Colors.black,
                child: _cameraControlWidget(context),
              ),
            )
          ],
        )),
      ),
    );
  }

  void _showCameraException(CameraException e) {
    String errorText = 'Error : ${e.code}\n Error message : ${e.description}';
    print(errorText);
  }
}
