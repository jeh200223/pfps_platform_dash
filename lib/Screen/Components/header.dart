import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timer_builder/timer_builder.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  Widget build(Object context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                  style: BorderStyle.solid,
                  color: Colors.black
              )
          ),
          child: const Expanded(
            flex: 1,
            child: Text(
              "공공시설 수해 방지 플랫폼",
              style: TextStyle(
                fontSize: 40,
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
        Expanded(
          child: Container(
            padding: EdgeInsets.fromLTRB(0, 6, 0, 4),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                style: BorderStyle.solid,
                color: Colors.black
              )
            ),
            child: Expanded(
            flex: 1,
            child: TimerBuilder.periodic(const Duration(seconds: 1),
                builder: (context) {
                  // 1초마다 화면을 다시 그리고 현재 시간을 표시
                  return Text(
                    DateFormat('yyy-MM-dd a hh:mm ss')
                        .format(DateTime.now()), // 현재 시간을 HH:mm:ss 형식으로 표시
                    style: const TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      decoration: TextDecoration.none,
                    ),
                    textAlign: TextAlign.center,
                  );
                }),
          ),
        ),)

      ],
    );
  }
}
