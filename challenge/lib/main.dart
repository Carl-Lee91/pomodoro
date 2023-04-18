import 'dart:async';

import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final _redColor = const Color(0xFFE64D3D);
  final _whiteColor = const Color(0xFFFFFFFF);
  final _greyColor = const Color(0xFFF19387);
  static const restMinutes = 300;
  static const fifteenMinutes = 900;
  static const twentyMinutes = 1200;
  static const twentyFiveMinutes = 1500;
  static const thirtyMinutes = 1800;
  static const thirtyFiveMinutes = 2100;
  late int totalSeconds = 1500;
  int totalRound = 0;
  int totalGoal = 0;
  bool isRunning = false;
  bool isResting = false;
  late Timer? timer;

  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      if (totalRound == 4) {
        if (!isResting) {
          isRunning = false;
          startRest();
        } else {
          setState(() {
            totalGoal = totalGoal + 1;
            totalRound = 0;
            isRunning = false;
            totalSeconds = twentyFiveMinutes;
            isResting = false;
          });
        }
      } else {
        if (!isResting) {
          isRunning = false;
          startRest();
        } else {
          setState(() {
            totalRound = totalRound + 1;
            isRunning = false;
            totalSeconds = twentyFiveMinutes;
            isResting = false;
          });
        }
      }
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 100;
      });
    }
  }

  void startRest() {
    setState(() {
      totalSeconds = restMinutes;
      isResting = true;
    });
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(seconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausedPressed() {
    timer?.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestartPressed() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
      totalRound = 0;
      totalGoal = 0;
    });
  }

  void onTimeChangeFifteen() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = fifteenMinutes;
    });
  }

  void onTimeChangeTwenty() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyMinutes;
    });
  }

  void onTimeChangeTwentyFive() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = twentyFiveMinutes;
    });
  }

  void onTimeChangeThirty() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = thirtyMinutes;
    });
  }

  void onTimeChangeThirtyFive() {
    timer?.cancel();
    setState(() {
      isRunning = false;
      totalSeconds = thirtyFiveMinutes;
    });
  }

  String frontFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 4);
  }

  String backFormat(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(5, 7);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: _redColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFFE64D3D),
            title: const Text(
              "   POMOTIMER",
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 60,
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: 40,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: -10,
                                child: Container(
                                  width: 120,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: _greyColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                child: Container(
                                  width: 130,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: _greyColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                child: Container(
                                  width: 120,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: _whiteColor,
                                  ),
                                  child: Text(
                                    frontFormat(totalSeconds),
                                    style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w600,
                                      color: _redColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Text(
                        ":",
                        style: TextStyle(
                          fontSize: 60,
                          color: _greyColor,
                        ),
                      ),
                      Column(
                        children: [
                          Stack(
                            clipBehavior: Clip.none,
                            alignment: Alignment.center,
                            children: [
                              Positioned(
                                top: -10,
                                child: Container(
                                  width: 120,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: _greyColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                child: Container(
                                  width: 130,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    color: _greyColor,
                                  ),
                                ),
                              ),
                              Positioned(
                                top: -5,
                                child: Container(
                                  width: 120,
                                  height: 200,
                                  decoration: const BoxDecoration(
                                    color: Colors.white60,
                                  ),
                                ),
                              ),
                              Positioned(
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 150,
                                  height: 200,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: _whiteColor,
                                  ),
                                  child: Text(
                                    backFormat(totalSeconds),
                                    style: TextStyle(
                                      fontSize: 80,
                                      fontWeight: FontWeight.w600,
                                      color: _redColor,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: onTimeChangeFifteen,
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _whiteColor,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              frontFormat(fifteenMinutes),
                              style: TextStyle(
                                color: _redColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: onTimeChangeTwenty,
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _whiteColor,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              frontFormat(twentyMinutes),
                              style: TextStyle(
                                color: _redColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: onTimeChangeTwentyFive,
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _whiteColor,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              frontFormat(twentyFiveMinutes),
                              style: TextStyle(
                                color: _redColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: onTimeChangeThirty,
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _whiteColor,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              frontFormat(thirtyMinutes),
                              style: TextStyle(
                                color: _redColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: GestureDetector(
                          onTap: onTimeChangeThirtyFive,
                          child: Container(
                            alignment: Alignment.center,
                            width: 70,
                            height: 40,
                            decoration: BoxDecoration(
                              color: _whiteColor,
                              borderRadius: BorderRadius.circular(
                                10,
                              ),
                            ),
                            child: Text(
                              frontFormat(thirtyFiveMinutes),
                              style: TextStyle(
                                color: _redColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 70,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black38,
                        ),
                        child: IconButton(
                          color: _whiteColor,
                          iconSize: 50,
                          onPressed:
                              isRunning ? onPausedPressed : onStartPressed,
                          icon: Icon(
                            isRunning ? Icons.pause : Icons.play_arrow,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 60,
                      ),
                      Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.black38,
                        ),
                        child: IconButton(
                          color: _whiteColor,
                          iconSize: 50,
                          onPressed: onRestartPressed,
                          icon: const Icon(
                            Icons.restart_alt_outlined,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Text(
                          "$totalRound/4",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: _greyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ROUND",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: _whiteColor),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 110,
                    ),
                    Column(
                      children: [
                        Text(
                          "$totalGoal/12",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: _greyColor,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "GOAL",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: _whiteColor),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
