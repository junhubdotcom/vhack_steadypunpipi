import 'package:google_maps_flutter/google_maps_flutter.dart';

class Issues {
  final List<Map<String, dynamic>> _reports = [
    {
      'id': 1,
      'title': 'Pothole',
      'address': 'No 123, Lorong 123, Jalan 123',
      'pos': LatLng(37.3317, -122.0291),
      'count': 12,
    },
    {
      'id': 4,
      'title': 'Broken Streetlight',
      'address': 'No 123, Lorong 123, Jalan 123',
      'pos': LatLng(37.3396, -122.0224),
      'count': 8,
    },
    {
      'id': 2,
      'title': 'Fallen Tree',
      'address': 'No 123, Lorong 123, Jalan 123',
      'pos': LatLng(37.337826, -122.032356),
      'count': 5,
    },
  ];

  List<Map<String, dynamic>> get reports => List.unmodifiable(_reports);

  void addReport({
    required int id,
    required LatLng pos,
    required String title,
    required String address,
    required int count,
    }) {
    Map<String, dynamic> report = {
      'id': id,
      'pos': pos,
      'title': title,
      'address': address,
      'count': count,
    };
    _reports.add(report);
  }

  Map<String, dynamic>? getReport(int index) {
    if (index >= 0 && index < _reports.length) {
      return _reports[index];
    }
    return null;
  }

  void deleteReport(int index) {
    if (index >= 0 && index < _reports.length) {
      _reports.removeAt(index);
    }
  }

  int getReportCount() {
    return _reports.length;
  }
}
