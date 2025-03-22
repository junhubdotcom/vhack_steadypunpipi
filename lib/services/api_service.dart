import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:steadypunpipi_vhack/common/constants.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:steadypunpipi_vhack/models/report.dart';

class ApiService {
  final _model = GenerativeModel(
      model: 'gemini-1.5-pro', apiKey: Constants.GEMINI_API_KEY);

  Future<Report> generateContent(String imgPath) async {
    try {
      final image = File(imgPath);
      final bytes = await image.readAsBytes();
      final String mimeType = 'image/jpeg';
      final String prompt = '''
Analyze the given image and identify the issue it represents. Classify the issue according to the following categories:

- **Title**: Select one from {Pothole, Fallen Tree, Accident, Broken Streetlight, Road Construction, Road Obstruction}.
- **ID**: Assign a corresponding ID based on the title:
  - Pothole = 1
  - Fallen Tree = 2
  - Accident = 3
  - Broken Streetlight = 4
  - Road Construction = 5
  - Road Obstruction = 6
- **Issue Type**: Choose one from [Road and Traffic Issues, Public Infrastructure, Environment and Safety, Utility Issues].
- **Severity**: Choose one from [High, Medium, Low] based on the potential impact of the issue.
- **Urgency Level**: Choose one from [High, Medium, Low] based on how quickly it requires attention.
- **Responsible Department**: Assign the issue to the most relevant department from:
  - Jabatan Kerja Raya
  - Pihak Berkuasa Tempatan
  - Jabatan Pengangkutan Jalan
  - Agensi Pengurusan Bencana Negara
  - SWCorp
  - BOMBA 
  - Tenaga Nasional Berhad
  - Penyedia Air Negeri
  - Jabatan Alam Sekitar

**Return only a valid JSON object in the following format:**

{
  "id": <corresponding ID>,
  "title": "<selected title>",
  "issue_type": "<selected issue type>",
  "severity": "<selected severity level>",
  "urgency": "<selected urgency level>",
  "responsible_department": "<selected responsible department>"
}

⚠️ **Do not include any code block formatting (e.g., triple backticks or `json` tags). Return only the JSON object.**
''';

      final response = await _model.generateContent([
        Content.multi([TextPart("$prompt"), DataPart(mimeType, bytes)])
      ]);

      print(response.text);

      final jsonResponse = jsonDecode(response.text ?? '{}');
      print(jsonResponse);
      return Report.fromJson(jsonResponse);
    } catch (e) {
      throw Exception('Error generating content: $e');
    }
  }

  // Future<Map<String, dynamic>?> classifyImage(String imagePath) async {
  //   try {
  //     final bytes = File(imagePath).readAsBytesSync();
  //     final String base64Image = base64Encode(bytes);

  //     final response = await http.post(
  //       Uri.parse("https://vision.googleapis.com/v1/images:annotate?key= ${Constants.GOOGLE_VISION_API_KEY}"),
  //       headers: {'Content-Type': 'application/json'},
  //       body: jsonEncode({
  //         'requests': [
  //           {
  //             'image': {'content': base64Image},
  //             'features': [
  //               {'type': 'LABEL_DETECTION'},
  //               {'type': 'OBJECT_LOCALIZATION'},
  //               {'type': 'WEB_DETECTION'},
  //               {'type': 'IMAGE_PROPERTIES'},
  //             ]
  //           }
  //         ]
  //       }),
  //     );

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       print('Error: ${response.statusCode}, ${response.body}');
  //       return null;
  //     }
  //   } catch (e) {
  //     print('Exception: $e');
  //     return null;
  //   }
  // }
}
