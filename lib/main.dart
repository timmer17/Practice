import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

void main() => runApp(MyFirstPetApp());

class MyFirstPetApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyFirstPetAppState();
  }
}

class _MyFirstPetAppState extends State<MyFirstPetApp> {
  late bool _loading;
  late double _progressValue;
  @override
  void initState() {
    _loading = false;
    _progressValue = 0.0;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: const CupertinoNavigationBar(
          middle: Text(
            "My First Pet App",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 16, 86, 122),
        ),
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                LinearProgressIndicator(value: _progressValue),
                Text('${(_progressValue * 100).round()}%',
                    style: const TextStyle(
                        color: Color.fromARGB(255, 0, 117, 172), fontSize: 20)),
                const SizedBox(height: 15),
                CupertinoButton.filled(
                    child: Icon(Icons.cloud_download_rounded),
                    onPressed: () {
                      setState(() {
                        _loading = !_loading;
                        _updateProgress();
                      });
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateProgress() {
    const oneSec = const Duration(seconds: 1);
    Timer.periodic(oneSec, (Timer t) {
      setState(() {
        _progressValue += 0.2;

        if (_progressValue.toStringAsFixed(1) == '1.0') {
          _loading = false;
          t.cancel();
          _progressValue = 0.0;
          return;
        }
      });
    });
  }
}
