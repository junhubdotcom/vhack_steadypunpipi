import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

class Issues {
  static final List<Map<String, dynamic>> _reportData = [
    {
      "issueId": 1,
      "image": "assets/images/roadhole1.jpg",
      "title": "Pothole - Jalan Bukit Bintang, Kuala Lumpur",
      "address": "Jalan Bukit Bintang, Kuala Lumpur, 55100, Malaysia",
      "pos": LatLng(3.147372, 101.708595),
      "time": "10:45 AM, March 18, 2025",
      "status": "In Progress",
      "isIoTVerified": true,
      "count": 4,
    },
    {
      "issueId": 4,
      "image": "assets/images/brokenpole1.jpg",
      "title": "Broken Streetlight - Jalan Ampang, Kuala Lumpur",
      "address": "Jalan Ampang, Kuala Lumpur, 50450, Malaysia",
      "pos": LatLng(3.1619, 101.7153),
      "time": "2:30 PM, March 17, 2025",
      "status": "Reported",
      "isIoTVerified": false,
      "count": 3,
    },
    {
      "issueId": 2,
      "image": "assets/images/fallingtree1.jpg",
      "title": "Fallen Tree - Persiaran Surian, Petaling Jaya",
      "address": "Persiaran Surian, Petaling Jaya, 47810, Selangor",
      "pos": LatLng(3.1515, 101.6158),
      "time": "8:15 AM, March 16, 2025",
      "status": "Under Review",
      "isIoTVerified": true,
      "count": 5,
    },
    {
      "issueId": 1,
      "image": "assets/images/roadhole1.jpg",
      "title": "Severe Crack on Road - Lebuhraya Damansara-Puchong",
      "address": "Lebuhraya Damansara-Puchong (LDP), 47301, Selangor",
      "pos": LatLng(3.0902, 101.6064),
      "time": "6:50 PM, March 15, 2025",
      "status": "In Progress",
      "isIoTVerified": false,
      "count": 6,
    },
    {
      "issueId": 1,
      "image": "assets/images/roadhole1.jpg",
      "title": "Pothole - Jalan Kuching, Kuala Lumpur",
      "address": "Jalan Kuching, Kuala Lumpur, 51200, Malaysia",
      "pos": LatLng(3.1899, 101.6817),
      "time": "9:00 AM, March 14, 2025",
      "status": "Resolved",
      "isIoTVerified": true,
      "count": 4,
    },
    {
      "issueId": 3,
      "image": "assets/images/accident1.jpg",
      "title": "Accident - Sentul Boulevard, Jalan Kuching",
      "address": "Sentul Boulevard, Jalan Kuching, 51200, Kuala Lumpur",
      "pos": LatLng(3.1945, 101.6923),
      "time": "4:20 PM, March 13, 2025",
      "status": "Reported",
      "isIoTVerified": true,
      "count": 7,
    },
    {
      "issueId": 6,
      "image": "assets/images/blockedroad.jpg",
      "title": "Blocked Road - One Utama Shopping Centre",
      "address":
          "One Utama Shopping Centre, Lebuhraya Damansara-Puchong, 47800, Petaling Jaya",
      "pos": LatLng(3.1489, 101.6168),
      "time": "11:10 AM, March 12, 2025",
      "status": "Under Review",
      "isIoTVerified": false,
      "count": 2,
    },
    {
      "issueId": 5,
      "image": "assets/images/construction.jpg",
      "title": "Road Construction - IOI Mall Puchong",
      "address":
          "IOI Mall Puchong, Lebuhraya Damansara-Puchong, 47100, Selangor",
      "pos": LatLng(3.0467, 101.6171),
      "time": "5:45 PM, March 11, 2025",
      "status": "In Progress",
      "isIoTVerified": true,
      "count": 3,
    },
  ];

  List<Map<String, dynamic>> get reports => List.unmodifiable(_reportData);

  void addReport({
    required int issueId,
    required LatLng pos,
    required String title,
    required String address,
    required int count,
  }) {
    final String formattedTime = DateFormat('h:mm a, MMMM d, yyyy').format(DateTime.now());
    Map<String, dynamic> report = {
      'issueId': issueId,
      'image': "assets/images/noimage.jpeg",
      'time': formattedTime,
      'status': "Reported",
      'isIoTVerified': false,
      'pos': pos,
      'title': title,
      'address': address,
      'count': count,
    };
    _reportData.add(report);
  }

  static List<Map<String, dynamic>> getAllReports() {
    return _reportData;
  }

  // Map<String, dynamic>? getReport(int index) {
  //   if (index >= 0 && index < _reportData.length) {
  //     return _reportData[index];
  //   }
  //   return null;
  // }

  static Map<String, dynamic>? getReportByIndex(int index) {
    if (index >= 0 && index < _reportData.length) {
      return _reportData[index];
    }
    return null; // Return null if index is invalid
  }

  // void deleteReport(int index) {
  //   if (index >= 0 && index < _reportData.length) {
  //     _reportData.removeAt(index);
  //   }
  // }

  // int getReportCount() {
  //   return _reportData.length;
  // }

  static void incrementUpvotes(int index) {
    if (index >= 0 && index < _reportData.length) {
      final report = _reportData[index];
      if (report.containsKey('count') && report['count'] is int) {
        report['count'] = (report['count'] as int) + 1;
      }
    }
  }

  static void decrementUpvotes(int index) {
    if (index >= 0 && index < _reportData.length) {
      final report = _reportData[index];
      if (report.containsKey('count') && report['count'] is int) {
        report['count'] = (report['count'] as int) - 1;
      }
    }
  }
}
