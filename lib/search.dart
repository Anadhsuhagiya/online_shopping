import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/Modules.dart';

class search extends StatefulWidget {

  String searchVal;

  search(this.searchVal);


  @override
  State<search> createState() => _searchState();
}

class _searchState extends State<search> {

  String TrendPic = "";
  String TrendName = "";
  String TrendPrice = "";
  String TrendMRP = "";

  bool SearchAvail = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CompareSearch();
    ProductImage = TrendPic;
  }

  CompareSearch(){
    for(int i =0; i<Module.TrendingNames.length; i++){
      if(Module.TrendingNames[i].compareTo(widget.searchVal) == 0){
        TrendPic = Module.Trending[i];
        TrendName = Module.TrendingNames[i];
        TrendPrice = Module.TrendingPrice[i];
        TrendMRP = Module.TrendingMRP[i];
        SearchAvail = true;
        break;
      }
    }
    print("Search Avail = $SearchAvail");
    setState(() {

    });

  }

  var h, w;
  String ProductImage = "";

  TextEditingController houseNo = TextEditingController();
  bool houseNoError = false;
  TextEditingController StreetName = TextEditingController();
  bool StreetNameError = false;
  TextEditingController Area = TextEditingController();
  bool AreaError = false;
  TextEditingController District = TextEditingController();
  bool DistrictError = false;
  TextEditingController AState = TextEditingController();
  bool AStateError = false;
  TextEditingController Pincode = TextEditingController();
  bool PincodeError = false;
  String PincodeMSG = "";

  String Location = "Select Location";



  @override
  Widget build(BuildContext context) {

    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final Sacontrolling c = Get.put(Sacontrolling());

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

      body: SearchAvail ? SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            Container(
              width: 570,
              height: h,
              margin: EdgeInsets.symmetric(horizontal: 50,vertical: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 10,
                    spreadRadius: -6
                  )
                ]
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: () {
                        ProductImage = TrendPic;
                        setState(() {

                        });
                      },
                      child: Container(
                        height: 730,
                          width: 80,
                          child: ListView.builder(itemCount: 4,itemBuilder: (context, index) {
                            return Container(
                              height: 110,
                              width: 80,
                              margin: EdgeInsets.symmetric(vertical: 7),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8),
                                image: DecorationImage(image: AssetImage(TrendPic),fit: BoxFit.fill),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: -8,
                                    blurRadius: 10
                                  )
                                ]
                              ),
                            );
                          },)),
                    ),
                    SizedBox(width: 10,),

                    Container(
                      width: 450,
                      height: h,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(image: AssetImage(ProductImage),fit: BoxFit.fill)
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: h,
              width: 740,
              margin: EdgeInsets.only(right: 50,top: 20,bottom: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: -6
                    )
                  ]
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text("$TrendName",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 22)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 9),
                    child: Text("Special Price",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 11)),),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 20,top: 9),
                        child: Text("$TrendPrice",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 17)),),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 5,top: 9),
                        child: Text("$TrendMRP",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 12,decoration: TextDecoration.lineThrough)),),
                      ),
                    ],
                  ),
                  Container(
                    height: 25,
                    width: 55,
                    alignment: Alignment.center,
                    margin: EdgeInsets.only(left: 20,top: 9),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Text("4.5",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 14,fontWeight: FontWeight.bold)),),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(padding: EdgeInsets.only(left: 20,top: 9),child: Text("Color :  ",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Color(0xffacacac),fontWeight: FontWeight.bold,fontSize: 11)),),),
                      Container(
                        height: 40,
                        width: 300,
                        child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: Module.SareeColor.length,itemBuilder: (context, index) {
                          return Container(
                            height: 30,
                            width: 30,
                            margin: EdgeInsets.only(left: 7),
                            decoration: BoxDecoration(
                              color: Module.SareeColor[index],
                              shape: BoxShape.circle
                            ),
                          );
                        },),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 9),
                    child: Text("Details",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold)),),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,top: 3),
                    child: Text('''Color : Black
Saree Fabric : Geogrette
Saree Pattern : Banarasi
Saree Length : 5.5 mm
Blouse Length : 0.8 mm
Blouse Fabric : Geogrette
Blouse Color : White
                    
saree for Women By Wearing Our New Amazing Product You Look Very Graceful Or Pretty. 
Thank you For Choosing Our Brand Product to Wear. We Hope That You feel too much Better 
After Purchase Our Product. This Sari is Best Match for Get Together, Perfect for Party, 
Wedding, Festival, Traditional, Bridle, and Best Gift for Your Loved Ones.''',style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20,top: 9),
                    child: Text("Stock Available",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 15)),),
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {
                          showDialog(context: context, builder: (context) {
                            return AlertDialog(
                              title: Text("Location Details",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold)),),
                              content: Container(
                                width: 500,
                                height: h,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          if(value.isNotEmpty){
                                            houseNoError = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        controller: houseNo,
                                        cursorColor: Colors.black,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                        decoration: InputDecoration(
                                          hintText: "Enter House No.",
                                          label: Text("House No.",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                          errorText: houseNoError ? "Please Enter House No." : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          if(value.isNotEmpty){
                                            StreetNameError = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        controller: StreetName,
                                        cursorColor: Colors.black,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                        decoration: InputDecoration(
                                          hintText: "Enter Street Name",
                                          label: Text("Street",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                          errorText: StreetNameError ? "Please Enter Street Name" : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          if(value.isNotEmpty){
                                            AreaError = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        controller: Area,
                                        cursorColor: Colors.black,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                        decoration: InputDecoration(
                                          hintText: "Enter Area",
                                          label: Text("Area",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                          errorText: AreaError ? "Please Enter Area" : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          if(value.isNotEmpty){
                                            DistrictError = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        controller: District,
                                        cursorColor: Colors.black,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                        decoration: InputDecoration(
                                          hintText: "Enter District",
                                          label: Text("District",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                          errorText: DistrictError ? "Please Enter District" : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          if(value.isNotEmpty){
                                            AStateError = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        controller: AState,
                                        cursorColor: Colors.black,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                        decoration: InputDecoration(
                                          hintText: "Enter State",
                                          label: Text("State",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                          errorText: AStateError ? "Please Enter State" : null,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        onChanged: (value) {
                                          if(value.isNotEmpty){
                                            PincodeError = false;
                                            setState(() {

                                            });
                                          }
                                        },
                                        controller: Pincode,
                                        cursorColor: Colors.black,
                                        maxLength: 6,
                                        style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),
                                        decoration: InputDecoration(
                                          hintText: "Enter Pincode",
                                          label: Text("Pincode",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 12)),),
                                          errorText: PincodeError ? PincodeMSG : null,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              actions: [
                                TextButton(onPressed: () {
                                  Get.back();
                                }, child: Text("Cancel",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.red,fontSize: 18,fontWeight: FontWeight.bold)),)),

                                TextButton(onPressed: () {
                                  String HOUSENO = houseNo.text.trim();
                                  String STREET = StreetName.text.trim();
                                  String AREA = Area.text.trim();
                                  String DISTRICT = District.text.trim();
                                  String STATE = AState.text.trim();
                                  String PINCODE = Pincode.text.trim();

                                  if(HOUSENO.isEmpty){
                                    houseNoError = true;
                                    setState(() {

                                    });
                                  }
                                  else if(STREET.isEmpty){
                                    StreetNameError = true;
                                    setState(() {

                                    });
                                  }
                                  else if(AREA.isEmpty){
                                    AreaError = true;
                                    setState(() {

                                    });
                                  }
                                  else if(DISTRICT.isEmpty){
                                    DistrictError = true;
                                    setState(() {

                                    });
                                  }
                                  else if(STATE.isEmpty){
                                    AStateError = true;
                                    setState(() {

                                    });
                                  }
                                  else if(PINCODE.isEmpty){
                                    PincodeError = true;
                                    PincodeMSG = "Please Enter Pincode";
                                    setState(() {

                                    });
                                  }
                                  else if(PINCODE.length < 6){
                                    PincodeError = true;
                                    PincodeMSG = "Please Enter 6 Digit Code";
                                    setState(() {

                                    });
                                  }
                                  else{
                                    Location = DISTRICT;
                                    setState(() {

                                    });
                                    Get.back();
                                  }
                                }, child: Text("Submit",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.green,fontSize: 18,fontWeight: FontWeight.bold)),))
                              ],
                            );
                          },);
                        },
                        child: Container(
                          height: 40,
                          width: 160,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.black,width: 2),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                spreadRadius: -8,
                                blurRadius: 10
                              )
                            ]
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(Icons.location_on,color: Colors.black,),
                              District.text.isEmpty ? Text(Location,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),) : Text(Location,style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 14)),)
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      SizedBox(width: 20,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: Color(0xffffdf55),
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                spreadRadius: -8
                              )
                            ]
                          ),
                          child: Text("Add To Cart",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black,fontSize: 14)),),
                        ),
                      ),
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: () {

                        },
                        child: Container(
                          height: 40,
                          width: 130,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(0xff006206),
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -8
                                )
                              ]
                          ),
                          child: Text("Buy Now",style: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.white,fontSize: 14)),),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ) : Center(
        child: CircularProgressIndicator(color: Color(0xff00245a),strokeWidth: 4),
      ),
    );
  }
}

class Sacontrolling extends GetxController {

}










