import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:money_share_project/views/show_money_share_ui.dart';

class InputMoneyUI extends StatefulWidget {
  const InputMoneyUI({super.key});

  @override
  State<InputMoneyUI> createState() => _InputMoneyUIState();
}

class _InputMoneyUIState extends State<InputMoneyUI> {
  bool? checkStatus = false;

  //สร้าง object ที่เป็นตัวแทนซึ่งจะควบคุม TextField
  TextEditingController moneyCtrl = TextEditingController(text: '');
  TextEditingController personCtrl = TextEditingController(text: '');
  TextEditingController tipCtrl = TextEditingController(text: '');

  //สร้าง method แสดงข้อความเตือน
  warningMessage(context, msg) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        title: Container(
          height: MediaQuery.of(context).size.height * 0.06,
          width: MediaQuery.of(context).size.width * 0.60,
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Center(
            child: Text(
              'คำเตือน',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.03,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        content: Text(
          msg,
          style: GoogleFonts.kanit(
            fontSize: MediaQuery.of(context).size.height * 0.022,
            color: Colors.red,
          ),
          textAlign: TextAlign.center,
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text(
              'ตกลง',
              style: GoogleFonts.kanit(
                fontSize: MediaQuery.of(context).size.height * 0.018,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0)
              )
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 199, 199),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 255, 112, 101),
        title: Text(
          'แชร์เงินกันเถอะ',
          style: GoogleFonts.kanit(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: MediaQuery.of(context).size.width * 0.1,
              right: MediaQuery.of(context).size.width * 0.1,
            ),
            child: Center(
              child: Column(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.1,
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
                    height: MediaQuery.of(context).size.height * 0.05,
                  ),
                  TextField(
                    controller: moneyCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                        RegExp(r'^[0-9]+.?[0-9]*'),
                      ),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'ป้อนจำนวนเงิน (บาท)',
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.grey[200],
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBill1Wave,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  TextField(
                    controller: personCtrl,
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r"\d+([\.]\d+)?")),
                    ],
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red,
                          ),
                          borderRadius: BorderRadius.circular(10.0)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red),
                          borderRadius: BorderRadius.circular(10.0)),
                      hintText: 'ป้อนจำนวนคน (คน)',
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.grey[200],
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.person,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        onChanged: (param) {
                          //โค้ดคำสั่งใดก็ตามที่มีผลต่อการแสดงผล ให้เขียนอยู่ภายใต้ setState
                          if (param == false) {
                            setState(
                              () {
                                tipCtrl.text = '';
                              },
                            );
                          }

                          setState(() {
                            checkStatus = param;
                          });
                        },
                        value: checkStatus,
                        activeColor: Colors.red,
                        side: BorderSide(color: Colors.red),
                      ),
                      Text(
                        'เงินทิป (บาท)',
                        style: GoogleFonts.kanit(color: Colors.red),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.01,
                  ),
                  TextField(
                    controller: tipCtrl,
                    keyboardType: TextInputType.number,
                    enabled: checkStatus,
                    decoration: InputDecoration(
                      disabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.red,
                        ),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.red),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      hintText: 'ป้อนจำนวนเงินทิป (บาท)',
                      hintStyle: GoogleFonts.kanit(
                        color: Colors.grey[200],
                      ),
                      prefixIcon: Icon(
                        FontAwesomeIcons.moneyBillTrendUp,
                        color: Colors.yellow,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            double money = 0, tip = 0, moneyshare = 0;
                            int person = 0;

                            //Login: Validate UI
                            if (moneyCtrl.text.length == 0) {
                              //แสดง Message ยังไม่ป้อนเงิน
                              warningMessage(context, "ป้อนจำนวนเงินด้วย...");
                              return;
                            } else if (double.parse(moneyCtrl.text) == 0) {
                              //แสดง Message เงินไม่ควรเป็น 0
                              warningMessage(
                                  context, "จำนวนเงินไม่ควรเป็น 0...");
                              return;
                            } else if (personCtrl.text.isEmpty == true) {
                              //แสดง Message ยังไม่ป้อนจำนวนคน
                              warningMessage(context, "ป้อนจำนวนคนด้วย...");
                              return;
                            } else if (double.parse(personCtrl.text) == 0) {
                              //แสดง Message คนไม่ควรเป็น 0
                              warningMessage(context, "จำนวนคนไม่ควรเป็น 0...");
                              return;
                            } else if (checkStatus == true) {
                              if (tipCtrl.text.length == 0) {
                                //แสดง Message ยังไม่ป้อนเงินทิป
                                warningMessage(
                                    context, "ป้อนจำนวนเงินทิปด้วย...");
                                return;
                              } else if (double.parse(tipCtrl.text) == 0) {
                                //แสดง Message เงินทิปไม่ควรเป็น 0
                                warningMessage(
                                    context, "จำนวนเงินทิปไม่ควรเป็น 0...");
                                return;
                              } else {
                                //พร้อมคำนวณแบบมีทิป
                                money = double.parse(moneyCtrl.text);
                                tip = double.parse(tipCtrl.text);
                                person = int.parse(personCtrl.text);
                                moneyshare = (money + tip) / person;
                              }
                            } else {
                              //พร้อมคำนวณแบบไม่มีทิป
                              money = double.parse(moneyCtrl.text);
                              person = int.parse(personCtrl.text);
                              moneyshare = money / person;
                            }

                            //เปิดหน้าจอ ShowMoneyShare พร้อมกับข้อมูลที่จะเอาไปแสดง
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowMoneyShareUI(
                                  money: money,
                                  tip: tip,
                                  moneyshare: moneyshare,
                                  person: person,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.calculator,
                            color: Colors.white,
                          ),
                          label: Text(
                            'คำนวณ',
                            style: GoogleFonts.kanit(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size.fromHeight(
                              55.0,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Expanded(
                        child: ElevatedButton.icon(
                          onPressed: () {
                            setState(
                              () {
                                moneyCtrl.text = '';
                                personCtrl.text = '';
                                checkStatus = false;
                                tipCtrl.text = '';
                              },
                            );
                          },
                          icon: Icon(
                            FontAwesomeIcons.calculator,
                            color: Colors.white,
                          ),
                          label: Text(
                            'ยกเลิก',
                            style: GoogleFonts.kanit(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            fixedSize: Size.fromHeight(
                              55.0,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
