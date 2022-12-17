// ignore_for_file: implementation_imports
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/container.dart';

import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class Room1 extends StatefulWidget {
  const Room1({super.key});

  @override
  State<Room1> createState() => _Room1State();
}

class _Room1State extends State<Room1> {
  double heating = 12;
  @override
  Widget build(BuildContext context) {
    center:
    const Text(
      'MY ROOM',
      style: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 18, left: 24, right: 24),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Icon(Icons.arrow_back_ios, color: Colors.indigo),
              ),
              const RotatedBox(
                quarterTurns: 135,
                child: Icon(
                  Icons.bar_chart_rounded,
                  color: Colors.indigo,
                  size: 28,
                ),
              )
            ],
          ),
          Expanded(
            child: ListView(
              physics: const BouncingScrollPhysics(),
              children: [
                const SizedBox(height: 32),
                CircularPercentIndicator(
                  radius: 180,
                  lineWidth: 14,
                  percent: 0.75,
                  progressColor: Colors.indigo,
                  center: const Text('26\u00B0',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      )),
                ),
                const SizedBox(
                  height: 32,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _roundedButton(title: 'GENERAL', isActive: true),
                    _roundedButton(title: 'SERVICES'),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24),
                          child: Text(
                            'HUMIDITY',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Slider(
                          value: heating,
                          onChanged: (newHeating) {
                            setState(() => heating = newHeating);
                          },
                          max: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('0\u00B0'),
                              Text('15\u00B0'),
                              Text('30\u00B0'),
                            ],
                          ),
                        )
                      ]),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ]),
      )),
    );
  }

  Widget _roundedButton({
    required String title,
    bool isActive = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 32),
      decoration: BoxDecoration(
        color: isActive ? Colors.indigo : Colors.transparent,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.indigo),
      ),
      child: Text(title,
          style: TextStyle(color: isActive ? Colors.white : Colors.black)),
    );
  }
}
