import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'brain.dart';
import 'emdr.dart';

double fontSize = 0;

class TempHome extends StatelessWidget {
  const TempHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    fontSize = MediaQuery.of(context).size.width / 46;
    return Scaffold(
      backgroundColor: Color(0xFF213C4D),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(EMDR(), transition: Transition.fadeIn);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Container(
                            width: MediaQuery.of(context).size.height / 6,
                            height: MediaQuery.of(context).size.height / 6,
                            color: ThemeData.light().primaryColor,
                            child: FittedBox(
                              fit: BoxFit.fitHeight,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      CupertinoIcons.waveform_path,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "EMDR",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 20,),
                      TextButton(
                        onPressed: () {
                          Get.to(Brain(), transition: Transition.fadeIn);
                        },
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(40.0),
                          child: Container(
                            width: MediaQuery.of(context).size.height / 6,
                            height: MediaQuery.of(context).size.height / 6,
                            color: Colors.white,
                            child: FittedBox(
                              fit: BoxFit.fitWidth,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Brain\nExercise",
                                      textAlign: TextAlign.center,
                                    ),
                                    Icon(
                                      CupertinoIcons.waveform_path,
                                      color: ThemeData.light().primaryColor,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
