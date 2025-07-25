import 'package:buddy/res/contants/colors_contants.dart';
import 'package:flutter/material.dart';

class AnimatedSwitch extends StatefulWidget {
  @override
  _AnimatedSwitchState createState() => _AnimatedSwitchState();
}

class _AnimatedSwitchState extends State<AnimatedSwitch>
    with SingleTickerProviderStateMixin {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsContants.primaryColor,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                  alignment: Alignment.topLeft,
                  child: CircleAvatar(
                    backgroundColor: ColorsContants.primaryColor,
                    child: Icon(
                      Icons.arrow_back_ios_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Text(
                'CREATOR / USER TOGGLE SWITCH',
                maxLines: 1,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                ),
              ),
              Text(
                'S W A P - M O D E',
                style: TextStyle(
                  fontSize: 14,
                  color: ColorsContants.textColor,
                  letterSpacing: 5,
                ),
              ),
              SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // ON Light
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: isOn ? Colors.greenAccent : Colors.black,
                          shape: BoxShape.circle,
                          boxShadow: isOn
                              ? [
                                  BoxShadow(
                                    color: Colors.greenAccent.withOpacity(0.8),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ]
                              : [],
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Creator',
                        style: TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 100),
                  // OFF Light
                  Column(
                    children: [
                      AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                          color: !isOn ? Colors.redAccent : Colors.black,
                          shape: BoxShape.circle,
                          boxShadow: !isOn
                              ? [
                                  BoxShadow(
                                    color: Colors.redAccent.withOpacity(0.8),
                                    blurRadius: 20,
                                    spreadRadius: 5,
                                  ),
                                ]
                              : [],
                        ),
                      ),
                      SizedBox(height: 5),
                      Text('User', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isOn = !isOn;
                  });
                },
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(50),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black54,
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Teeth background
                      Positioned.fill(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: List.generate(
                            6,
                            (index) => Container(
                              width: 20,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // Toggle knob
                      AnimatedAlign(
                        duration: Duration(milliseconds: 300),
                        alignment:
                            isOn ? Alignment.centerLeft : Alignment.centerRight,
                        curve: Curves.easeInOut,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Container(
                            width: 80,
                            height: 80,
                            decoration: BoxDecoration(
                              color: Color(0xFF1C1C1C),
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.grey, width: 2),
                            ),
                            child: Center(
                              child: Container(),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
