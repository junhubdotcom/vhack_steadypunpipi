import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

class Report {
  int id;
  String title;
  String issueType;
  String time;
  String severity;
  String urgency;
  String location;
  String responsibleDepartment;

  Report({
    required this.id,
    required this.title,
    required this.issueType,
    required this.severity,
    required this.urgency,
    required this.responsibleDepartment,
  })  : time = DateFormat('dd MMMM yy HH:mm').format(DateTime.now()),
        location = "Fetching location..." {
    fetchLocation();
  }

  /// Sets the current location asynchronously
  Future<void> fetchLocation() async {
    try {
      Position position = await _determinePosition();
      List<Placemark> places =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = places[0];

      location =
          "${placemark.name}, ${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
    } catch (e) {
      location = "Location unavailable";
    }
  }

  /// Gets the current position of the user
  Future<Position> _determinePosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions');
    }

    return await Geolocator.getCurrentPosition();
  }

  /// Factory constructor to create a report from JSON
  factory Report.fromJson(Map<String, dynamic> json) {
    return Report(
      id: json['id'] != null ? int.tryParse(json['id'].toString()) ?? 0 : 0,
      title: json['title'] ?? "Unknown",
      issueType: json['issue_type'] ?? "Unknown",
      severity: json['severity'] ?? "Unknown",
      urgency: json['urgency'] ?? "Unknown",
      responsibleDepartment: json['responsible_department'] ?? "Unknown",
    );
  }
}
