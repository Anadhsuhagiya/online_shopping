import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'lauoutFor3device.dart';

class customerServices extends StatefulWidget {
  const customerServices({Key? key}) : super(key: key);

  @override
  State<customerServices> createState() => _customerServicesState();
}

class _customerServicesState extends State<customerServices> {
  var h, w;

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final CScontrolling c = Get.put(CScontrolling());

    return ResponsiveWidget.isSmallScreen(context)
        ? Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xff00245a),
              leading: IconButton(
                  onPressed: () {
                    print("Back");
                    Get.back();
                  },
                  icon: Icon(
                    MdiIcons.stepBackward,
                    color: Colors.white,
                  )),
              title: Row(
                children: [
                  SizedBox(
                    width: w * 0.005,
                  ),
                  Image.asset(
                    'images/store.png',
                    height: h * 0.05,
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text(
                    "9 Vision",
                    style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: h * 0.024,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.015,
                      ),
                      Text(
                        "Hello ,  Anadh  How can i Help you ?",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.025)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: w * 0.015,
                      ),
                      Text(
                        "Some things you can do here",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: h * 0.018)),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Lottie.network(
                                "https://assets7.lottiefiles.com/packages/lf20_3WsNKy.json",
                                fit: BoxFit.fitHeight),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Your Orders",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Track Package",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                                Text(
                                  "Edit or Cancel Order",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Lottie.network(
                                "https://assets8.lottiefiles.com/packages/lf20_PuS1c7QL54.json",
                                fit: BoxFit.fitHeight,
                                height: h * 0.1),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Returns & Refunds",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Return or Exchange \nitems",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: h * 0.015,
                                  )),
                                ),
                                Text(
                                  "Print return mailing \nlabels",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: h * 0.015,
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Lottie.network(
                              "https://assets1.lottiefiles.com/packages/lf20_qievcjy1.json",
                              height: h * 0.1,
                              fit: BoxFit.fitHeight,
                            ),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Manage Addresses",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Update your Addresses",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: h * 0.015,
                                  )),
                                ),
                                Text(
                                  "Add Address, Landmark \ndetails",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                    color: Color(0xffc0c0c0),
                                    fontSize: h * 0.015,
                                  )),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Lottie.network(
                                "https://assets7.lottiefiles.com/packages/lf20_k6ciq2nn.json",
                                height: 60,
                                fit: BoxFit.fitHeight),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Payment Settings",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Add or Edit payment \nmethods",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                                Text(
                                  "Change expired debit or \ncredit card",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ]),
                        child: Row(
                          children: [
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Lottie.network(
                                "https://assets9.lottiefiles.com/private_files/lf30_bcVsEA.json",
                                fit: BoxFit.fitHeight),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Account Settings",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Change your email or \npassword",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                                Text(
                                  "Update login information",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.01,
                      ),
                      Container(
                        height: h * 0.16,
                        width: w * 0.7,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey, width: 2),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -7)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Lottie.network(
                                "https://assets8.lottiefiles.com/packages/lf20_bbMc46ipEc.json",
                                height: 50,
                                fit: BoxFit.fitHeight),
                            SizedBox(
                              width: w * 0.01,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Digital Services and\nDevice Support",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: h * 0.017,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Text(
                                  "Find device help & support",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                                Text(
                                  "Troubleshoot device issues",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xffc0c0c0),
                                          fontSize: h * 0.015)),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              leading: IconButton(
                  onPressed: () {
                    print("Back");
                    Get.back();
                  },
                  icon: Icon(
                    MdiIcons.stepBackward,
                    color: Colors.black,
                  )),
              title: Row(
                children: [
                  SizedBox(
                    width: w * 0.01,
                  ),
                  Image.asset(
                    'images/store.png',
                    height: h * 0.05,
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text(
                    "9 Vision",
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontSize: h * 0.025,
                            fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Hello ,  Anadh  How can i Help you ?",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 30)),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Some things you can do here",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20)),
                        )
                      ],
                    ),

                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: w * 0.16,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Lottie.network(
                                  "https://assets7.lottiefiles.com/packages/lf20_3WsNKy.json",
                                  fit: BoxFit.fitHeight),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Your Orders",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Track Package",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 13)),
                                  ),
                                  Text(
                                    "Edit or Cancel Order",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 13)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Lottie.network(
                                  "https://assets8.lottiefiles.com/packages/lf20_PuS1c7QL54.json",
                                  fit: BoxFit.fitHeight),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Returns & Refunds",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Return or Exchange items",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                  Text(
                                    "Print return mailing labels",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Lottie.network(
                                  "https://assets1.lottiefiles.com/packages/lf20_qievcjy1.json",
                                  height: 55,
                                  fit: BoxFit.fitHeight),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Manage Addresses",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Update your Addresses",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 13)),
                                  ),
                                  Text(
                                    "Add Address, Landmark details",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SizedBox(
                          width: w * 0.16,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Lottie.network(
                                  "https://assets7.lottiefiles.com/packages/lf20_k6ciq2nn.json",
                                  height: 60,
                                  fit: BoxFit.fitHeight),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Payment Settings",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Add or Edit payment methods",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                  Text(
                                    "Change expired debit or credit card",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Lottie.network(
                                  "https://assets9.lottiefiles.com/private_files/lf30_bcVsEA.json",
                                  fit: BoxFit.fitHeight),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Account Settings",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Change your email or password",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                  Text(
                                    "Update login information",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 10)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          width: w * 0.03,
                        ),
                        Container(
                          height: 100,
                          width: 300,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey, width: 2),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -7)
                              ]),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Lottie.network(
                                  "https://assets8.lottiefiles.com/packages/lf20_bbMc46ipEc.json",
                                  height: 50,
                                  fit: BoxFit.fitHeight),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Digital Services and\nDevice Support",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: 17,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Text(
                                    "Find device help & support",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 13)),
                                  ),
                                  Text(
                                    "Troubleshoot device issues",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xffc0c0c0),
                                            fontSize: 13)),
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),

                    SizedBox(
                      height: h * 0.04,
                    ),

                    //Information
                    Container(
                      height: h * 0.4,
                      width: w,
                      color: Color(0xff00245a),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: w * 0.2,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.1,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "ABOUT",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02)),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Contact Us",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "About Us",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {
                                      Fluttertoast.showToast(
                                          msg:
                                              "This Option isn't Available for now",
                                          textColor: Colors.white,
                                          gravity: ToastGravity.BOTTOM,
                                          webBgColor: LinearGradient(colors: [
                                            Colors.black,
                                            Colors.grey
                                          ]));
                                    },
                                    child: Text(
                                      "Become a Seller",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: w * 0.06,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.1,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "My Account",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02)),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Wishlist",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Returns & Orders",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Terms & Conditions",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Coming Soon",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: w * 0.06,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.1,
                                ),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Help",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02)),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Payments",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Shipping",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Cancellation & Returns",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "FAQ",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    )),
                              ],
                            ),
                            SizedBox(
                              width: w * 0.06,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: h * 0.1,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40),
                                  child: Text(
                                    "Store Information",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: h * 0.02)),
                                  ),
                                ),
                                SizedBox(
                                  height: h * 0.02,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.home,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Text(
                                      "15, Vanmali Park Society\nYogichowk, Surat",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Text(
                                      "8160011080",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: h * 0.01,
                                ),
                                Row(
                                  children: [
                                    Icon(
                                      Icons.mail,
                                      color: Colors.white,
                                    ),
                                    SizedBox(
                                      width: w * 0.01,
                                    ),
                                    Text(
                                      "anadhsuhagiya65@gmail.com",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontSize: h * 0.017)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

class CScontrolling extends GetxController {}
