import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:pfps_platform/Service/network.dart';

class ViewCard extends StatelessWidget {
  final String deviceid;
  final double watervalue;
  final String manual;
  final String barrier_control;
  final String warning;

  ViewCard({
    required this.deviceid,
    required this.watervalue,
    required this.manual,
    required this.barrier_control,
    required this.warning,
  });

  @override
  Widget build(BuildContext context) {
    final Insert networking = Insert();

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
                        stops: const [0.1, 0.7],
                        colors: [
                          Colors.red.shade300,
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center ,
                children: [
                  OutlinedButton(
                    child: Text("SW",
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: (){
                      deviceid;
                      manual;
                      barrier_control;
                      warning == "0" ? "1" : "0";
                      networking.insertWarning(deviceid, manual, barrier_control, warning);
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
                          color: Colors.blue),
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
