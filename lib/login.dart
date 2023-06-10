import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/Registration.dart';
import 'package:online_shopping/forgot.dart';
import 'package:particles_flutter/particles_flutter.dart';

import 'Home.dart';
import 'lauoutFor3device.dart';

class login extends StatefulWidget {
  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  var h, w;

  TextEditingController emailMobile = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final Acontrolling c = Get.put(Acontrolling());

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
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "LOGIN",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: h * 0.034,
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
                                child: Obx(() => TextField(
                                      controller: emailMobile,
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
                                        hintText: "Enter Email or Contact",
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
                                child: Obx(() => TextField(
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
                                height: h * 0.02,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(forgot());
                                      },
                                      child: Text(
                                        "Forgot Password ?",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: h * 0.02,
                              ),
                              InkWell(
                                onTap: () async {
                                  String UserName = emailMobile.text.trim();
                                  String PASSWORD = password.text.trim();

                                  c.sub(UserName, PASSWORD);

                                  if (c.EmailError.value == true) {
                                    Fluttertoast.showToast(
                                        msg: "Please Fill the Email",
                                        webBgColor:
                                            "linear-gradient(to right, #a30000, #ff4a4a)");
                                  } else if (c.PassError.value == true &&
                                      c.EmailError.value == false) {
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
                                                  Text("Login",
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

                                    String api =
                                        "https://flutteranadh.000webhostapp.com/onlineShopping/login.php?username=$UserName&password=$PASSWORD";

                                    var response = await Dio().get(api);

                                    print(response);

                                    Get.back();

                                    if (response.statusCode == 200) {
                                      Map map = jsonDecode(response.data);

                                      int result = map['result'];
                                      print("result == $result");

                                      if (result == 0) {
                                        AwesomeDialog(
                                          context: context,
                                          dialogType: DialogType.error,
                                          animType: AnimType.bottomSlide,
                                          title: 'Error',
                                          desc:
                                              'Username or Password is Invalid',
                                          btnOkOnPress: () {},
                                        )..show();
                                      } else {
                                        Map data = map['data'];

                                        String id = data['id'];
                                        String name = data['name'];
                                        String email = data['email'];
                                        String phone = data['phone'];
                                        String password = data['password'];

                                        Get.offAll(Home(
                                            id, name, email, phone, password));
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
                                      borderRadius: BorderRadius.circular(9),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.white,
                                            blurRadius: 10,
                                            spreadRadius: -5)
                                      ]),
                                  child: Text(
                                    "Sign In",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Color(0xff001364),
                                            fontSize: h * 0.028,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: h * 0.03,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: w * 0.03,
                                  ),
                                  Text(
                                    "You Don't Have An Account ?",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: h * 0.021)),
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(Registration());
                                      },
                                      child: Text(
                                        "Click Here",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: h * 0.023)),
                                      ))
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "LOGIN",
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
                                            width: 360,
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
                                                      color: Color(0xffffffff),
                                                    ),
                                                    hintText:
                                                        "Enter Email or Contact",
                                                    hintStyle:
                                                        GoogleFonts.montserrat(
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
                                            height: h * 0.03,
                                          ),
                                          Container(
                                            width: 360,
                                            height: h * 0.06,
                                            alignment: Alignment.centerLeft,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.2),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                            child: Obx(() => TextField(
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
                                                      border: InputBorder.none,
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
                                                                  MdiIcons.eye,
                                                                  color: Colors
                                                                      .white,
                                                                  size:
                                                                      h * 0.023,
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
                                            height: h * 0.02,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              SizedBox(
                                                width: w * 0.03,
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Get.to(forgot());
                                                  },
                                                  child: Text(
                                                    "Forgot Password ?",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 16)),
                                                  ))
                                            ],
                                          ),
                                          SizedBox(
                                            height: h * 0.05,
                                          ),
                                          InkWell(
                                            onTap: () async {
                                              String UserName =
                                                  emailMobile.text.trim();
                                              String PASSWORD =
                                                  password.text.trim();

                                              c.sub(UserName, PASSWORD);

                                              if (c.EmailError.value == true) {
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Please Fill the Email",
                                                    webBgColor:
                                                        "linear-gradient(to right, #a30000, #ff4a4a)");
                                              } else if (c.PassError.value ==
                                                      true &&
                                                  c.EmailError.value == false) {
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
                                                            color: Colors.white,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            children: [
                                                              CircularProgressIndicator(
                                                                color: Colors
                                                                    .black,
                                                                strokeWidth: 4,
                                                              ),
                                                              Text("Login",
                                                                  style: GoogleFonts.montserrat(
                                                                      textStyle: TextStyle(
                                                                          color: Colors
                                                                              .black,
                                                                          fontSize: h *
                                                                              0.03,
                                                                          fontWeight:
                                                                              FontWeight.bold))),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );

                                                String api =
                                                    "https://flutteranadh.000webhostapp.com/onlineShopping/login.php?username=$UserName&password=$PASSWORD";

                                                var response =
                                                    await Dio().get(api);

                                                print(response);

                                                Get.back();

                                                if (response.statusCode ==
                                                    200) {
                                                  Map map =
                                                      jsonDecode(response.data);

                                                  int result = map['result'];
                                                  print("result == $result");

                                                  if (result == 0) {
                                                    AwesomeDialog(
                                                      context: context,
                                                      dialogType:
                                                          DialogType.error,
                                                      animType:
                                                          AnimType.bottomSlide,
                                                      title: 'Error',
                                                      desc:
                                                          'Username or Password is Invalid',
                                                      btnOkOnPress: () {},
                                                    )..show();
                                                  } else {
                                                    Map data = map['data'];

                                                    String id = data['id'];
                                                    String name = data['name'];
                                                    String email =
                                                        data['email'];
                                                    String phone =
                                                        data['phone'];
                                                    String password =
                                                        data['password'];

                                                    Get.offAll(Home(
                                                        id,
                                                        name,
                                                        email,
                                                        phone,
                                                        password));
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
                                                "Sign In",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color:
                                                            Color(0xff001364),
                                                        fontSize: 20,
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
                                                "You Don't Have An Account ?",
                                                style: GoogleFonts.montserrat(
                                                    textStyle: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16)),
                                              ),
                                              TextButton(
                                                  onPressed: () {
                                                    Get.to(Registration());
                                                  },
                                                  child: Text(
                                                    "Click Here",
                                                    style:
                                                        GoogleFonts.montserrat(
                                                            textStyle: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontSize: 19)),
                                                  ))
                                            ],
                                          ),
                                        ],
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
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "WELCOME !",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: h * 0.09,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                      SizedBox(
                                        height: h * 0.06,
                                      ),
                                      Text(
                                        "Shop 'til you drop with our unbeatable selection!\nDiscover your new favorite items with our curated collections.\nFind the perfect purchase for any occasion, all in one place.\nStep into a world of style and convenience with us.\nWelcome to the ultimate destination for fashion, beauty, and more.",
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
                                              "LOGIN",
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
                                                      hintText:
                                                          "Enter Email or Contact",
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
                                              child: Obx(() => TextField(
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
                                              height: h * 0.02,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                SizedBox(
                                                  width: w * 0.03,
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Get.to(forgot());
                                                    },
                                                    child: Text(
                                                      "Forgot Password ?",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: h *
                                                                      0.020)),
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: h * 0.05,
                                            ),
                                            InkWell(
                                              onTap: () async {
                                                String UserName =
                                                    emailMobile.text.trim();
                                                String PASSWORD =
                                                    password.text.trim();

                                                c.sub(UserName, PASSWORD);

                                                if (c.EmailError.value ==
                                                    true) {
                                                  Fluttertoast.showToast(
                                                      msg:
                                                          "Please Fill the Email",
                                                      webBgColor:
                                                          "linear-gradient(to right, #a30000, #ff4a4a)");
                                                } else if (c.PassError.value ==
                                                        true &&
                                                    c.EmailError.value ==
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
                                                                Text("Login",
                                                                    style: GoogleFonts.montserrat(
                                                                        textStyle: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: h *
                                                                                0.03,
                                                                            fontWeight:
                                                                                FontWeight.bold))),
                                                              ],
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );

                                                  String api =
                                                      "https://flutteranadh.000webhostapp.com/onlineShopping/login.php?username=$UserName&password=$PASSWORD";

                                                  var response =
                                                      await Dio().get(api);

                                                  print(response);

                                                  Get.back();

                                                  if (response.statusCode ==
                                                      200) {
                                                    Map map = jsonDecode(
                                                        response.data);

                                                    int result = map['result'];
                                                    print("result == $result");

                                                    if (result == 0) {
                                                      AwesomeDialog(
                                                        context: context,
                                                        dialogType:
                                                            DialogType.error,
                                                        animType: AnimType
                                                            .bottomSlide,
                                                        title: 'Error',
                                                        desc:
                                                            'Username or Password is Invalid',
                                                        btnOkOnPress: () {},
                                                      )..show();
                                                    } else {
                                                      Map data = map['data'];

                                                      String id = data['id'];
                                                      String name =
                                                          data['name'];
                                                      String email =
                                                          data['email'];
                                                      String phone =
                                                          data['phone'];
                                                      String password =
                                                          data['password'];

                                                      Get.offAll(Home(
                                                          id,
                                                          name,
                                                          email,
                                                          phone,
                                                          password));
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
                                                  "Sign In",
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
                                                  "You Don't Have An Account ?",
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: h * 0.018)),
                                                ),
                                                TextButton(
                                                    onPressed: () {
                                                      Get.to(Registration());
                                                    },
                                                    child: Text(
                                                      "Click Here",
                                                      style: GoogleFonts
                                                          .montserrat(
                                                              textStyle: TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize: h *
                                                                      0.021)),
                                                    ))
                                              ],
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

class Acontrolling extends GetxController {
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
