import 'package:flutter/material.dart';
import 'package:rentrite/contants/colors.dart';
import 'package:rentrite/screens/home/widget/custom_header.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomHeader(),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 100,),
            Text(
              "Rent\nAgreement\nMade Simple",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryColor,
                fontSize: 54,
                fontWeight: FontWeight.w800,
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Create, Manage, and sign rental agreements online - fast, secure, and hassle-free.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: Text(
                    "Dashboard",
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                ),
                SizedBox(width: 10),
                OutlinedButton(
                  onPressed: () {
                    
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  ),
                  child: Text(
                    "Learn More",
                    style: TextStyle(color: AppColors.primaryColor, fontSize: 24),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
