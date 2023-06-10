// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/login.dart';
import 'package:particles_flutter/particles_flutter.dart';
import 'package:http/http.dart' as http;

import 'lauoutFor3device.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  var h, w;

  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    w = MediaQuery
        .of(context)
        .size
        .width;
    h = MediaQuery
        .of(context)
        .size
        .height;

    final Rcontrolling c = Get.put(Rcontrolling());

    return ResponsiveWidget.isSmallScreen(context)
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
                  BlurryContainer(
                    blur: 5,
                    width: w * 0.9,
                    height: h * 0.85,
                    elevation: 0,
                    color: Colors.white.withOpacity(0.1),
                    padding: const EdgeInsets.all(8),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "REGISTRATION",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontSize: h * 0.04,
                                  fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        Container(
                          width: w * 0.8,
                          height: h * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(() =>
                              TextField(
                                controller: name,
                                onChanged: (value) {
                                  c.nameError(value);
                                },
                                cursorColor: Colors.white,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: h * 0.019,
                                        color: Color(0xffffffff))),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person,
                                    color: Color(0xffffffff),
                                  ),
                                  hintText: "Enter Your Full Name",
                                  hintStyle: GoogleFonts.montserrat(
                                      textStyle:
                                      TextStyle(color: Colors.white)),
                                  errorText: c.NameError.value == true
                                      ? "Please Enter Your Full Name"
                                      : null,
                                  border: InputBorder.none,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        Container(
                          width: w * 0.8,
                          height: h * 0.06,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(() =>
                              TextField(
                                controller: email,
                                onChanged: (value) {
                                  c.EmailChanged(value);
                                },
                                cursorColor: Colors.white,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: h * 0.019,
                                        color: Color(0xffffffff))),
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    MdiIcons.email,
                                    color: Color(0xffffffff),
                                  ),
                                  hintText: "Enter Email",
                                  hintStyle: GoogleFonts.montserrat(
                                      textStyle:
                                      TextStyle(color: Colors.white)),
                                  errorText: c.EmailError.value == true
                                      ? "Please Enter Email"
                                      : null,
                                  border: InputBorder.none,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.045,
                        ),
                        Container(
                          width: w * 0.8,
                          height: h * 0.06,
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(() =>
                              TextField(
                                controller: mobile,
                                maxLength: 10,
                                onChanged: (value) {
                                  c.mobileError(value);
                                  if (c.MobileCharError.value == false) {
                                    Fluttertoast.showToast(
                                        msg:
                                        "Only Numeric Value are allowed",
                                        webBgColor:
                                        "linear-gradient(to right, #a30000, #ff4a4a)");
                                  }
                                  print(
                                      "Method :- ${c.textLength.value}");
                                },
                                cursorColor: Colors.white,
                                textAlignVertical:
                                TextAlignVertical.center,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: h * 0.019,
                                        color: Color(0xffffffff))),
                                decoration: InputDecoration(
                                  counter: Offstage(),
                                  prefixIcon: Icon(
                                    MdiIcons.contacts,
                                    color: Color(0xffffffff),
                                  ),
                                  prefix: Text("+91 ",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              fontSize: h * 0.019,
                                              color: Color(0xffffffff)))),
                                  hintText: "Enter Your Contact",
                                  suffix: Obx(() =>
                                      Text(
                                          "${c.textLength.value}/10  ",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  fontSize: h * 0.019,
                                                  color:
                                                  Color(0xffffffff))))),
                                  hintStyle: GoogleFonts.montserrat(
                                      textStyle:
                                      TextStyle(color: Colors.white)),
                                  errorText: c.MobileError.value == true
                                      ? "Please Enter Your Contact"
                                      : null,
                                  border: InputBorder.none,
                                ),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Container(
                          width: w * 0.8,
                          height: h * 0.06,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Obx(() =>
                              TextField(
                                controller: password,
                                obscureText: c.AhideShow.value,
                                onChanged: (value) {
                                  c.PassChanged(value);
                                },
                                cursorColor: Colors.white,
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        fontSize: h * 0.019,
                                        color: Color(0xffffffff))),
                                decoration: InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.password,
                                      color: Color(0xffffffff),
                                    ),
                                    hintText: "Enter Your Password",
                                    hintStyle: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white)),
                                    border: InputBorder.none,
                                    errorText: c.PassError.value == true
                                        ? "Please Enter Password"
                                        : null,
                                    suffixIcon: IconButton(
                                        hoverColor: Colors.transparent,
                                        onPressed: () {
                                          c.hideShow();
                                        },
                                        icon: c.AhideShow.value == true
                                            ? Icon(
                                          MdiIcons.eye,
                                          color: Colors.white,
                                          size: h * 0.023,
                                        )
                                            : Icon(MdiIcons.eyeOff,
                                            color: Colors.white,
                                            size: h * 0.023))),
                              )),
                        ),
                        SizedBox(
                          height: h * 0.05,
                        ),
                        InkWell(
                          onTap: () async {
                            String NAME = name.text.trim();
                            String EMAIL = email.text.trim();
                            String CONTACT = mobile.text.trim();
                            String PASSWORD = password.text.trim();
                            bool emailValid = RegExp(
                                r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                .hasMatch(EMAIL);

                            c.sub(NAME, EMAIL, CONTACT, PASSWORD);

                            if (c.NameError.value == true) {
                              Fluttertoast.showToast(
                                  msg: "Please Fill the Name",
                                  webBgColor:
                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                            } else if (c.EmailError.value == true &&
                                c.NameError.value == false) {
                              Fluttertoast.showToast(
                                  msg: "Please Fill the Email",
                                  webBgColor:
                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                            } else if (emailValid == false) {
                              Fluttertoast.showToast(
                                  msg: "Check The Email Format",
                                  webBgColor:
                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                            } else if (c.MobileError.value == true &&
                                c.EmailError.value == false &&
                                c.NameError.value == false) {
                              Fluttertoast.showToast(
                                  msg: "Please Fill the Contact",
                                  webBgColor:
                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                            } else if (c.MobileLenError.value == true) {
                              Fluttertoast.showToast(
                                  msg: "Enter 10 Digit Contact Number",
                                  webBgColor:
                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                            } else if (c.PassError.value == true &&
                                c.EmailError.value == false &&
                                c.NameError.value == false &&
                                c.MobileError.value == false) {
                              Fluttertoast.showToast(
                                  msg: "Please Fill the Password",
                                  webBgColor:
                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                            } else {
                              showDialog(
                                barrierDismissible: false,
                                context: context,
                                builder: (context) {
                                  return SimpleDialog(
                                    elevation: 2,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(30),
                                          color: Colors.white,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                          children: [
                                            CircularProgressIndicator(
                                              color: Colors.black,
                                              strokeWidth: 4,
                                            ),
                                            Text("Sign Up",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color:
                                                        Colors.black,
                                                        fontSize:
                                                        h * 0.03,
                                                        fontWeight:
                                                        FontWeight
                                                            .bold))),
                                          ],
                                        ),
                                      )
                                    ],
                                  );
                                },
                              );

                              Map formData = {
                                'name': NAME,
                                'email': EMAIL,
                                'phone': CONTACT,
                                'pass': PASSWORD
                              };

                              var link = Uri.parse(
                                  "https://flutteranadh.000webhostapp.com/onlineShopping/ShoppingRegister.php");

                              print("URL");
                              var response =
                              await http.post(link, body: formData);

                              print("Response");
                              Navigator.pop(context);

                              if (response.statusCode == 200) {
                                print("Response ==== $response");

                                Map map = jsonDecode(response.body);

                                int result = map['result'];
                                print("Result :- $result");

                                if (result == 0) {
                                  print("Try Again");
                                } else if (result == 2) {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    animType: AnimType.bottomSlide,
                                    title: 'Error',
                                    desc:
                                    'Already User Exist with This Email',
                                    btnOkOnPress: () {},
                                  )
                                    ..show();
                                } else if (result == 1) {
                                  print("Success");
                                  Get.to(login());
                                }
                              }
                            }
                          },
                          child: Container(
                            height: h * 0.06,
                            width: 100,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(14),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.white,
                                      blurRadius: 10,
                                      spreadRadius: -5)
                                ]),
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Color(0xff001364),
                                      fontSize: h * 0.02,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: h * 0.03,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: w * 0.03,
                            ),
                            Text(
                              "You Have An Account ?",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: h * 0.021)),
                            ),
                            TextButton(
                                onPressed: () {
                                  Get.to(login());
                                },
                                child: Text(
                                  "Login",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: h * 0.023,
                                          decoration:
                                          TextDecoration.underline)),
                                ))
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    )
        : ResponsiveWidget.isMediumScreen(context)
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
                  BlurryContainer(
                    blur: 5,
                    width: 430,
                    height: h * 0.85,
                    elevation: 0,
                    color: Colors.white.withOpacity(0.1),
                    padding: const EdgeInsets.all(8),
                    borderRadius:
                    const BorderRadius.all(Radius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "REGISTRATION",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: h * 0.04,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              height: h * 0.045,
                            ),
                            Container(
                              width: 360,
                              height: h * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: Obx(() =>
                                  TextField(
                                    controller: name,
                                    onChanged: (value) {
                                      c.nameError(value);
                                    },
                                    cursorColor: Colors.white,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: h * 0.019,
                                            color:
                                            Color(0xffffffff))),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: Color(0xffffffff),
                                      ),
                                      hintText:
                                      "Enter Your Full Name",
                                      hintStyle:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color:
                                              Colors.white)),
                                      errorText: c.NameError.value ==
                                          true
                                          ? "Please Enter Your Full Name"
                                          : null,
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: h * 0.045,
                            ),
                            Container(
                              width: 360,
                              height: h * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: Obx(() =>
                                  TextField(
                                    controller: email,
                                    onChanged: (value) {
                                      c.EmailChanged(value);
                                    },
                                    cursorColor: Colors.white,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: h * 0.019,
                                            color:
                                            Color(0xffffffff))),
                                    decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        MdiIcons.email,
                                        color: Color(0xffffffff),
                                      ),
                                      hintText: "Enter Email",
                                      hintStyle:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color:
                                              Colors.white)),
                                      errorText:
                                      c.EmailError.value == true
                                          ? "Please Enter Email"
                                          : null,
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: h * 0.045,
                            ),
                            Container(
                              width: 360,
                              height: h * 0.06,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: Obx(() =>
                                  TextField(
                                    controller: mobile,
                                    maxLength: 10,
                                    onChanged: (value) {
                                      c.mobileError(value);
                                      if (c.MobileCharError.value ==
                                          false) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Only Numeric Value are allowed",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      }
                                      print(
                                          "Method :- ${c.textLength.value}");
                                    },
                                    cursorColor: Colors.white,
                                    textAlignVertical:
                                    TextAlignVertical.center,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: h * 0.019,
                                            color:
                                            Color(0xffffffff))),
                                    decoration: InputDecoration(
                                      counter: Offstage(),
                                      prefixIcon: Icon(
                                        MdiIcons.contacts,
                                        color: Color(0xffffffff),
                                      ),
                                      prefix: Text("+91 ",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  fontSize: h * 0.019,
                                                  color: Color(
                                                      0xffffffff)))),
                                      hintText: "Enter Your Contact",
                                      suffix: Obx(() =>
                                          Text(
                                              "${c.textLength.value}/10  ",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      fontSize: h * 0.019,
                                                      color: Color(
                                                          0xffffffff))))),
                                      hintStyle:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color:
                                              Colors.white)),
                                      errorText: c.MobileError
                                          .value ==
                                          true
                                          ? "Please Enter Your Contact"
                                          : null,
                                      border: InputBorder.none,
                                    ),
                                  )),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            Container(
                              width: 360,
                              height: h * 0.06,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius:
                                BorderRadius.circular(12),
                              ),
                              child: Obx(() =>
                                  TextField(
                                    controller: password,
                                    obscureText: c.AhideShow.value,
                                    onChanged: (value) {
                                      c.PassChanged(value);
                                    },
                                    cursorColor: Colors.white,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: h * 0.019,
                                            color:
                                            Color(0xffffffff))),
                                    decoration: InputDecoration(
                                        prefixIcon: Icon(
                                          Icons.password,
                                          color: Color(0xffffffff),
                                        ),
                                        hintText:
                                        "Enter Your Password",
                                        hintStyle:
                                        GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors
                                                    .white)),
                                        border: InputBorder.none,
                                        errorText: c.PassError
                                            .value ==
                                            true
                                            ? "Please Enter Password"
                                            : null,
                                        suffixIcon: IconButton(
                                            hoverColor:
                                            Colors.transparent,
                                            onPressed: () {
                                              c.hideShow();
                                            },
                                            icon: c.AhideShow.value ==
                                                true
                                                ? Icon(
                                              MdiIcons.eye,
                                              color:
                                              Colors.white,
                                              size: h * 0.023,
                                            )
                                                : Icon(
                                                MdiIcons.eyeOff,
                                                color:
                                                Colors.white,
                                                size:
                                                h * 0.023))),
                                  )),
                            ),
                            SizedBox(
                              height: h * 0.05,
                            ),
                            InkWell(
                              onTap: () async {
                                String NAME = name.text.trim();
                                String EMAIL = email.text.trim();
                                String CONTACT = mobile.text.trim();
                                String PASSWORD =
                                password.text.trim();
                                bool emailValid = RegExp(
                                    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(EMAIL);

                                c.sub(NAME, EMAIL, CONTACT, PASSWORD);

                                if (c.NameError.value == true) {
                                  Fluttertoast.showToast(
                                      msg: "Please Fill the Name",
                                      webBgColor:
                                      "linear-gradient(to right, #a30000, #ff4a4a)");
                                } else if (c.EmailError.value ==
                                    true &&
                                    c.NameError.value == false) {
                                  Fluttertoast.showToast(
                                      msg: "Please Fill the Email",
                                      webBgColor:
                                      "linear-gradient(to right, #a30000, #ff4a4a)");
                                } else if (emailValid == false) {
                                  Fluttertoast.showToast(
                                      msg: "Check The Email Format",
                                      webBgColor:
                                      "linear-gradient(to right, #a30000, #ff4a4a)");
                                } else if (c.MobileError.value ==
                                    true &&
                                    c.EmailError.value == false &&
                                    c.NameError.value == false) {
                                  Fluttertoast.showToast(
                                      msg: "Please Fill the Contact",
                                      webBgColor:
                                      "linear-gradient(to right, #a30000, #ff4a4a)");
                                } else if (c.MobileLenError.value ==
                                    true) {
                                  Fluttertoast.showToast(
                                      msg:
                                      "Enter 10 Digit Contact Number",
                                      webBgColor:
                                      "linear-gradient(to right, #a30000, #ff4a4a)");
                                } else if (c.PassError.value ==
                                    true &&
                                    c.EmailError.value == false &&
                                    c.NameError.value == false &&
                                    c.MobileError.value == false) {
                                  Fluttertoast.showToast(
                                      msg: "Please Fill the Password",
                                      webBgColor:
                                      "linear-gradient(to right, #a30000, #ff4a4a)");
                                } else {
                                  showDialog(
                                    barrierDismissible: false,
                                    context: context,
                                    builder: (context) {
                                      return SimpleDialog(
                                        elevation: 2,
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius
                                                  .circular(30),
                                              color: Colors.white,
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                              MainAxisAlignment
                                                  .spaceEvenly,
                                              children: [
                                                CircularProgressIndicator(
                                                  color: Colors.black,
                                                  strokeWidth: 4,
                                                ),
                                                Text("Sign Up",
                                                    style: GoogleFonts
                                                        .montserrat(
                                                        textStyle: TextStyle(
                                                            color: Colors
                                                                .black,
                                                            fontSize: h *
                                                                0.03,
                                                            fontWeight:
                                                            FontWeight
                                                                .bold))),
                                              ],
                                            ),
                                          )
                                        ],
                                      );
                                    },
                                  );

                                  Map formData = {
                                    'name': NAME,
                                    'email': EMAIL,
                                    'phone': CONTACT,
                                    'pass': PASSWORD
                                  };

                                  var link = Uri.parse(
                                      "https://flutteranadh.000webhostapp.com/onlineShopping/ShoppingRegister.php");

                                  print("URL");
                                  var response = await http.post(link,
                                      body: formData);

                                  print("Response");
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
                                        'Already User Exist with This Email',
                                        btnOkOnPress: () {},
                                      )
                                        ..show();
                                    } else if (result == 1) {
                                      print("Success");
                                      Get.to(login());
                                    }
                                  }
                                }
                              },
                              child: Container(
                                height: h * 0.06,
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
                                  "Sign Up",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Color(0xff001364),
                                          fontSize: h * 0.02,
                                          fontWeight:
                                          FontWeight.bold)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: h * 0.03,
                            ),
                            Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: w * 0.03,
                                ),
                                Text(
                                  "You Have An Account ?",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18)),
                                ),
                                TextButton(
                                    onPressed: () {
                                      Get.to(login());
                                    },
                                    child: Text(
                                      "Login",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight:
                                              FontWeight.bold,
                                              fontSize: 20,
                                              decoration:
                                              TextDecoration
                                                  .underline)),
                                    ))
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: w * 0.3,
                          height: h * 0.65,
                          alignment: Alignment.center,
                          child: Lottie.network(
                              "https://assets6.lottiefiles.com/packages/lf20_nc1bp7st.json",
                              fit: BoxFit.cover,
                              frameRate: FrameRate(120)),
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
                                    "REGISTRATION",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: h * 0.04,
                                            fontWeight:
                                            FontWeight.bold)),
                                  ),
                                  SizedBox(
                                    height: h * 0.045,
                                  ),
                                  Container(
                                    width: w * 0.26,
                                    height: h * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                          .withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Obx(() =>
                                        TextField(
                                          controller: name,
                                          onChanged: (value) {
                                            c.nameError(value);
                                          },
                                          cursorColor: Colors.white,
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  fontSize: h * 0.019,
                                                  color: Color(
                                                      0xffffffff))),
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                              Icons.person,
                                              color:
                                              Color(0xffffffff),
                                            ),
                                            hintText:
                                            "Enter Your Full Name",
                                            hintStyle: GoogleFonts
                                                .montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors
                                                        .white)),
                                            errorText: c.NameError
                                                .value ==
                                                true
                                                ? "Please Enter Your Full Name"
                                                : null,
                                            border: InputBorder.none,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: h * 0.045,
                                  ),
                                  Container(
                                    width: w * 0.26,
                                    height: h * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                          .withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Obx(() =>
                                        TextField(
                                          controller: email,
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
                                  SizedBox(
                                    height: h * 0.045,
                                  ),
                                  Container(
                                    width: w * 0.26,
                                    height: h * 0.06,
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                          .withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Obx(() =>
                                        TextField(
                                          controller: mobile,
                                          maxLength: 10,
                                          onChanged: (value) {
                                            c.mobileError(value);
                                            if (c.MobileCharError
                                                .value ==
                                                false) {
                                              Fluttertoast.showToast(
                                                  msg:
                                                  "Only Numeric Value are allowed",
                                                  webBgColor:
                                                  "linear-gradient(to right, #a30000, #ff4a4a)");
                                            }
                                            print(
                                                "Method :- ${c.textLength
                                                    .value}");
                                          },
                                          cursorColor: Colors.white,
                                          textAlignVertical:
                                          TextAlignVertical
                                              .center,
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  fontSize: h * 0.019,
                                                  color: Color(
                                                      0xffffffff))),
                                          decoration: InputDecoration(
                                            counter: Offstage(),
                                            prefixIcon: Icon(
                                              MdiIcons.contacts,
                                              color:
                                              Color(0xffffffff),
                                            ),
                                            prefix: Text("+91 ",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        fontSize:
                                                        h * 0.019,
                                                        color: Color(
                                                            0xffffffff)))),
                                            hintText:
                                            "Enter Your Contact",
                                            suffix: Obx(() =>
                                                Text(
                                                    "${c.textLength
                                                        .value}/10  ",
                                                    style: GoogleFonts
                                                        .montserrat(
                                                        textStyle: TextStyle(
                                                            fontSize:
                                                            h * 0.019,
                                                            color: Color(
                                                                0xffffffff))))),
                                            hintStyle: GoogleFonts
                                                .montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors
                                                        .white)),
                                            errorText: c.MobileError
                                                .value ==
                                                true
                                                ? "Please Enter Your Contact"
                                                : null,
                                            border: InputBorder.none,
                                          ),
                                        )),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  Container(
                                    width: w * 0.26,
                                    height: h * 0.06,
                                    alignment: Alignment.centerLeft,
                                    decoration: BoxDecoration(
                                      color: Colors.white
                                          .withOpacity(0.2),
                                      borderRadius:
                                      BorderRadius.circular(12),
                                    ),
                                    child: Obx(() =>
                                        TextField(
                                          controller: password,
                                          obscureText:
                                          c.AhideShow.value,
                                          onChanged: (value) {
                                            c.PassChanged(value);
                                          },
                                          cursorColor: Colors.white,
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  fontSize: h * 0.019,
                                                  color: Color(
                                                      0xffffffff))),
                                          decoration: InputDecoration(
                                              prefixIcon: Icon(
                                                Icons.password,
                                                color:
                                                Color(0xffffffff),
                                              ),
                                              hintText:
                                              "Enter Your Password",
                                              hintStyle: GoogleFonts
                                                  .montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors
                                                          .white)),
                                              border:
                                              InputBorder.none,
                                              errorText: c.PassError
                                                  .value ==
                                                  true
                                                  ? "Please Enter Password"
                                                  : null,
                                              suffixIcon: IconButton(
                                                  hoverColor:
                                                  Colors
                                                      .transparent,
                                                  onPressed: () {
                                                    c.hideShow();
                                                  },
                                                  icon: c.AhideShow
                                                      .value ==
                                                      true
                                                      ? Icon(
                                                    MdiIcons
                                                        .eye,
                                                    color: Colors
                                                        .white,
                                                    size: h *
                                                        0.023,
                                                  )
                                                      : Icon(
                                                      MdiIcons
                                                          .eyeOff,
                                                      color: Colors
                                                          .white,
                                                      size: h *
                                                          0.023))),
                                        )),
                                  ),
                                  SizedBox(
                                    height: h * 0.05,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      String NAME = name.text.trim();
                                      String EMAIL =
                                      email.text.trim();
                                      String CONTACT =
                                      mobile.text.trim();
                                      String PASSWORD =
                                      password.text.trim();
                                      bool emailValid = RegExp(
                                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                          .hasMatch(EMAIL);

                                      c.sub(NAME, EMAIL, CONTACT,
                                          PASSWORD);

                                      if (c.NameError.value == true) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Please Fill the Name",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      } else if (c.EmailError.value ==
                                          true &&
                                          c.NameError.value ==
                                              false) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Please Fill the Email",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      } else if (emailValid ==
                                          false) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Check The Email Format",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      } else if (c.MobileError.value ==
                                          true &&
                                          c.EmailError.value ==
                                              false &&
                                          c.NameError.value ==
                                              false) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Please Fill the Contact",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      } else if (c
                                          .MobileLenError.value ==
                                          true) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Enter 10 Digit Contact Number",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      } else if (c.PassError.value ==
                                          true &&
                                          c.EmailError.value ==
                                              false &&
                                          c.NameError.value ==
                                              false &&
                                          c.MobileError.value ==
                                              false) {
                                        Fluttertoast.showToast(
                                            msg:
                                            "Please Fill the Password",
                                            webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                      } else {
                                        showDialog(
                                          barrierDismissible: false,
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              elevation: 2,
                                              children: [
                                                Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        30),
                                                    color:
                                                    Colors.white,
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                    children: [
                                                      CircularProgressIndicator(
                                                        color: Colors
                                                            .black,
                                                        strokeWidth:
                                                        4,
                                                      ),
                                                      Text("Sign Up",
                                                          style: GoogleFonts
                                                              .montserrat(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: h *
                                                                      0.03,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .bold))),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            );
                                          },
                                        );

                                        Map formData = {
                                          'name': NAME,
                                          'email': EMAIL,
                                          'phone': CONTACT,
                                          'pass': PASSWORD
                                        };

                                        var link = Uri.parse(
                                            "https://flutteranadh.000webhostapp.com/onlineShopping/ShoppingRegister.php");

                                        print("URL");
                                        var response =
                                        await http.post(link,
                                            body: formData);

                                        print("Response");
                                        Navigator.pop(context);

                                        if (response.statusCode ==
                                            200) {
                                          print(
                                              "Response ==== $response");

                                          Map map = jsonDecode(
                                              response.body);

                                          int result = map['result'];
                                          print("Result :- $result");

                                          if (result == 0) {
                                            print("Try Again");
                                          } else if (result == 2) {
                                            AwesomeDialog(
                                              context: context,
                                              dialogType:
                                              DialogType.error,
                                              animType: AnimType
                                                  .bottomSlide,
                                              title: 'Error',
                                              desc:
                                              'Already User Exist with This Email',
                                              btnOkOnPress: () {},
                                            )
                                              ..show();
                                          } else if (result == 1) {
                                            print("Success");
                                            Get.to(login());
                                          }
                                        }
                                      }
                                    },
                                    child: Container(
                                      height: h * 0.06,
                                      width: w * 0.1,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                          BorderRadius.circular(
                                              14),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.white,
                                                blurRadius: 10,
                                                spreadRadius: -5)
                                          ]),
                                      child: Text(
                                        "Sign Up",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color:
                                                Color(0xff001364),
                                                fontSize: h * 0.03,
                                                fontWeight:
                                                FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: h * 0.03,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        width: w * 0.03,
                                      ),
                                      Text(
                                        "You Have An Account ?",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: h * 0.023)),
                                      ),
                                      TextButton(
                                          onPressed: () {
                                            Get.to(login());
                                          },
                                          child: Text(
                                            "Login",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color:
                                                    Colors.white,
                                                    fontWeight:
                                                    FontWeight
                                                        .bold,
                                                    fontSize:
                                                    h * 0.025,
                                                    decoration:
                                                    TextDecoration
                                                        .underline)),
                                          ))
                                    ],
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

class Rcontrolling extends GetxController {
  RxBool AhideShow = true.obs;
  RxBool EmailError = false.obs;
  RxBool EmailValidError = false.obs;
  RxBool PassError = false.obs;
  RxBool NameError = false.obs;
  RxBool MobileError = false.obs;
  RxBool MobileCharError = false.obs;
  RxBool MobileLenError = false.obs;

  RxInt textLength = 0.obs;
  RxInt maxLength = 10.obs;

  void hideShow() {
    AhideShow.toggle();
  }

  void sub(String name, String email, String contact, String password) {
    print(email);
    print(password);
    if (name.isEmpty) {
      NameError = true.obs;
    } else if (email.isEmpty) {
      EmailError = true.obs;
    } else if (contact.isEmpty) {
      MobileError = true.obs;
    } else if (password.isEmpty) {
      PassError = true.obs;
    } else if (contact.length < 10) {
      MobileLenError = true.obs;
    } else if (contact.length == 10) {
      MobileLenError = false.obs;
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

  void nameError(String value) {
    if (value.isNotEmpty) {
      NameError = false.obs;
    }
  }

  void mobileError(String value) {
    print(value);
    textLength.value = value.length;
    print(textLength);
    if (value.isNumericOnly) {
      MobileCharError = true.obs;
    } else {
      MobileCharError = false.obs;
    }
    if (value.isNotEmpty) {
      MobileError = false.obs;
    }
  }
}
