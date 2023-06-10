import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import 'Modules.dart';

class sell extends StatefulWidget {
  @override
  State<sell> createState() => _sellState();
}

class _sellState extends State<sell> {
  var h, w;

  TextEditingController search = TextEditingController();

  Color btn = Colors.white;
  Color btnTxt = Colors.black;

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final Scontrolling c = Get.put(Scontrolling());

    return Scaffold(
      backgroundColor: Color(0x5987a7fa),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: h * 0.02,
            ),
            Row(
              children: [
                SizedBox(
                  width: w * 0.01,
                ),
                Text(
                  "Hello, Anadh Suhagiya  !",
                  style: GoogleFonts.montserrat(
                      textStyle:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: h * 0.03)),
                ),
              ],
            ),
            SizedBox(
              height: h * 0.02,
            ),

            InkWell(
              onTap: () {

              },
              child: Container(
                width: w,
                height: 50,
                child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: Module.disc.length,itemBuilder: (context, index) {
                  return Container(
                    height: 37,
                    width: 120,
                    margin: EdgeInsets.only(left: 10,top: 7,bottom: 7),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: btn,
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          spreadRadius: -10,
                          blurRadius: 10
                        )
                      ]
                    ),
                    child: Text(
                      "${Module.disc[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: btnTxt,fontSize: 13,fontWeight: FontWeight.bold)),
                    ),
                  );
                },),
              ),
            ),

            SizedBox(
              height: h * 0.03,
            ),
            Container(
              height: h * 0.6,
              width: w,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: Module.Trending.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.44,
                    width: 220,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: -6,
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: h * 0.37,
                                    width: 180,
                                    margin: EdgeInsets.all(6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(Module.Trending[index]),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),

                                Positioned(
                                  right: 2,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      shape: BoxShape.circle,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          spreadRadius: -6,
                                        )
                                      ]
                                    ),
                                    child: Text(
                                      "10%",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 20, top: 0, right: 9),
                          child: Text(
                            "${Module.TrendingNames[index]}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: h * 0.02,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 8, right: 9),
                                  child: Text(
                                    "${Module.TrendingPrice[index]}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: h * 0.017,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1, top: 8, right: 9),
                                  child: Text(
                                    "${Module.TrendingMRP[index]}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            decoration:
                                                TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, top: 8, right: 9),
                                child: InkWell(
                                    onTap: () {
                                      c.like();
                                    },
                                    child: Obx(() => c.Alk.value == true
                                        ? Icon(
                                            MdiIcons.heart,
                                            color: Colors.red,
                                          )
                                        : Icon(
                                            MdiIcons.heartOutline,
                                          )))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: h * 0.035,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff00245a),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: -7)
                                  ]),
                              child: Text(
                                "Add to Cart",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: h * 0.017)),
                              ),
                            ),
                            Container(
                              height: h * 0.035,
                              width: 60,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "5.0",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize: h * 0.016,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(
                                    MdiIcons.star,
                                    color: Colors.green,
                                    size: h * 0.02,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.6,
              width: w,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: Module.Trending.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.44,
                    width: 220,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: -6,
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: h * 0.37,
                                    width: 180,
                                    margin: EdgeInsets.all(6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(Module.Trending[index]),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),

                                Positioned(
                                  right: 2,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                            spreadRadius: -6,
                                          )
                                        ]
                                    ),
                                    child: Text(
                                      "25%",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, top: 0, right: 9),
                          child: Text(
                            "${Module.TrendingNames[index]}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: h * 0.02,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 8, right: 9),
                                  child: Text(
                                    "${Module.TrendingPrice[index]}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: h * 0.017,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1, top: 8, right: 9),
                                  child: Text(
                                    "${Module.TrendingMRP[index]}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, top: 8, right: 9),
                                child: InkWell(
                                    onTap: () {
                                      c.like();
                                    },
                                    child: Obx(() => c.Alk.value == true
                                        ? Icon(
                                      MdiIcons.heart,
                                      color: Colors.red,
                                    )
                                        : Icon(
                                      MdiIcons.heartOutline,
                                    )))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: h * 0.035,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff00245a),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: -7)
                                  ]),
                              child: Text(
                                "Add to Cart",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: h * 0.017)),
                              ),
                            ),
                            Container(
                              height: h * 0.035,
                              width: 60,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "5.0",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize: h * 0.016,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(
                                    MdiIcons.star,
                                    color: Colors.green,
                                    size: h * 0.02,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
            SizedBox(
              height: h * 0.02,
            ),
            Container(
              height: h * 0.6,
              width: w,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: Module.Trending.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.44,
                    width: 220,
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(7),
                    decoration: BoxDecoration(
                        color: Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            spreadRadius: -6,
                            blurRadius: 10,
                          )
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Flexible(
                                  child: Container(
                                    height: h * 0.37,
                                    width: 180,
                                    margin: EdgeInsets.all(6),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(Module.Trending[index]),
                                            fit: BoxFit.fill),
                                        borderRadius: BorderRadius.circular(10)),
                                  ),
                                ),

                                Positioned(
                                  right: 2,
                                  child: Container(
                                    height: 40,
                                    width: 40,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                            spreadRadius: -6,
                                          )
                                        ]
                                    ),
                                    child: Text(
                                      "50%",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 20, top: 0, right: 9),
                          child: Text(
                            "${Module.TrendingNames[index]}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: h * 0.02,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 20, top: 8, right: 9),
                                  child: Text(
                                    "${Module.TrendingPrice[index]}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontSize: h * 0.017,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 1, top: 8, right: 9),
                                  child: Text(
                                    "${Module.TrendingMRP[index]}",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            decoration:
                                            TextDecoration.lineThrough,
                                            color: Colors.grey,
                                            fontSize: h * 0.015,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, top: 8, right: 9),
                                child: InkWell(
                                    onTap: () {
                                      c.like();
                                    },
                                    child: Obx(() => c.Alk.value == true
                                        ? Icon(
                                      MdiIcons.heart,
                                      color: Colors.red,
                                    )
                                        : Icon(
                                      MdiIcons.heartOutline,
                                    )))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: h * 0.035,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff00245a),
                                  borderRadius: BorderRadius.circular(6),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: -7)
                                  ]),
                              child: Text(
                                "Add to Cart",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: h * 0.017)),
                              ),
                            ),
                            Container(
                              height: h * 0.035,
                              width: 60,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "5.0",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize: h * 0.016,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                  Icon(
                                    MdiIcons.star,
                                    color: Colors.green,
                                    size: h * 0.02,
                                  )
                                ],
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class Scontrolling extends GetxController {
  RxBool Alk = false.obs;

  void like() {
    Alk.toggle();
  }
}
