import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pfps_platform/Service/network.dart';

class ViewCard extends StatelessWidget {
  final String deviceid;
  final double watervalue;
  final String barriervalue;
  ViewCard({
    required this.deviceid,
    required this.watervalue,
    required this.barriervalue,
  });

  @override
  Widget build(BuildContext context) {
    final Insert networking = Insert();
    String warning = "0";
    return Card(
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "$deviceid",
                              style: TextStyle(fontSize: 24),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Text(
                                "${watervalue.toStringAsFixed(1)}",
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          child: Text(
                            'mm',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 60,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [waterValueConvert(watervalue), waterValueConvert(watervalue)],
                        colors: [
                          Colors.white,
                          Colors.blue.shade300,
                        ],
                      ),
                      border: Border.all(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                padding:EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  OutlinedButton(
                    child: Text("SW",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () async {
                      try {
                        // warning 변수를 "1"로 설정
                        warning = "1";
                        // 경보 전송
                        await networking.insertWarning(warning);
                        // 경보가 성공적으로 전송되었습니다. 메시지를 다이얼로그로 표시
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("알림"),
                              content: Text("경보가 성공적으로 전송되었습니다."),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("확인"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      } catch (e) {
                        // 에러 발생 시 에러 메시지를 다이얼로그로 표시
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: Text("에러"),
                              content: Text("경보 전송 중 오류가 발생했습니다: $e"),
                              actions: <Widget>[
                                TextButton(
                                  child: Text("확인"),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0), // 원하는 반지름 설정
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    child: Container(
                      width: 70,
                      height: 50,
                      margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                            width: 1,
                            color: Colors.black
                        ),
                        color:
                        barriervalue == "0" ? Colors.blue : Colors.red,
                      ),
                    ),
                  )
                ],
              ),),
          ),
        ],
      ),
    );
  }
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
  return animatedHeight <= 100 ? animatedHeight : 1.0;
}
