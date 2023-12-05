import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart' as html;

class NetworkSendData {
  Future<List<Map<String, dynamic>>> getAllData() async {
    final response = await http.get(
        Uri.parse('http://192.168.0.52/sensor/wemos_app.php?mode=select'));

    if (response.statusCode == 200) {
      try {
        final document = html.parse(response.body);
        final bodyElement = document.body;
        final jsonData = bodyElement?.text; // Null 체크 추가
        if (jsonData != null) {
          // JSON parsing
          return List<Map<String, dynamic>>.from(jsonDecode(jsonData));
        } else {
          throw Exception('서버 응답에서 JSON 데이터를 가져올 수 없습니다.');
        }
      } catch (e) {
        throw Exception('서버 응답에서 JSON 파싱 실패: $e');
      }
    } else {
      throw Exception('서버에서 데이터를 가져오지 못했습니다. HTTP 상태 코드: ${response.statusCode}');
    }
  }
}

class Insert {
  Future<dynamic> insertData(String manual, String barrierControl) async {
    // URL 변경
    final Uri uri = Uri.parse(
        'http://192.168.0.52/sensor/app_wemos.php?mode=insert&manual=$manual&barrier_control=$barrierControl');

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: <String, dynamic>{
        "manual": manual,
        "barrier_control": barrierControl,
      },
    );

    if (response.statusCode == 200) {
      final List<Map<String, dynamic>> data =
      List<Map<String, dynamic>>.from(json.decode(response.body));
      return data;
    } else {
      throw Exception('데이터를 보내지 못했습니다.');
    }
  }
  Future<bool> updateWarning(String device_id) async {
    final Uri uri = Uri.parse(
      'http://192.168.0.52/sensor/app_wemos.php?mode=warning&device_id=$device_id',
    );

    final Map<String, dynamic> data = {
      'device_id': device_id,
    };

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      print("업데이트 성공");
      return true; // 업데이트 성공
    } else {
      throw Exception('데이터를 업데이트하지 못했습니다.');
    }
  }
}