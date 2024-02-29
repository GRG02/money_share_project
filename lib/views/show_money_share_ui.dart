import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/input_money_ui.dart';

class ShowMoneyShareUI extends StatefulWidget {
  //สร้างตัวแปรมาเก็บค่าที่ส่งมา
  double? money, tip, moneyshare;
  int? person;

  //เอาตัวแปรที่สร้างไว้มารอรับค่าที่ส่งมา

  ShowMoneyShareUI(
      {super.key, this.money, this.tip, this.person, this.moneyshare});

  @override
  State<ShowMoneyShareUI> createState() => _ShowMoneyShareUIState();
}

class _ShowMoneyShareUIState extends State<ShowMoneyShareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 199, 199),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 112, 101),
        title: Text(
          'แชร์เงินกันเถอะ (ผล)',
          style: GoogleFonts.kanit(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InputMoneyUI(),
              ),
            );
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.2,
                backgroundColor: const Color.fromARGB(255, 255, 112, 101),
                child: Image.asset(
                  'assets/images/money.png',
                  width: MediaQuery.of(context).size.width * 0.25,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              Text(
                widget.money!.toStringAsFixed(2),
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.white),
              ),
              Text(
                'บาท',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนคนที่จะหาร',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              Text(
                widget.person!.toString(),
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.white),
              ),
              Text(
                'คน',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'จำนวนเงินทิป',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              Text(
                widget.tip!.toStringAsFixed(2),
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.03,
                    color: Colors.white),
              ),
              Text(
                'บาท',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Text(
                'แชร์เงินกันคนละ',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.08,
                width: MediaQuery.of(context).size.width * 0.70,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 112, 101),
                    borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: Text(
                    widget.moneyshare!.toStringAsFixed(2),
                    style: GoogleFonts.kanit(
                        fontSize: MediaQuery.of(context).size.height * 0.03,
                        color: Colors.white),
                  ),
                ),
              ),
              Text(
                'บาท',
                style: GoogleFonts.kanit(
                    fontSize: MediaQuery.of(context).size.height * 0.020,
                    color: const Color.fromARGB(255, 255, 112, 101)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
