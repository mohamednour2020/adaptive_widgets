import 'dart:developer';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class AdaptiveWidgets extends StatefulWidget {
  const AdaptiveWidgets({Key? key}) : super(key: key);

  @override
  State<AdaptiveWidgets> createState() => _AdaptiveWidgetsState();
}

class _AdaptiveWidgetsState extends State<AdaptiveWidgets> {
  bool isSwitched = false;
  bool isSwitched2 = false;
  double _sliderValue = 0.0;

  @override
  Widget build(BuildContext context) {
    // isIOS checker should be inside the build method
    bool isIOS = Platform.isIOS;

    return Scaffold(
      appBar: AppBar(
        title: isIOS ? const Text("iOS") : const Text("Android"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          // -------------- Adaptive Button --------------
          Center(
            child: isIOS
                ? CupertinoButton.filled(
                    onPressed: showAdaptiveDialogs,
                    child: const Text('iOS Button'),
                  )
                : ElevatedButton(
                    onPressed: showAdaptiveDialogs,
                    child: const Text('Android Button'),
                  ),
          ),
          // -------------- Adaptive Switch --------------
          Switch.adaptive(
            value: isSwitched,
            onChanged: (newValue) {
              setState(() {
                isSwitched = newValue;
                if (kDebugMode) {
                  print(isSwitched);
                }
              });
            },
            activeTrackColor: Colors.lightGreenAccent,
            activeColor: Colors.green,
          ),
          // ---------- Adaptive SwitchListTile ----------
          SwitchListTile.adaptive(
              title: const Text('SwitchListTile'),
              value: isSwitched2,
              onChanged: (newValue) {
                setState(() {
                  isSwitched2 = newValue;
                });
              }),
          // -------------- Adaptive Slider ---------------
          Slider.adaptive(
            value: _sliderValue,
            min: 0.0,
            max: 10.0,
            divisions: 10,
            label: _sliderValue.toString(),
            onChanged: (newValue) {
              setState(() {
                _sliderValue = newValue;
                log(_sliderValue.toString());
              });
            },
          ),
          // -------- Adaptive CircularProgressIndicator ---------
          const CircularProgressIndicator.adaptive(),

          // ------------------ Adaptive IconButton -------------------
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.adaptive.arrow_back, size: 30),
                onPressed: () {
                  if (kDebugMode) {
                    print('Back');
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.arrow_forward, size: 30),
                onPressed: () {
                  if (kDebugMode) {
                    print('Forward');
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.share, size: 30),
                onPressed: () {
                  if (kDebugMode) {
                    print('Share');
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.flip_camera, size: 30),
                onPressed: () {
                  if (kDebugMode) {
                    print('Flip Camera');
                  }
                },
              ),
              IconButton(
                icon: Icon(Icons.adaptive.more, size: 30),
                onPressed: () {
                  if (kDebugMode) {
                    print('More');
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future showAdaptiveDialogs() async {
    showAdaptiveDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Title'),
        content: const Text('Body'),
        actions: [
          TextButton(
            child: const Text('OK'),
            onPressed: () => Navigator.pop(context),
          ),
        ],
      ),
    );
  }
}
