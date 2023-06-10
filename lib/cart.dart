import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class cart extends StatefulWidget {
  const cart({Key? key}) : super(key: key);

  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {

  var h, w;
  int qty = 1;

  @override
  Widget build(BuildContext context) {

    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final CAcontrolling c = Get.put(CAcontrolling());

    return Scaffold(
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
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 20,),
                Text("YOUR ORDERS",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 30)),),
              ],
            ),
            SizedBox(height: 15,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 10,),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Color(0xff00245a),
                    borderRadius: BorderRadius.circular(13),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        spreadRadius: -8,
                        blurRadius: 10
                      )
                    ]
                  ),
                  child: Text("Orders",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),),
                ),
                SizedBox(width: 6,),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff00245a),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -8,
                            blurRadius: 10
                        )
                      ]
                  ),
                  child: Text("Returns",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),),
                ),
                SizedBox(width: 6,),
                Container(
                  height: 35,
                  width: 110,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xff00245a),
                      borderRadius: BorderRadius.circular(13),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            spreadRadius: -8,
                            blurRadius: 10
                        )
                      ]
                  ),
                  child: Text("Cancel Order",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.bold)),),
                ),
              ],
            ),
            SizedBox(height: 25,),

            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 800,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Color(0xff7b7b7b),width: 1)
                    ),
                    child: Column(
                      children: [
                        Container(
                          height: 70,
                          width: 800,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffededed),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(width: 30,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Text("ORDER PLACED",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                  Text("Time...",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 13)),),
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Text("TOTAL",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                  Text("₹ 1000",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 14)),),
                                ],
                              ),
                              SizedBox(width: 30,),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(height: 5,),
                                  Text("SHIP TO",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                  Text("Anadh Suhagiya >",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.blue,fontSize: 14)),),
                                ],
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 15,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              child: Row(
                                children: [
                                  SizedBox(width: 10,),
                                  Container(
                                    height: 200,
                                    width: 140,
                                    decoration: BoxDecoration(
                                        color: Color(0xffededed),
                                        borderRadius: BorderRadius.circular(10),
                                        image: DecorationImage(image: AssetImage("images/trending/BlackRangoli.jpeg"),fit: BoxFit.fill)
                                    ),
                                  ),
                                  SizedBox(width: 20,),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text("Jivika Sensational Saree",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 20,fontWeight: FontWeight.bold)),),
                                      SizedBox(height: 10,),
                                      Text("Color : BLACK",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 14,fontWeight: FontWeight.bold)),),
                                      SizedBox(height: 10,),
                                      Text("₹ 1999",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontSize: 14)),),
                                      SizedBox(height: 10,),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              if(qty > 1){
                                                qty--;
                                              }
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff00245a),
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 10,
                                                        spreadRadius: -8
                                                    )
                                                  ]
                                              ),
                                              child: Text("-",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),),
                                            ),
                                          ),
                                          SizedBox(width: 7,),
                                          Container(
                                            height: 30,
                                            width: 70,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(5),
                                                border: Border.all(color: Colors.black,width: 1)
                                            ),
                                            child: Text("$qty",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17)),),
                                          ),
                                          SizedBox(width: 7,),
                                          InkWell(
                                            onTap: () {
                                              if(qty >= 0){
                                                qty++;
                                              }
                                              setState(() {

                                              });
                                            },
                                            child: Container(
                                              height: 20,
                                              width: 20,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff00245a),
                                                  shape: BoxShape.circle,
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black,
                                                        blurRadius: 10,
                                                        spreadRadius: -8
                                                    )
                                                  ]
                                              ),
                                              child: Text("+",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15)),),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),

                            InkWell(
                              onTap: () {

                              },
                              child: Container(
                                height: 40,
                                width: 120,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Color(0xff00245a),
                                  borderRadius: BorderRadius.circular(12),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: -7,
                                      blurRadius: 10
                                    )
                                  ]
                                ),
                                child: Text("Buy",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),),
                              ),
                            ),
                            SizedBox(width: 40,)

                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CAcontrolling extends GetxController {

}
