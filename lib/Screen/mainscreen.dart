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
      List<Map<String, dynamic>> devicedataList1 = await NetworkSendData().getAllData();

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
    _timer = Timer.periodic(const Duration(milliseconds: 500), (Timer t) {
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
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        for (int i = 0; i < _devicedataList1.length; i++)
                          SizedBox(width: 200, child: ViewCard(
                            deviceid: "${_devicedataList1[i]["device_id"]}",
                            watervalue: _parseDouble(_devicedataList1[i]["water_value"]),
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
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: FlutterMap(
                      options: const MapOptions(
                        center: LatLng(37.508883, 127.100015),
                        zoom: 15,
                      ),
                      children: [
                        TileLayer(
                          urlTemplate:
                              'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                          userAgentPackageName:
                              'com.ctrls.ipms.parkshare.parkshare',
                        ),
                        const MarkerLayer(markers: [
                          Marker(
                            point: LatLng(37.508883, 127.100015),
                            child: Icon(Icons.yard),
                          ),
                          Marker(
                            point: LatLng(37.518783, 127.100015),
                            child: Icon(Icons.yard),
                          ),
                        ])
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    decoration:
                        BoxDecoration(border: Border.all(color: Colors.black)),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                '번호',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '위치이름',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '수위',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '온도',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '습도',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'IP주소',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '상태',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                '조치',
                                style: listViewTitleStyle(),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        Expanded(
                          flex: 4,
                          child: Container(
                            child: ListView.builder(
                              itemCount: _devicedataList1.length,
                              itemBuilder: (context, index) => ListTile(
                                title:
                                    _devicedataList1.isNotEmpty?
                                Row(
                                  children: [
                                    Expanded(child: Text("${_devicedataList1[index]["device_id"]}")),
                                    Expanded(child: Text("${_devicedataList1[index]["address"]}")),
                                    Expanded(child: Text("${_devicedataList1[index]["water_value"]}")),
                                    Expanded(child: Text("${_devicedataList1[index]["temp_value"]}")),
                                    Expanded(child: Text("${_devicedataList1[index]["humi_value"]}")),
                                    Expanded(child: Text("data$index")),
                                    Expanded(child: Text("${_devicedataList1[index]["barrier_value"] == "0" ? "꺼짐" : "켜짐"}")),
                                    Expanded(child: Text("${_devicedataList1[index]["barrier_value"] == "0" ? "꺼짐" : "켜짐"}")),
                                  ],
                                ): Row(),
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
    fontSize: 15.2,
    fontWeight: FontWeight.bold,
  );
}
