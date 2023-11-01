import 'dart:convert';
import 'package:http/http.dart' as http;

class NetworkSendData {
  Future<List<Map<String, dynamic>>> getAllData() async {
    final response = await http.get(
        Uri.parse('http://capstone.dothome.co.kr/sensor/wemos_app.php?mode=select'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('데이터를 받아오지 못했습니다.');
    }
  }

  Future<List<Map<String, dynamic>>> getBarrierData() async {
    final response = await http.get(
        Uri.parse('http://capstone.dothome.co.kr/sensor/app_wemos.php?mode=select'));

    if (response.statusCode == 200) {
      return List<Map<String, dynamic>>.from(jsonDecode(response.body));
    } else {
      throw Exception('데이터를 받아오지 못했습니다.');
    }
  }
}

class Insert {
  Future<dynamic> insertData(String manual, String barrierControl) async {
    // URL 변경
    final Uri uri = Uri.parse(
        'http://capstone.dothome.co.kr/sensor/app_wemos.php?mode=insert&manual=$manual&barrier_control=$barrierControl');

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
  Future<dynamic> insertWarning(String deviceid, String manual, String barrierControl, String warning) async {
    final Uri uri = Uri.parse(
      'http://capstone.dothome.co.kr/sensor/app_wemos.php?mode=insert&manual=$manual&barrier_control=$barrierControl',
    );

    final Map<String, dynamic> data = {
      'deviceid': deviceid,
      'manual': manual,
      'barrier_control': barrierControl,
      'warning': warning,
    };

    final response = await http.post(
      uri,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );

    if (response.statusCode == 200) {
      try {
        final jsonData = json.decode(response.body);
        // JSON 파싱 및 데이터 처리
      } catch (e) {
        print('서버 응답은 유효한 JSON 형식이 아닙니다.');
      }
    } else {
      throw Exception('데이터를 보내지 못했습니다.');
    }
  }
}