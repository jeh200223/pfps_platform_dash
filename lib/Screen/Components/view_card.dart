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
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        stops: [waterValueConvert(watervalue), 0.1],
                        colors: [
                          Colors.blue.shade300,
                          Colors.white,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  OutlinedButton(
                    child: Text("SW",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: (){

                      warning == "1";
                      networking.insertWarning(warning);
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
              ),
          ),
        ],
      ),
    );
  }
}
double waterValueConvert(double watervalue) {
  double minPercentage = 100.0; // 최소 퍼센트
  double maxPercentage = 0.0; // 최대 퍼센트

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
