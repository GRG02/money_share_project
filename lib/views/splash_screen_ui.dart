import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/input_money_ui.dart';

class SplashScreenUI extends StatefulWidget {
  const SplashScreenUI({super.key});

  @override
  State<SplashScreenUI> createState() => _SplashScreenUIState();
}

class _SplashScreenUIState extends State<SplashScreenUI> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(
      //เวลาที่หน่วง
      Duration(
        seconds: 3,
      ),
      //เปิดหน้าจอ InputMoneyUI
      () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => InputMoneyUI(),
          )),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 112, 101),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/money.png',
              width: MediaQuery.of(context).size.width * 0.5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            CircularProgressIndicator(
              color: Colors.yellow,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.04,
            ),
            Text(
              'แชร์เงินกันเถอะ',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.045,
                color: Colors.white,
              ),
            ),
            Text(
              'Copyright © 2024 by NinniN DTI-SAU',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
            Text(
              'Version 1.0.0',
              style: GoogleFonts.kanit(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
