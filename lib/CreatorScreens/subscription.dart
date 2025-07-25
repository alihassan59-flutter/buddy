import 'package:buddy/res/contants/colors_contants.dart';
import 'package:buddy/CreatorScreens/mianHome.dart';
import 'package:flutter/material.dart';
import 'dart:ui';

class Subscription extends StatelessWidget {
  const Subscription({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Centered "buddy" text
              Row(
                //mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context); // Navigate back
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
                    "buddy",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: ColorsContants.primaryColor,
                    ),
                  ),
                  Spacer(),
                ],
              ),
              SizedBox(height: 20),
              Image.asset("assets/priemium.png", height: 150),
              SizedBox(height: 20),
              Center(
                child: Text(
                  "Unlock Premium Features",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorsContants.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildPlanBox("12", "months", "\$999 /m", false),
                  _buildPlanBox("3", "months", "\$249 /m", true),
                  _buildPlanBox("1", "months", "\$399/m", false),
                ],
              ),
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Get 3 Month ₹250",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => MainHome()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  foregroundColor: ColorsContants.primaryColor,
                  side: BorderSide(color: ColorsContants.primaryColor),
                ),
                child: Text("Try Buddy Premium Free for 14 Days"),
              ),
              //SizedBox(height: 30),
              Spacer(),
              Center(
                child: Text(
                  "Does My Subscription Auto Renew ?",
                  style: TextStyle(
                    color: ColorsContants.primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 8),
              Center(
                child: Text(
                  "You can disable this at any time.",
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPlanBox(
      String duration, String unit, String price, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      width: isSelected ? 110 : 100, // Increase size if selected
      padding:
          EdgeInsets.symmetric(vertical: isSelected ? 16 : 12, horizontal: 8),
      decoration: BoxDecoration(
        color: isSelected
            ? ColorsContants.primaryColor.withOpacity(0.1)
            : Colors.white,
        border: Border.all(
          color:
              isSelected ? ColorsContants.primaryColor : Colors.grey.shade300,
          width: 3,
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isSelected)
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsContants.primaryColor,
                borderRadius: BorderRadius.circular(8),
              ),
              margin: EdgeInsets.only(bottom: 8),
              child: Center(
                child: Text(
                  '50% Off',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          Text(
            duration,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ColorsContants.primaryColor,
            ),
          ),
          Text(
            unit,
            style: TextStyle(
              fontSize: 14,
              color: Colors.black87,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          Text(
            price,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
