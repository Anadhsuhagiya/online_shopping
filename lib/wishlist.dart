import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/Home.dart';
import 'package:online_shopping/Modules.dart';

import 'lauoutFor3device.dart';

class wishlist extends StatefulWidget {

  @override
  State<wishlist> createState() => _wishlistState();
}

class _wishlistState extends State<wishlist> {

  var h, w;

  @override
  Widget build(BuildContext context) {

    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final Wcontrolling c = Get.put(Wcontrolling());

    return ResponsiveWidget.isSmallScreen(context)
        ? Scaffold(
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
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 300,
                    width: w,
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Lottie.network("https://assets3.lottiefiles.com/packages/lf20_t9amg50m.json",frameRate: FrameRate(90),height: 180),
                        Text("WISHLIST",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 40)),)
                      ],
                    ),
                  )
                ],
              ),
              Module.LikeTrending.isEmpty ? Align(alignment: Alignment.center,child: Text("No Items to be Added in Your Wishlist",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: h * 0.02)),)) : Container(
                height: h * 0.6,
                width: w,
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 6),
                child: ListView.builder(itemCount: Module.LikeTrending.length,itemBuilder: (context, index) {
                  return Container(
                    height: h * 0.2,
                    width: w,
                    margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: -8,
                          )
                        ]
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(width: w * 0.02,),
                              Container(
                                height: h * 0.17,
                                width: w * 0.2,
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(8),
                                    image: DecorationImage(image: AssetImage("${Module.LikeTrending[index]}"),fit: BoxFit.fill)
                                ),
                              ),
                              SizedBox(width: w * 0.015,),

                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("${Module.LikeTrendingName[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: h * 0.017,fontWeight: FontWeight.bold)),),
                                  Text("SKU : Giving Custome SKU ID",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: h * 0.013,fontWeight: FontWeight.bold)),),
                                  Container(
                                    child: Row(
                                      children: [
                                        Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Text("${Module.LikeTrendingPrice[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: h * 0.017,fontWeight: FontWeight.bold)),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Text("${Module.LikeTrendingMRP[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: h * 0.015,decoration: TextDecoration.lineThrough)),),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.all(3.0),
                                              child: Text("Added On ${Module.LikeTiming[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: h * 0.013,fontWeight: FontWeight.bold)),),
                                            ),
                                            SizedBox(height: h * 0.015,),
                                            Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {



                                                  },
                                                  child: Container(
                                                    height: h * 0.04,
                                                    width: w * 0.23,
                                                    alignment: Alignment.center,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xff001364),
                                                        borderRadius: BorderRadius.circular(13),
                                                        boxShadow: [
                                                          BoxShadow(
                                                              color: Colors.black,
                                                              spreadRadius: -7,
                                                              blurRadius: 10
                                                          )
                                                        ]
                                                    ),
                                                    child: Text("Add To Cart",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: h * 0.016,fontWeight: FontWeight.bold)),),
                                                  ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  );
                },),
              ),
            ],
          ),
        )
    )
        : Scaffold(
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
          children: [
            SizedBox(height: h * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 300,
                  width: w,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.network("https://assets3.lottiefiles.com/packages/lf20_t9amg50m.json",frameRate: FrameRate(90),height: 180),
                      Text("WISHLIST",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 50)),)
                    ],
                  ),
                )
              ],
            ),
            Module.LikeTrending.isEmpty ? Align(alignment: Alignment.center,child: Text("No Items to be Added in Your Wishlist",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18)),)) : Container(
              height: h * 0.9,
              width: 700,
              alignment: Alignment.center,
              child: ListView.builder(itemCount: Module.LikeTrending.length,itemBuilder: (context, index) {
                return Container(
                  height: 120,
                  width: 300,
                  margin: EdgeInsets.only(left: 20,right: 20,top: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: -8,
                      )
                    ]
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(width: 15,),
                            Container(
                              height: 100,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(image: AssetImage("${Module.LikeTrending[index]}"),fit: BoxFit.fill)
                              ),
                            ),
                            SizedBox(width: 15,),

                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${Module.LikeTrendingName[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),),
                                Text("SKU : Giving Custome SKU ID",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: 12)),),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${Module.LikeTrendingPrice[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.bold)),),
                                Text("${Module.LikeTrendingMRP[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: 13,decoration: TextDecoration.lineThrough)),),
                              ],
                            ),
                            SizedBox(width: 25,),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Added On ${Module.LikeTiming[index]}",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12,fontWeight: FontWeight.bold)),),
                                SizedBox(height: 15,),
                                Row(
                                  children: [
                                    InkWell(
                                      onTap: () {



                                      },
                                      child: Container(
                                        height: 35,
                                        width: 110,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          color: Color(0xff001364),
                                          borderRadius: BorderRadius.circular(13),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black,
                                              spreadRadius: -7,
                                              blurRadius: 10
                                            )
                                          ]
                                        ),
                                        child: Text("Add To Cart",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 13,fontWeight: FontWeight.bold)),),
                                      ),
                                    ),
                                    SizedBox(width: 10,),
                                  ],
                                )
                              ],
                            ),
                            SizedBox(width: 20,),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },),
            ),
          ],
        ),
      )
    );
  }
}

class Wcontrolling extends GetxController {
}