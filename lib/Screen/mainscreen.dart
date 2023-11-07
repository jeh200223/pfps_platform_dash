import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:pfps_platform/Model/basic_model.dart';
import 'package:pfps_platform/Screen/Components/header.dart';
import 'package:pfps_platform/Screen/Components/view_card.dart';
import '../Service/network.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Map<String, dynamic>> _devicedataList1 = [];
  late Timer _timer;

  void getDatas() async {
    try {
      List<Map<String, dynamic>> devicedataList1 =
          await NetworkSendData().getAllData();
      setState(() {
        _devicedataList1 = devicedataList1;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getDatas();
    _timer = Timer.periodic(const Duration(milliseconds: 400), (Timer t) {
      getDatas();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: false,
        title: const Header(),
        backgroundColor: Colors.transparent,
        shadowColor: Colors.transparent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < _devicedataList1.length; i++)
                          SizedBox(
                            width: 180,
                            child: ViewCard(
                              deviceid: "${_devicedataList1[i]["device_id"]}",
                              address: "${_devicedataList1[i]["address"]}",
                              watervalue: 15-_parseDouble(
                                  _devicedataList1[i]["water_value"]),
                              barriervalue:
                                  "${_devicedataList1[i]["barrier_value"]}",
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: FlutterMap(
                      options: const MapOptions(
                        center: LatLng(37.636665, 127.216530),
                        zoom: 11.5,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'com.ctrls.ipms.parkshare.parkshare',
                        ),
                        MarkerLayer(markers: [
                          Marker(
                            point: LatLng(37.735244, 127.209749),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D001",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.618957, 126.921186),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D002",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.637990, 127.025621),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D003",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.720356, 127.203526),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D004",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.586861, 127.208891),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D005",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.667788, 127.116194),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D006",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.651905, 127.178957),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D007",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.652840, 127.311716),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D008",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.631839, 127.150548),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D009",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                          Marker(
                            point: LatLng(37.696386, 127.220135),
                            width: 110,
                            height: 70,
                            child: Column(
                              children: [
                                SizedBox(height: 10),
                                Icon(Icons.location_on, size: 30, color: Colors.blue),
                                Text(
                                  "D010",
                                  style: TextStyle(color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.black, width: 1.0),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                            bottom: BorderSide(width: 1),
                          )),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                    border: Border(right: BorderSide(width: 1)),
                                  ),
                                  child: Text(
                                    '관리번호',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,

                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(right: BorderSide(width: 1))),
                                  child: Text(
                                    '시설위치',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(right: BorderSide(width: 1))),
                                  child: Text(
                                    '수위',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(right: BorderSide(width: 1))),
                                  child: Text(
                                    '온도',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(right: BorderSide(width: 1))),
                                  child: Text(
                                    '습도',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(right: BorderSide(width: 1))),
                                  child: Text(
                                    '경고상태',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border:
                                          Border(right: BorderSide(width: 1))),
                                  child: Text(
                                    '차단기',
                                    style: listViewTitleStyle(),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: ListView.builder(
                              itemCount: _devicedataList1.length,
                              itemBuilder: (context, index) => Container(
                                decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 1)),
                                ),
                                child: Column(
                                  children: [
                                    _devicedataList1.isNotEmpty
                                        ? Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      "${_devicedataList1[index]["device_id"]}",
                                                      textAlign:
                                                          TextAlign.center, style: TextStyle(fontSize: 18),),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      "${_devicedataList1[index]["address"]}",
                                                      textAlign:
                                                          TextAlign.center, style: TextStyle(fontSize: 18),),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      "${15-_parseDouble(_devicedataList1[index]["water_value"])}",
                                                      textAlign:
                                                          TextAlign.center, style: TextStyle(fontSize: 18),),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      "${_devicedataList1[index]["temp_value"]}",
                                                      textAlign:
                                                          TextAlign.center, style: TextStyle(fontSize: 18),),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      "${_devicedataList1[index]["humi_value"]}",
                                                      textAlign:
                                                          TextAlign.center, style: TextStyle(fontSize: 18),),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      _parseDouble(_devicedataList1[index]["water_value"]) > 15.0 ? "평시" :
                                                      _parseDouble(_devicedataList1[index]["water_value"]) <= 15.0 && _parseDouble(_devicedataList1[index]["water_value"]) > 10.0 ? "주의" :
                                                      _parseDouble(_devicedataList1[index]["water_value"]) <= 10.0 && _parseDouble(_devicedataList1[index]["water_value"]) >= 0.0 ? "비상" : "오류",
                                                      textAlign: TextAlign.center, style: TextStyle(fontSize: 18),),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border(
                                                        right: BorderSide(
                                                            width: 1)),
                                                  ),
                                                  child: Text(
                                                      "${_devicedataList1[index]["barrier_value"] == "0" ? "OFF" : "ON"}",
                                                      textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: _devicedataList1[index]["barrier_value"] == "0" ? Colors.blue : Colors.red,
                                                      fontSize: 18,
                                                      fontWeight: FontWeight.bold),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        : Row(),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

int _parseInt(String value) {
  try {
    int parsedValue = int.parse(value);
    // toFixedString을 사용하여 원하는 소수점 자릿수까지 출력
    return parsedValue;
  } catch (e) {
    // 파싱에 실패한 경우 0.0을 반환하거나 다른 기본값을 사용할 수 있습니다.
    return 0; // 또는 다른 기본값
  }
}

double _parseDouble(String value) {
  try {
    double parsedValue = double.parse(value);
    // toFixedString을 사용하여 원하는 소수점 자릿수까지 출력
    return double.parse(parsedValue.toStringAsFixed(1));
  } catch (e) {
    // 파싱에 실패한 경우 0.0을 반환하거나 다른 기본값을 사용할 수 있습니다.
    return 0.0; // 또는 다른 기본값
  }
}

TextStyle listViewTitleStyle() {
  return const TextStyle(
    height: 3.0,
    fontSize: 22.2,
    fontWeight: FontWeight.bold,
  );
}

double waterValueConvert(double watervalue) {
  double minPercentage = 0.0; // 최소 퍼센트
  double maxPercentage = 15.0; // 최대 퍼센트

  double minValue = 0.0; // 최소 값
  double maxValue = 1.0; // 최대 값

  double percentage = watervalue; // 변환할 퍼센트 값

// 퍼센트 값을 최소 값과 최대 값 사이로 변환
  double animatedHeight = (maxValue - minValue) *
          (percentage - minPercentage) /
          (maxPercentage - minPercentage) +
      minValue;
  print(animatedHeight);
  return animatedHeight;
}
