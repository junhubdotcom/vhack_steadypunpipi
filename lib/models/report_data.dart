class Issues {
  static final List<Map<String, dynamic>> _reportData = [
    {
      "reportNo": "CBA1234567890",
      "title": "Pothole found in Jalan Bukit Bintang",
      "description":
          "A pothole was found in Jalan Bukit Bintang, causing inconvenience to road users.",
      "image": "assets/images/roadhole1.jpg",
      "issueType": "Pothole",
      "address": "Jalan Bukit Bintang, Kuala Lumpur, 55100, Malaysia",
      "urgencyLevel": "High",
      "severityLevel": "Severe",
      "time": "10:45 AM, March 18, 2025",
      "status": "In Progress",
      "isIoTVerified": true,
      "count": 4
    },
    {
      "reportNo": "CBA1234567891",
      "title": "Broken Streetlight in Jalan Ampang",
      "description":
          "A streetlight was found broken on Jalan Ampang, causing poor visibility at night.",
      "image": "assets/images/brokenpole1.jpg",
      "issueType": "Broken Streetlight",
      "address": "Jalan Ampang, Kuala Lumpur, 50450, Malaysia",
      "urgencyLevel": "Medium",
      "severityLevel": "Moderate",
      "time": "2:30 PM, March 17, 2025",
      "status": "Reported",
      "isIoTVerified": false,
      "count": 3
    },
    {
      "reportNo": "CBA1234567892",
      "title": "Fallen Tree in Persiaran Surian",
      "description":
          "A tree has fallen on Persiaran Surian, partially blocking the road.",
      "image": "assets/images/fallingtree1.jpg",
      "issueType": "Fallen Tree",
      "address": "Persiaran Surian, Petaling Jaya, 47810, Selangor",
      "urgencyLevel": "High",
      "severityLevel": "Severe",
      "time": "8:15 AM, March 16, 2025",
      "status": "Under Review",
      "isIoTVerified": true,
      "count": 5
    },
    {
      "reportNo": "CBA1234567893",
      "title": "Clogged Drain in Lebuhraya Damansara-Puchong",
      "description":
          "A clogged drain was reported on LDP, causing waterlogging.",
      "image": "assets/images/cloggeddrain1.jpg",
      "issueType": "Blocked Drain",
      "address": "Lebuhraya Damansara-Puchong (LDP), 47301, Selangor",
      "urgencyLevel": "Medium",
      "severityLevel": "Moderate",
      "time": "6:50 PM, March 15, 2025",
      "status": "In Progress",
      "isIoTVerified": false,
      "count": 6
    },
    {
      "reportNo": "CBA1234567894",
      "title": "Damaged Sidewalk in Jalan Kuching",
      "description":
          "A damaged sidewalk was found on Jalan Kuching, posing a hazard to pedestrians.",
      "image": "assets/images/dmgsidewalk1.jpg",
      "issueType": "Damaged Sidewalk",
      "address": "Jalan Kuching, Kuala Lumpur, 51200, Malaysia",
      "urgencyLevel": "Low",
      "severityLevel": "Moderate",
      "time": "9:00 AM, March 14, 2025",
      "status": "Resolved",
      "isIoTVerified": true,
      "count": 4
    },
    {
      "reportNo": "CBA1234567895",
      "title": "Blocked Street Sign in Sentul Boulevard",
      "description":
          "A street sign on Sentul Boulevard is blocked, making navigation difficult.",
      "image": "assets/images/blockstreetsign1.jpeg",
      "issueType": "Blocked Street Sign",
      "address": "Sentul Boulevard, Jalan Kuching, 51200, Kuala Lumpur",
      "urgencyLevel": "Low",
      "severityLevel": "Low",
      "time": "4:20 PM, March 13, 2025",
      "status": "Reported",
      "isIoTVerified": true,
      "count": 7
    },
    {
      "reportNo": "CBA1234567896",
      "title": "Pothole in One Utama Shopping Centre",
      "description":
          "A pothole was found near One Utama Shopping Centre, affecting traffic flow.",
      "image": "assets/images/pothole2.jpg",
      "issueType": "Pothole",
      "address":
          "One Utama Shopping Centre, Lebuhraya Damansara-Puchong, 47800, Petaling Jaya",
      "urgencyLevel": "Medium",
      "severityLevel": "Moderate",
      "time": "11:10 AM, March 12, 2025",
      "status": "Under Review",
      "isIoTVerified": false,
      "count": 2
    },
    {
      "reportNo": "CBA1234567897",
      "title": "Broken Streetlight in IOI Mall Puchong",
      "description":
          "A broken streetlight was found near IOI Mall Puchong, reducing visibility at night.",
      "image": "assets/images/brokenpole2.jpg",
      "issueType": "Broken Streetlight",
      "address":
          "IOI Mall Puchong, Lebuhraya Damansara-Puchong, 47100, Selangor",
      "urgencyLevel": "Medium",
      "severityLevel": "Moderate",
      "time": "5:45 PM, March 11, 2025",
      "status": "In Progress",
      "isIoTVerified": true,
      "count": 3
    }
  ];

  //List<Map<String, dynamic>> get reports => List.unmodifiable(_reportData);

  // void addReport({
  //   required int issueId,
  //   required LatLng pos,
  //   required String title,
  //   required String address,
  //   required int count,
  // }) {
  //   final String formattedTime = DateFormat('h:mm a, MMMM d, yyyy').format(DateTime.now());
  //   Map<String, dynamic> report = {
  //     'issueId': issueId,
  //     'image': "assets/images/noimage.jpeg",
  //     'time': formattedTime,
  //     'status': "Reported",
  //     'isIoTVerified': false,
  //     'pos': pos,
  //     'title': title,
  //     'address': address,
  //     'count': count,
  //   };
  //   _reportData.add(report);
  // }

  static List<Map<String, dynamic>> getAllReports() {
    return _reportData;
  }

// void addReportDetail({
//   required String image,
//   required String title,
//   required String time,
//   required String status,
//   required bool isIoTVerified,
// }) {
//   Map<String, dynamic> reportDetails = {
//     'image': image,
//     'title': title,
//     'time': time,
//     'status': status,
//     'isIoTVerified': isIoTVerified,
//   };
//   reportData.add(reportDetails);
// }

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
