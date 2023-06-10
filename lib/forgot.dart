import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:email_otp/email_otp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/Registration.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:pinput/pinput.dart';
import 'package:email_auth/email_auth.dart';
import 'package:http/http.dart' as http;

import 'Home.dart';
import 'login.dart';

class forgot extends StatefulWidget {
  @override
  State<forgot> createState() => _forgotState();
}

class _forgotState extends State<forgot> {
  var h, w;

  TextEditingController emailMobile = TextEditingController();
  OtpFieldController Otp = OtpFieldController();
  var VerifyOTP;
  TextEditingController newPass = TextEditingController();
  TextEditingController ConfirmPassWord = TextEditingController();

  EmailOTP myauth = EmailOTP();

  bool getotpprogress = false;
  bool passCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  otpConfig() {
    try {
      myauth.setConfig(
          appEmail: "anadhsuhagiya15@gmail.com",
          appName: "9 Vision",
          userEmail: emailMobile.text,
          otpLength: 6,
          otpType: OTPType.digitsOnly);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final Fcontrolling c = Get.put(Fcontrolling());

    return w < 1100
        ? Scaffold(
            backgroundColor: Color(0xff001364),
            body: Stack(
              children: [
                CircularParticle(
                  width: w,
                  height: h,
                  particleColor: Colors.white.withOpacity(.6),
                  numberOfParticles: 300,
                  speedOfParticles: 2,
                  maxParticleSize: 9,
                  awayRadius: 0,
                  onTapAnimation: false,
                  isRandSize: true,
                  isRandomColor: false,
                  connectDots: false,
                  enableHover: false,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BlurryContainer(
                                  blur: 5,
                                  width: w * 0.67,
                                  height: h * 0.7,
                                  elevation: 0,
                                  color: Colors.white.withOpacity(0.1),
                                  padding: const EdgeInsets.all(8),
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "FORGOT PASSWORD",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: h * 0.03,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: h * 0.045,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Container(
                                            width: w * 0.56,
                                            height: h * 0.06,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Obx(() => TextField(
                                                  controller: emailMobile,
                                                  onChanged: (value) {
                                                    c.EmailChanged(value);
                                                  },
                                                  cursorColor: Colors.white,
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                          fontSize: h * 0.019,
                                                          color: Color(
                                                              0xffffffff))),
                                                  decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        MdiIcons.email,
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
                                                      hintText: "Enter Email",
                                                      hintStyle: GoogleFonts
                                                          .montserrat(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                      errorText: c.EmailError
                                                                  .value ==
                                                              true
                                                          ? "Please Enter Email"
                                                          : null,
                                                      border: InputBorder.none,
                                                      suffix: TextButton(
                                                        onPressed: () async {
                                                          await myauth
                                                              .sendOTP();
                                                        },
                                                        child: getotpprogress
                                                            ? Container(
                                                                height:
                                                                    h * 0.02,
                                                                width: h * 0.02,
                                                                child:
                                                                    CupertinoActivityIndicator(
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              )
                                                            : Text(
                                                                "Get OTP",
                                                                style: GoogleFonts.montserrat(
                                                                    textStyle: TextStyle(
                                                                        color: Color(
                                                                            0xff001364),
                                                                        fontSize: h *
                                                                            0.022,
                                                                        fontWeight:
                                                                            FontWeight.bold)),
                                                              ),
                                                      )),
                                                )),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: h * 0.03,
                                      ),
                                      Container(
                                        width: w * 0.56,
                                        height: h * 0.06,
                                        alignment: Alignment.center,
                                        child: OTPTextField(
                                          controller: Otp,
                                          length: 6,
                                          width: w * 0.56,
                                          fieldWidth: 40,
                                          otpFieldStyle: OtpFieldStyle(
                                            backgroundColor:
                                                Colors.white.withOpacity(0.2),
                                            borderColor:
                                                Colors.white.withOpacity(0.2),
                                            focusBorderColor: Colors.white,
                                          ),
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                              fontSize: h * 0.023,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          textFieldAlignment:
                                              MainAxisAlignment.spaceAround,
                                          fieldStyle: FieldStyle.box,
                                          onCompleted: (pin) {
                                            print("Completed: " + pin);
                                            VerifyOTP = pin;
                                            setState(() {});
                                          },
                                        ),
                                      ),
                                      SizedBox(
                                        height: h * 0.05,
                                      ),
                                      InkWell(
                                        onTap: () async {
                                          String newPassss =
                                              newPass.text.trim();
                                          String ConPassss =
                                              ConfirmPassWord.text.trim();
                                          if (newPassss.compareTo(ConPassss) ==
                                              0) {
                                            String UpdatedPass =
                                                ConfirmPassWord.text;

                                            Map formData = {
                                              'email': emailMobile.text,
                                              'password': UpdatedPass
                                            };

                                            var link = Uri.parse(
                                                "https://flutteranadh.000webhostapp.com/onlineShopping/forgot.php");

                                            print("URL");
                                            var response = await http.post(link,
                                                body: formData);

                                            Navigator.pop(context);
                                            if (response.statusCode == 200) {
                                              print("Response ==== $response");

                                              Map map =
                                                  jsonDecode(response.body);

                                              int result = map['result'];
                                              print("Result :- $result");

                                              if (result == 0) {
                                                print("Try Again");
                                              } else if (result == 2) {
                                                AwesomeDialog(
                                                  context: context,
                                                  dialogType: DialogType.error,
                                                  animType:
                                                      AnimType.bottomSlide,
                                                  title: 'Error',
                                                  desc:
                                                      'User Not Exist with This Email',
                                                  btnOkOnPress: () {},
                                                )..show();
                                              } else if (result == 1) {
                                                print("Success");
                                                Get.to(login());
                                              }
                                            }
                                          } else {
                                            Fluttertoast.showToast(
                                                msg:
                                                    "New Password & Confirm Password is Different You can type Same in Both",
                                                webBgColor:
                                                    "linear-gradient(to right, #a30000, #ff4a4a)");
                                          }
                                        },
                                        child: Container(
                                          height: h * 0.07,
                                          width: 100,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.white,
                                                    blurRadius: 10,
                                                    spreadRadius: -5)
                                              ]),
                                          child: Text(
                                            "Submit",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Color(0xff001364),
                                                    fontSize: h * 0.019,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          )
        : Scaffold(
            backgroundColor: Color(0xff001364),
            body: Stack(
              children: [
                CircularParticle(
                  width: w,
                  height: h,
                  particleColor: Colors.white.withOpacity(.6),
                  numberOfParticles: 300,
                  speedOfParticles: 2,
                  maxParticleSize: 9,
                  awayRadius: 0,
                  onTapAnimation: false,
                  isRandSize: true,
                  isRandomColor: false,
                  connectDots: false,
                  enableHover: false,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        BlurryContainer(
                          blur: 5,
                          width: w * 0.8,
                          height: h * 0.85,
                          elevation: 0,
                          color: Colors.white.withOpacity(0.1),
                          padding: const EdgeInsets.all(8),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "YOU FORGOT THE PASSWORD ?",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: h * 0.04,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: h * 0.06,
                                  ),
                                  Text(
                                    "Remember to keep your passwords secure and change\nthem regularly to protect your account information.",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: h * 0.018)),
                                  )
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BlurryContainer(
                                    blur: 5,
                                    width: w * 0.32,
                                    height: h * 0.7,
                                    elevation: 0,
                                    color: Colors.white.withOpacity(0.1),
                                    padding: const EdgeInsets.all(8),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(20)),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "FORGOT PASSWORD",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: h * 0.03,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        SizedBox(
                                          height: h * 0.045,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: w * 0.16,
                                              height: h * 0.06,
                                              decoration: BoxDecoration(
                                                color: Colors.white
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(12),
                                              ),
                                              child: Obx(() => TextField(
                                                    controller: emailMobile,
                                                    onChanged: (value) {
                                                      c.EmailChanged(value);
                                                    },
                                                    cursorColor: Colors.white,
                                                    style: GoogleFonts.montserrat(
                                                        textStyle: TextStyle(
                                                            fontSize: h * 0.019,
                                                            color: Color(
                                                                0xffffffff))),
                                                    decoration: InputDecoration(
                                                      prefixIcon: Icon(
                                                        MdiIcons.email,
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
                                                      hintText: "Enter Email",
                                                      hintStyle: GoogleFonts
                                                          .montserrat(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white)),
                                                      errorText: c.EmailError
                                                                  .value ==
                                                              true
                                                          ? "Please Enter Email"
                                                          : null,
                                                      border: InputBorder.none,
                                                    ),
                                                  )),
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                getotpprogress = true;
                                                setState(() {});
                                                myauth.setConfig(
                                                    appEmail:
                                                        "anadhsuhagiya15@gmail.com",
                                                    appName: "9 Vision",
                                                    userEmail: emailMobile.text,
                                                    otpLength: 6,
                                                    otpType:
                                                        OTPType.digitsOnly);
                                                if (await myauth.sendOTP() ==
                                                    true) {
                                                  getotpprogress = false;
                                                  setState(() {});
                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content: Text(
                                                        "OTP has been sent"),
                                                  ));
                                                } else {
                                                  getotpprogress = false;
                                                  setState(() {});

                                                  ScaffoldMessenger.of(context)
                                                      .showSnackBar(
                                                          const SnackBar(
                                                    content: Text(
                                                        "Oops, OTP send failed"),
                                                  ));
                                                }
                                              },
                                              child: Container(
                                                width: w * 0.071,
                                                height: h * 0.06,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                ),
                                                child: getotpprogress
                                                    ? Container(
                                                        height: h * 0.02,
                                                        width: h * 0.02,
                                                        child:
                                                            CupertinoActivityIndicator(
                                                          color: Colors.black,
                                                        ),
                                                      )
                                                    : Text(
                                                        "Get OTP",
                                                        style: GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                                color: Color(
                                                                    0xff001364),
                                                                fontSize:
                                                                    h * 0.022,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold)),
                                                      ),
                                              ),
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          height: h * 0.03,
                                        ),
                                        Container(
                                          width: w * 0.26,
                                          height: h * 0.06,
                                          alignment: Alignment.center,
                                          child: OTPTextField(
                                            controller: Otp,
                                            length: 6,
                                            width: w * 0.26,
                                            fieldWidth: w * 0.03,
                                            otpFieldStyle: OtpFieldStyle(
                                              backgroundColor:
                                                  Colors.white.withOpacity(0.2),
                                              borderColor:
                                                  Colors.white.withOpacity(0.2),
                                              focusBorderColor: Colors.white,
                                            ),
                                            style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                fontSize: h * 0.023,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            textFieldAlignment:
                                                MainAxisAlignment.spaceAround,
                                            fieldStyle: FieldStyle.box,
                                            onCompleted: (pin) {
                                              print("Completed: " + pin);
                                              VerifyOTP = pin;
                                              setState(() {});
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: h * 0.05,
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            print("Otp is :- ${VerifyOTP}");
                                            if (await myauth.verifyOTP(
                                                    otp: VerifyOTP) ==
                                                true) {
                                              showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return AlertDialog(
                                                    content: Container(
                                                      height: h * 0.5,
                                                      width: w * 0.3,
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: TextField(
                                                              controller:
                                                                  newPass,
                                                              cursorColor:
                                                                  Colors.black,
                                                              style: GoogleFonts.montserrat(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: h *
                                                                          0.016,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      "Enter New Password",
                                                                  label: Text(
                                                                      "New Password")),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    10),
                                                            child: TextField(
                                                              controller:
                                                                  ConfirmPassWord,
                                                              cursorColor:
                                                                  Colors.black,
                                                              style: GoogleFonts.montserrat(
                                                                  textStyle: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize: h *
                                                                          0.016,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold)),
                                                              decoration: InputDecoration(
                                                                  hintText:
                                                                      "Enter Confirm Password",
                                                                  label: Text(
                                                                      "Confirm Password")),
                                                            ),
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              InkWell(
                                                                onTap:
                                                                    () async {
                                                                  String
                                                                      newPassss =
                                                                      newPass
                                                                          .text
                                                                          .trim();
                                                                  String
                                                                      ConPassss =
                                                                      ConfirmPassWord
                                                                          .text
                                                                          .trim();
                                                                  if (newPassss
                                                                          .compareTo(
                                                                              ConPassss) ==
                                                                      0) {
                                                                    String
                                                                        UpdatedPass =
                                                                        ConfirmPassWord
                                                                            .text;

                                                                    Map formData =
                                                                        {
                                                                      'email':
                                                                          emailMobile
                                                                              .text,
                                                                      'password':
                                                                          UpdatedPass
                                                                    };

                                                                    var link =
                                                                        Uri.parse(
                                                                            "https://flutteranadh.000webhostapp.com/onlineShopping/forgot.php");

                                                                    print(
                                                                        "URL");
                                                                    var response =
                                                                        await http.post(
                                                                            link,
                                                                            body:
                                                                                formData);

                                                                    Navigator.pop(
                                                                        context);
                                                                    if (response
                                                                            .statusCode ==
                                                                        200) {
                                                                      print(
                                                                          "Response ==== $response");

                                                                      Map map =
                                                                          jsonDecode(
                                                                              response.body);

                                                                      int result =
                                                                          map['result'];
                                                                      print(
                                                                          "Result :- $result");

                                                                      if (result ==
                                                                          0) {
                                                                        print(
                                                                            "Try Again");
                                                                      } else if (result ==
                                                                          2) {
                                                                        AwesomeDialog(
                                                                          context:
                                                                              context,
                                                                          dialogType:
                                                                              DialogType.error,
                                                                          animType:
                                                                              AnimType.bottomSlide,
                                                                          title:
                                                                              'Error',
                                                                          desc:
                                                                              'User Not Exist with This Email',
                                                                          btnOkOnPress:
                                                                              () {},
                                                                        )..show();
                                                                      } else if (result ==
                                                                          1) {
                                                                        print(
                                                                            "Success");
                                                                        Get.to(
                                                                            login());
                                                                      }
                                                                    }
                                                                  } else {
                                                                    Fluttertoast.showToast(
                                                                        msg:
                                                                            "New Password & Confirm Password is Different You can type Same in Both",
                                                                        webBgColor:
                                                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                                                  }
                                                                },
                                                                child:
                                                                    Container(
                                                                  height:
                                                                      h * 0.04,
                                                                  width:
                                                                      w * 0.07,
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(13),
                                                                      color: Color.fromARGB(255, 33, 232, 10),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                            color: Colors
                                                                                .black,
                                                                            blurRadius:
                                                                                10,
                                                                            spreadRadius:
                                                                                -7)
                                                                      ]),
                                                                  child: Text(
                                                                    "Set Password",
                                                                    style: GoogleFonts.montserrat(
                                                                        textStyle: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: h *
                                                                                0.015,
                                                                            fontWeight:
                                                                                FontWeight.bold)),
                                                                  ),
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              );

                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content:
                                                    Text("OTP is verified"),
                                              ));
                                            } else {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(const SnackBar(
                                                content: Text("Invalid OTP"),
                                              ));
                                            }
                                          },
                                          child: Container(
                                            height: h * 0.06,
                                            width: w * 0.1,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(14),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.white,
                                                      blurRadius: 10,
                                                      spreadRadius: -5)
                                                ]),
                                            child: Text(
                                              "Submit",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Color(0xff001364),
                                                      fontSize: h * 0.03,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}

class Fcontrolling extends GetxController {
  RxBool AhideShow = true.obs;
  RxBool EmailError = false.obs;
  RxBool PassError = false.obs;

  void hideShow() {
    AhideShow.toggle();
  }

  void sub(String email, String password) {
    print(email);
    print(password);
    if (email.isEmpty) {
      EmailError = true.obs;
    } else if (password.isEmpty) {
      PassError = true.obs;
    }
  }

  void EmailChanged(String value) {
    if (value.isNotEmpty) {
      EmailError = false.obs;
    }
  }

  void PassChanged(String value) {
    if (value.isNotEmpty) {
      PassError = false.obs;
    }
  }
}
