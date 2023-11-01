import 'dart:ui';
import 'package:flutter/material.dart';

class ViewCard extends StatelessWidget {
  final String deviceid;
  final double watervalue;
  ViewCard({
    required this.deviceid,
    required this.watervalue,
  });

  @override
  Widget build(BuildContext context) {
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
          const Expanded(
              flex: 1,
              child: Row(
                children: [

                ],
              ),
          ),
        ],
      ),
    );
  }
}
