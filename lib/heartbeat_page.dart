import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; //for vibrations
import 'dart:io'; //for sleep
import 'home_page_master.dart';

class HeartbeatScreen extends StatefulWidget {
  const HeartbeatScreen({Key? key}) : super(key: key);

  @override
  State<HeartbeatScreen> createState() => _HeartbeatScreenState();
}

class _HeartbeatScreenState extends State<HeartbeatScreen> {
  _PatternVibrate() {
    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 500),
    );

    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 200),
    );
    HapticFeedback.mediumImpact();

    sleep(
      const Duration(milliseconds: 500),
    );
  }

  @override
  Widget build(BuildContext context) {
    bool run=false;
    return Scaffold(
        appBar: AppBar(
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Focusing on the touch sensation helps you ground yourself."),
            ),
            ElevatedButton(
              child: Text('Start'),
              onPressed: () {
                run=true;
                // while(run==true) {
                //   _PatternVibrate();
                // }
                _PatternVibrate();
              },
            ),
            Icon(
              Icons.favorite,
              color: Color(0xFFFCDBF8),
              size: 300,
            ),
            ElevatedButton(
              child: Text('Stop'),
              onPressed: () {
                run=false;
              },
            ),
          ],
        ));
  }
}