import 'dart:convert';
import 'dart:ui';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dropdown_textfield/dropdown_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:icon_forest/amazingneoicons.dart';
import 'package:icon_forest/app_crypto_icons.dart';
import 'package:icon_forest/flat_icons_arrows.dart';
import 'package:icon_forest/kicons_emoji.dart';
import 'package:lottie/lottie.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/Category.dart';
import 'package:online_shopping/Modules.dart';
import 'package:online_shopping/cart.dart';
import 'package:online_shopping/customerService.dart';
import 'package:online_shopping/lauoutFor3device.dart';
import 'package:online_shopping/login.dart';
import 'package:online_shopping/search.dart';
import 'package:http/http.dart' as http;
import 'package:online_shopping/sell.dart';
import 'package:online_shopping/wishlist.dart';

class Home extends StatefulWidget {
  String id;
  String name;
  String email;
  String phone;
  String password;

  Home(this.id, this.name, this.email, this.phone, this.password);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var Screensize, height, width;

  SingleValueDropDownController search1 = SingleValueDropDownController();
  String searchVal = "";
  CarouselController buttonCarouselController = CarouselController();
  TextEditingController search2 = TextEditingController();

  List<String> sea = ["Anadh", "Devavrat"];

  bool LocationHover = false;
  bool RetOrdHover = false;
  bool HomeHover = false;
  bool CategoryHover = false;
  bool SellHover = false;
  bool wishListHover = false;
  bool custServiHover = false;

  bool ProfileHover = false;

  String ImaFac = "images/facebook.png";
  String ImaIns = "images/instagram.png";
  String ImaLin = "images/linkedin.png";

  bool fac = false;
  bool ins = false;
  bool lin = false;

  List<String> temp = [];

  List<BoxShadow> BoxShad = [];
  List<BoxShadow> BoxShadAccount = [];
  Border? AccountBorder;

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
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  var l;
  bool locationGet = false;

  Anadh() async {
    var url = Uri.parse(
        'https://flutteranadh.000webhostapp.com/onlineShopping/getAddress.php');
    var response = await http.get(url);

    print("Respose === ${response}");

    if (response.statusCode == 200) {
      Map map = jsonDecode(response.body);
      l = map;

      for(int i = 0; i<l['data'].length; i++){

        if(widget.id == l['data'][i]['id']){
          houseNo.text = l['data'][i]['houseNo'];
          StreetName.text = l['data'][i]['streetName'];
          Area.text = l['data'][i]['area'];
          District.text = l['data'][i]['district'];
          AState.text = l['data'][i]['astate'];
          Pincode.text = l['data'][i]['pincode'];
          locationGet = true;
          setState(() {});
        }
        else{
          locationGet = false;
          setState(() {});
        }
      }

    }
  }

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    final Ccontrolling c = Get.put(Ccontrolling());

    return ResponsiveWidget.isMediumScreen(context)
        ? Scaffold(
            backgroundColor: Color(0x5987a7fa),
            drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                      decoration: BoxDecoration(color: Color(0xff00245a)),
                      currentAccountPicture: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset(
                          "images/profile.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                      accountName: Text(
                        "Anadh Suhagiya",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                      ),
                      accountEmail: Text("anadhsuhagiya65@gmail.com",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14)))),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      Get.to(Home(widget.id, widget.name, widget.email,
                          widget.phone, widget.password));
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.home,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Home",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      Get.to(category());
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.shopping,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Category",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      Get.to(sell());
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.tag,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Sale",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      Get.to(wishlist());
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.heart,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Wishlist",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      Get.to(customerServices());
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          Icons.person,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Customer Support",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    mouseCursor: MaterialStateMouseCursor.clickable,
                    onTap: () {
                      Get.to(login());
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(
                          MdiIcons.logout,
                          color: Colors.black,
                        ),
                        title: Text(
                          "Sign Out",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            appBar: AppBar(
              backgroundColor: Color(0xff00245a),
              title: Row(
                children: [
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Image.asset(
                    'images/store.png',
                    height: height * 0.05,
                  ),
                  SizedBox(
                    width: width * 0.02,
                  ),
                  Text(
                    "9 Vision",
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: height * 0.025,
                            fontWeight: FontWeight.bold)),
                  ),

                  SizedBox(
                    width: width * 0.032,
                  ),

                  // Account Signin

                  Tooltip(
                    message: "Sign In",
                    textStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: -5,
                          )
                        ]),
                    child: InkWell(
                      onTap: () {
                        Get.to(login());
                      },
                      onHover: (value) {
                        if (value == true) {
                          BoxShadAccount = [
                            BoxShadow(
                              color: Color(0xff000000),
                              spreadRadius: -5,
                              blurRadius: 10,
                            )
                          ];

                          AccountBorder =
                              Border.all(color: Colors.black, width: 1);
                        } else {
                          BoxShadAccount = [
                            BoxShadow(color: Colors.transparent)
                          ];
                          AccountBorder =
                              Border.all(color: Colors.white, width: 0);
                        }
                        setState(() {});
                      },
                      child: Container(
                        height: height * 0.06,
                        width: height * 0.06,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: BoxShadAccount,
                            border: AccountBorder,
                            borderRadius: BorderRadius.circular(60)),
                        child: Image.asset(
                          "images/profile.png",
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    width: width * 0.03,
                  ),

                  // Search Text Field
                  Container(
                      height: height * 0.045,
                      width: width * 0.4,
                      alignment: AlignmentDirectional.centerStart,
                      padding: EdgeInsets.only(bottom: 9, top: 4),
                      decoration: BoxDecoration(
                          color: Color(0xffececec),
                          borderRadius: BorderRadius.circular(50),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                spreadRadius: -10,
                                offset: Offset(2, 4))
                          ]),
                      child: TypeAheadField(
                        animationStart: 0.5,
                        animationDuration: Duration(milliseconds: 500),
                        textFieldConfiguration: TextFieldConfiguration(
                            controller: search2,
                            autofocus: false,
                            cursorColor: Colors.black,
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold)),
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              errorBorder: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintStyle: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      fontSize: height * 0.02,
                                      fontWeight: FontWeight.bold)),
                              hintText: "Search Product",
                              prefixIcon: Icon(
                                MdiIcons.shoppingSearch,
                                color: Colors.black,
                                size: height * 0.03,
                              ),
                            )),
                        suggestionsBoxDecoration: SuggestionsBoxDecoration(
                          color: Colors.lightBlue[50],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        suggestionsCallback: (pattern) {
                          List<String> matches = <String>[];
                          matches.addAll(Module.TrendingNames);

                          matches.retainWhere((s) {
                            return s
                                .toLowerCase()
                                .contains(pattern.toLowerCase());
                          });
                          return matches;
                        },
                        itemBuilder: (context, sone) {
                          return Card(
                              child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            child: Text(sone.toString()),
                          ));
                        },
                        onSuggestionSelected: (suggestion) {
                          search2.text = suggestion;
                          print(suggestion);
                          setState(() {});
                        },
                      )
                      // RawAutocomplete(
                      //   optionsBuilder: (TextEditingValue textEditingValue) {
                      //     if (textEditingValue.text == '') {
                      //       return const Iterable<String>.empty();
                      //     }else{
                      //       List<String> matches = [];
                      //       matches.addAll(Module.TrendingNames);
                      //
                      //       matches.retainWhere((s){
                      //         return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                      //       });
                      //       return matches;
                      //     }
                      //   },
                      //
                      //   onSelected: (String selection) {
                      //     print('You just selected $selection');
                      //   },
                      //
                      //   fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                      //       FocusNode focusNode,
                      //       VoidCallback onFieldSubmitted) {
                      //     return TextField(
                      //       decoration: InputDecoration(
                      //         border: InputBorder.none,
                      //             errorBorder: InputBorder.none,
                      //             enabledBorder: InputBorder.none,
                      //             focusedBorder: InputBorder.none,
                      //             hintStyle: GoogleFonts.montserrat(
                      //                 textStyle: TextStyle(
                      //                     fontSize: height * 0.02,
                      //                     fontWeight: FontWeight.bold)),
                      //             hintText: "Search Product",
                      //             prefixIcon: Icon(
                      //               MdiIcons.shoppingSearch,
                      //               color: Colors.black,
                      //               size: height * 0.03,
                      //             ),
                      //       ),
                      //       controller: textEditingController,
                      //       focusNode: focusNode,
                      //       cursorColor: Colors.black,
                      //       onSubmitted: (String value) {
                      //
                      //       },
                      //     );
                      //   },
                      //
                      //   optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
                      //       Iterable<String> options) {
                      //     return Material(
                      //       elevation: 1,
                      //       shadowColor: Colors.black,
                      //       textStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black)),
                      //       type: MaterialType.canvas,
                      //       borderRadius: BorderRadius.circular(12),
                      //       child: SizedBox(
                      //           height: 200,
                      //           child:SingleChildScrollView(
                      //             child: Column(
                      //               mainAxisAlignment: MainAxisAlignment.start,
                      //               children: options.map((opt){
                      //                 return InkWell(
                      //                     onTap: (){
                      //                       onSelected(opt);
                      //                     },
                      //                     child:Container(
                      //                         padding: EdgeInsets.only(right:60),
                      //                         child:Card(
                      //                             child: Container(
                      //                               width: double.infinity,
                      //                               padding: EdgeInsets.all(10),
                      //                               child:Text(opt),
                      //                             )
                      //                         )
                      //                     )
                      //                 );
                      //               }).toList(),
                      //             ),
                      //           )
                      //       ),
                      //     );
                      //   },
                      // )

                      // DropDownTextField(
                      //   textFieldDecoration: InputDecoration(
                      //       border: InputBorder.none,
                      //       hintText: "Search",
                      //       prefixIcon: Icon(
                      //         MdiIcons.shoppingSearch,
                      //         color: Colors.black,
                      //         size: height * 0.03,
                      //       )
                      //   ),
                      //   textStyle: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                      //   clearOption: true,
                      //   enableSearch: true,
                      //   dropDownList: [
                      //     for(int i = 0; i<Module.TrendingNames.length; i++)
                      //       DropDownValueModel(name: '${Module.TrendingNames[i]}', value: Module.TrendingNames[i])
                      //   ],
                      //
                      // )

                      // TextField(
                      //   controller: search,
                      //   onChanged: (value) {
                      //     temp.clear();
                      //     for (int i = 0; i < Module.TrendingNames.length; i++) {
                      //       if (Module.TrendingNames[i].toString()
                      //           .toLowerCase()
                      //           .contains(value.trim().toLowerCase())) {
                      //         temp.add(Module.TrendingNames[i]);
                      //       }
                      //     }
                      //
                      //
                      //
                      //   },
                      //   cursorColor: Colors.black,
                      //   textAlignVertical: TextAlignVertical.top,
                      //   style: GoogleFonts.montserrat(
                      //       textStyle: TextStyle(
                      //           fontWeight: FontWeight.bold,
                      //           fontSize: height * 0.02)),
                      //   decoration: InputDecoration(
                      //     border: InputBorder.none,
                      //     errorBorder: InputBorder.none,
                      //     enabledBorder: InputBorder.none,
                      //     focusedBorder: InputBorder.none,
                      //     hintStyle: GoogleFonts.montserrat(
                      //         textStyle: TextStyle(
                      //             fontSize: height * 0.02,
                      //             fontWeight: FontWeight.bold)),
                      //     hintText: "Search Product",
                      //     prefixIcon: Icon(
                      //       MdiIcons.shoppingSearch,
                      //       color: Colors.black,
                      //       size: height * 0.03,
                      //     ),
                      //   ),
                      // ),
                      ),
                  SizedBox(
                    width: width * 0.02,
                  ),

                  IconButton(
                      onPressed: () {
                        searchVal = search2.text;

                        if (searchVal.isNotEmpty) {
                          Get.to(search(searchVal));
                        }
                      },
                      icon: Icon(
                        Icons.search,
                        color: Colors.white,
                        shadows: [Shadow(color: Colors.white, blurRadius: 4)],
                      ))
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: height * 0.02,
                  ),

                  // Menus
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: width * 0.02,
                      ),
                      Text(
                        "Hello !  ${widget.name}",
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: height * 0.03)),
                      ),
                    ],
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  // Auto Image Slider
                  Container(
                    height: 400,
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 900),
                          autoPlayCurve: Curves.decelerate,
                          clipBehavior: Clip.antiAlias,
                          viewportFraction: 0.5,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeFactor: 0.2,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          height: height * 0.5),
                      items: Module.SareeSlider.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: 600,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                      image: AssetImage(i), fit: BoxFit.fill),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: -5)
                                  ],
                                  borderRadius: BorderRadius.circular(20)),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  //Trending Products
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Tranding Product",
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: height * 0.04)),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: height * 0.046,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xff00245a),
                    indent: width * 0.04,
                    endIndent: width / 1.28,
                    thickness: 4,
                    height: 10,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.6,
                    width: width,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      itemCount: Module.Trending.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.44,
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
                                  Flexible(
                                    child: Container(
                                      height: height * 0.37,
                                      width: 180,
                                      margin: EdgeInsets.all(6),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  Module.Trending[index]),
                                              fit: BoxFit.fill),
                                          borderRadius:
                                              BorderRadius.circular(12)),
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 20, top: 0, right: 9),
                                child: Text(
                                  "${Module.TrendingNames[index]}",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontSize: height * 0.02,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  fontSize: height * 0.017,
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
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                  fontSize: height * 0.015,
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
                                            c.like(index);

                                            if (c.Alk[index].value == true) {
                                              Module.LikeTrending.add(
                                                  "${Module.Trending[index]}");
                                              Module.LikeTrendingName.add(
                                                  "${Module.TrendingNames[index]}");
                                              Module.LikeTrendingPrice.add(
                                                  "${Module.TrendingPrice[index]}");
                                              Module.LikeTrendingMRP.add(
                                                  "${Module.TrendingMRP[index]}");
                                              Module.LikeTiming.add(
                                                  "${DateTime.now()}");
                                            } else {
                                              Module.LikeTrending.remove(
                                                  "${Module.Trending[index]}");
                                              Module.LikeTrendingName.remove(
                                                  "${Module.TrendingNames[index]}");
                                              Module.LikeTrendingPrice.remove(
                                                  "${Module.TrendingPrice[index]}");
                                              Module.LikeTrendingMRP.remove(
                                                  "${Module.TrendingMRP[index]}");
                                              Module.LikeTiming.removeAt(index);
                                            }
                                          },
                                          child: Obx(
                                              () => c.Alk[index].value == true
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: height * 0.035,
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
                                              fontSize: height * 0.017)),
                                    ),
                                  ),
                                  Container(
                                    height: height * 0.035,
                                    width: 60,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Text(
                                          "5.0",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: height * 0.016,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(
                                          MdiIcons.star,
                                          color: Colors.green,
                                          size: height * 0.02,
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

                  // Best Deals
                  SizedBox(
                    height: height * 0.07,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Best Deals",
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: height * 0.04)),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: height * 0.046,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xff00245a),
                    indent: width * 0.04,
                    endIndent: width / 1.18,
                    thickness: 4,
                    height: 10,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: height * 0.4,
                    width: width,
                    alignment: Alignment.center,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Flexible(
                          child: Container(
                            height: height * 0.3,
                            width: 400,
                            margin: EdgeInsets.all(10),
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
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 10,
                                      ),
                                      child: Text(
                                        "${Module.TrendingNames[index]}",
                                        overflow: TextOverflow.ellipsis,
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                        vertical: 0,
                                      ),
                                      child: Text(
                                        "New Design",
                                        style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Colors.blueGrey,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 15)),
                                      ),
                                    ),
                                    Container(
                                      height: height * 0.04,
                                      width: 90,
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          color: Color(0xff00245a),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Colors.black,
                                                blurRadius: 10,
                                                spreadRadius: -7)
                                          ]),
                                      child: Text(
                                        "Place Order",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14)),
                                      ),
                                    ),
                                  ],
                                ),
                                Container(
                                  height: height * 0.28,
                                  width: 130,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              Module.Trending[index]),
                                          fit: BoxFit.fill)),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  SizedBox(
                    height: height * 0.02,
                  ),

                  // Auto Ads Slider
                  SizedBox(
                    height: height * 0.03,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: width * 0.04,
                      ),
                      Text(
                        "Top",
                        style: GoogleFonts.raleway(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: height * 0.04)),
                      ),
                      SizedBox(
                        width: width * 0.01,
                      ),
                      Icon(
                        Icons.keyboard_arrow_right,
                        color: Colors.black,
                        size: height * 0.046,
                      )
                    ],
                  ),
                  Divider(
                    color: Color(0xff00245a),
                    indent: width * 0.04,
                    endIndent: width / 1.13,
                    thickness: 4,
                    height: 10,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  Container(
                    height: 270,
                    child: CarouselSlider(
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                          autoPlay: true,
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 900),
                          autoPlayCurve: Curves.decelerate,
                          clipBehavior: Clip.antiAlias,
                          viewportFraction: 0.6,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          enlargeFactor: 0.2,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          height: height * 0.5),
                      items: Module.Trending.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: 510,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black,
                                        blurRadius: 10,
                                        spreadRadius: -5)
                                  ],
                                  borderRadius: BorderRadius.circular(20)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: height * 0.34,
                                    width: 150,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(12),
                                        image: DecorationImage(
                                            image: AssetImage(i),
                                            fit: BoxFit.fill)),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          "Get Upto 50% Off",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: height * 0.02)),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.05,
                                        width: width * 0.14,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xff00245a),
                                            borderRadius:
                                                BorderRadius.circular(6),
                                            boxShadow: [
                                              BoxShadow(
                                                  color: Colors.black,
                                                  blurRadius: 10,
                                                  spreadRadius: -7)
                                            ]),
                                        child: Text(
                                          "Grab The Offer",
                                          style: GoogleFonts.raleway(
                                              textStyle: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: width * 0.012)),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),

                  // Categories
                  Container(
                    height: height * 0.35,
                    width: width,
                    margin: EdgeInsets.all(10),
                    child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: Module.category.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: height * 0.35,
                          width: 210,
                          margin: EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              Image.asset(
                                Module.categoryImage[index],
                                fit: BoxFit.fill,
                                height: height * 0.35,
                              ),
                              Positioned(
                                top: height * 0.25,
                                child: Container(
                                  height: height * 0.03,
                                  width: 210,
                                  alignment: Alignment.center,
                                  child: Text(
                                    Module.category[index],
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            shadows: [
                                          Shadow(
                                            color: Colors.white,
                                            blurRadius: 10,
                                          )
                                        ],
                                            letterSpacing: 1,
                                            color: Colors.white,
                                            fontSize: height * 0.025,
                                            fontWeight: FontWeight.bold)),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),

                  //features
                  SizedBox(
                    height: height * 0.04,
                  ),

                  Container(
                    height: height * 0.15,
                    width: width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Lottie.network(
                                "https://assets1.lottiefiles.com/packages/lf20_ovwsvehd.json",
                                height: height * 0.15,
                                width: width * 0.1,
                                frameRate: FrameRate(120),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Free Shipping",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.022)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      "Deliver To Door",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.018)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Lottie.network(
                                "https://assets5.lottiefiles.com/packages/lf20_zzr6z38v.json",
                                height: height * 0.15,
                                width: width * 0.1,
                                frameRate: FrameRate(120),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Big Savings",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.022)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      "At Lowest Price",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.018)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Lottie.network(
                                "https://assets5.lottiefiles.com/packages/lf20_ep1tn2ew.json",
                                height: height * 0.15,
                                width: width * 0.1,
                                frameRate: FrameRate(120),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Money Back",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.022)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      "Easy To Return",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.018)),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: width * 0.02,
                              ),
                              VerticalDivider(
                                color: Colors.black,
                                thickness: 1,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Lottie.network(
                                "https://assets5.lottiefiles.com/packages/lf20_1snz9wmy.json",
                                height: height * 0.15,
                                width: width * 0.1,
                                frameRate: FrameRate(120),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      "Exchange Offer",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.022)),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 5),
                                    child: Text(
                                      "Easy To Exchange",
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.grey,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.018)),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(
                    height: height * 0.04,
                  ),

                  //Information
                  Container(
                    height: height * 0.4,
                    width: width,
                    color: Color(0xff00245a),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.1,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "ABOUT",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.02)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Contact Us",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "About Us",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
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
                                            fontSize: height * 0.017)),
                                  )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.1,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "My Account",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.02)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Wishlist",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.to(cart());
                                  },
                                  child: Text(
                                    "Returns & Orders",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Terms & Conditions",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Coming Soon",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.1,
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Help",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.02)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Payments",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Shipping",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Cancellation & Returns",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "FAQ",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  )),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: height * 0.1,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: Text(
                                  "Store Information",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: height * 0.02)),
                                ),
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.home,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(
                                    "15, Vanmali Park Society\nYogichowk, Surat",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.call,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(
                                    "8160011080",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.mail,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  Text(
                                    "anadhsuhagiya65@gmail.com",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: height * 0.017)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  //CopyRight
                  SizedBox(
                    height: height * 0.04,
                  ),

                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.07,
                          width: 300,
                          alignment: Alignment.center,
                          margin: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "© 2023 | Powered by 9 Vision",
                            style: GoogleFonts.baloo2(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.025)),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {},
                          onHover: (value) {
                            if (value == true) {
                              ImaFac = "images/facebookColor.png";
                              fac = true;
                            } else {
                              ImaFac = "images/facebook.png";
                              fac = false;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: height * 0.07,
                            width: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.facebook,
                              color: fac == true
                                  ? Colors.blueAccent
                                  : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        InkWell(
                          hoverColor: Colors.transparent,
                          onTap: () {},
                          onHover: (value) {
                            if (value == true) {
                              ImaIns = "images/instagramColor.png";
                              ins = true;
                            } else {
                              ImaIns = "images/instagram.png";
                              ins = false;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: height * 0.07,
                            width: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.instagram,
                              color: ins == true ? Colors.red : Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        InkWell(
                          onTap: () {},
                          hoverColor: Colors.transparent,
                          onHover: (value) {
                            if (value == true) {
                              ImaLin = "images/linkedincolor.png";
                              lin = true;
                            } else {
                              ImaLin = "images/linkedin.png";
                              lin = false;
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: height * 0.07,
                            width: 60,
                            alignment: Alignment.center,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              FontAwesomeIcons.linkedin,
                              color: lin == true
                                  ? Colors.blueAccent
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(
                    height: height * 0.04,
                  ),
                ],
              ),
            ),
          )
        : ResponsiveWidget.isSmallScreen(context)
            ? Scaffold(
                backgroundColor: Color(0x5987a7fa),
                drawer: Drawer(
                  child: ListView(
                    children: [
                      UserAccountsDrawerHeader(
                          decoration: BoxDecoration(color: Color(0xff00245a)),
                          currentAccountPicture: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Image.asset(
                              "images/profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                          accountName: Text(
                            "${widget.name}",
                            style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14)),
                          ),
                          accountEmail: Text("${widget.email}",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14)))),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Get.to(Home(widget.id, widget.name, widget.email,
                              widget.phone, widget.password));
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              MdiIcons.home,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Home",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Get.to(category());
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              MdiIcons.shopping,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Category",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Get.to(sell());
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              MdiIcons.tag,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Sale",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Get.to(wishlist());
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              MdiIcons.heart,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Wishlist",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Get.to(customerServices());
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              Icons.person,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Customer Support",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        mouseCursor: MaterialStateMouseCursor.clickable,
                        onTap: () {
                          Get.to(login());
                        },
                        child: Card(
                          child: ListTile(
                            leading: Icon(
                              MdiIcons.logout,
                              color: Colors.black,
                            ),
                            title: Text(
                              "Sign Out",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                appBar: AppBar(
                  backgroundColor: Color(0xff00245a),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              width: width * 0.01,
                            ),
                            Image.asset(
                              'images/store.png',
                              height: height * 0.05,
                            ),
                            SizedBox(
                              width: width * 0.02,
                            ),
                            Text(
                              "9 Vision",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: height * 0.021,
                                      fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(
                              width: width * 0.022,
                            ),
                          ],
                        ),
                      ),

                      // Account Signin

                      Tooltip(
                        message: "Sign In",
                        textStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 10,
                                spreadRadius: -5,
                              )
                            ]),
                        child: InkWell(
                          onTap: () {
                            Get.to(login());
                          },
                          onHover: (value) {
                            if (value == true) {
                              BoxShadAccount = [
                                BoxShadow(
                                  color: Color(0xff000000),
                                  spreadRadius: -5,
                                  blurRadius: 10,
                                )
                              ];

                              AccountBorder =
                                  Border.all(color: Colors.black, width: 1);
                            } else {
                              BoxShadAccount = [
                                BoxShadow(color: Colors.transparent)
                              ];
                              AccountBorder =
                                  Border.all(color: Colors.white, width: 0);
                            }
                            setState(() {});
                          },
                          child: Container(
                            height: height * 0.05,
                            width: height * 0.05,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: BoxShadAccount,
                                border: AccountBorder,
                                borderRadius: BorderRadius.circular(60)),
                            child: Image.asset(
                              "images/profile.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: height * 0.02,
                      ),

                      // Menus
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: width * 0.02,
                          ),
                          Text(
                            "Hello !  ${widget.name}",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.022)),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: height * 0.02,
                      ),

                      Row(
                        children: [
                          // Search Text Field
                          Container(
                              height: height * 0.065,
                              width: width * 0.78,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0x5987a7fa),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: TypeAheadField(
                                animationStart: 0.5,
                                animationDuration: Duration(milliseconds: 500),
                                textFieldConfiguration: TextFieldConfiguration(
                                    controller: search2,
                                    autofocus: false,
                                    textAlign: TextAlign.start,
                                    cursorColor: Colors.black,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintStyle: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold)),
                                        hintText: "Search Product",
                                        prefixIcon: Icon(
                                          MdiIcons.shoppingSearch,
                                          color: Colors.black,
                                          size: 20,
                                        ))),
                                suggestionsBoxDecoration:
                                    SuggestionsBoxDecoration(
                                  color: Colors.lightBlue[50],
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                suggestionsCallback: (pattern) {
                                  List<String> matches = <String>[];
                                  matches.addAll(Module.TrendingNames);

                                  matches.retainWhere((s) {
                                    return s
                                        .toLowerCase()
                                        .contains(pattern.toLowerCase());
                                  });
                                  return matches;
                                },
                                itemBuilder: (context, sone) {
                                  return Card(
                                      child: Container(
                                    width: 300,
                                    padding: EdgeInsets.all(10),
                                    child: Text(sone.toString()),
                                  ));
                                },
                                onSuggestionSelected: (suggestion) {
                                  search2.text = suggestion;
                                  print(suggestion);
                                  setState(() {});
                                },
                              )
                              // RawAutocomplete(
                              //   optionsBuilder: (TextEditingValue textEditingValue) {
                              //     if (textEditingValue.text == '') {
                              //       return const Iterable<String>.empty();
                              //     }else{
                              //       List<String> matches = [];
                              //       matches.addAll(Module.TrendingNames);
                              //
                              //       matches.retainWhere((s){
                              //         return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                              //       });
                              //       return matches;
                              //     }
                              //   },
                              //
                              //   onSelected: (String selection) {
                              //     print('You just selected $selection');
                              //   },
                              //
                              //   fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                              //       FocusNode focusNode,
                              //       VoidCallback onFieldSubmitted) {
                              //     return TextField(
                              //       decoration: InputDecoration(
                              //         border: InputBorder.none,
                              //             errorBorder: InputBorder.none,
                              //             enabledBorder: InputBorder.none,
                              //             focusedBorder: InputBorder.none,
                              //             hintStyle: GoogleFonts.montserrat(
                              //                 textStyle: TextStyle(
                              //                     fontSize: height * 0.02,
                              //                     fontWeight: FontWeight.bold)),
                              //             hintText: "Search Product",
                              //             prefixIcon: Icon(
                              //               MdiIcons.shoppingSearch,
                              //               color: Colors.black,
                              //               size: height * 0.03,
                              //             ),
                              //       ),
                              //       controller: textEditingController,
                              //       focusNode: focusNode,
                              //       cursorColor: Colors.black,
                              //       onSubmitted: (String value) {
                              //
                              //       },
                              //     );
                              //   },
                              //
                              //   optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
                              //       Iterable<String> options) {
                              //     return Material(
                              //       elevation: 1,
                              //       shadowColor: Colors.black,
                              //       textStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black)),
                              //       type: MaterialType.canvas,
                              //       borderRadius: BorderRadius.circular(12),
                              //       child: SizedBox(
                              //           height: 200,
                              //           child:SingleChildScrollView(
                              //             child: Column(
                              //               mainAxisAlignment: MainAxisAlignment.start,
                              //               children: options.map((opt){
                              //                 return InkWell(
                              //                     onTap: (){
                              //                       onSelected(opt);
                              //                     },
                              //                     child:Container(
                              //                         padding: EdgeInsets.only(right:60),
                              //                         child:Card(
                              //                             child: Container(
                              //                               width: double.infinity,
                              //                               padding: EdgeInsets.all(10),
                              //                               child:Text(opt),
                              //                             )
                              //                         )
                              //                     )
                              //                 );
                              //               }).toList(),
                              //             ),
                              //           )
                              //       ),
                              //     );
                              //   },
                              // )

                              // DropDownTextField(
                              //   textFieldDecoration: InputDecoration(
                              //       border: InputBorder.none,
                              //       hintText: "Search",
                              //       prefixIcon: Icon(
                              //         MdiIcons.shoppingSearch,
                              //         color: Colors.black,
                              //         size: height * 0.03,
                              //       )
                              //   ),
                              //   textStyle: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                              //   clearOption: true,
                              //   enableSearch: true,
                              //   dropDownList: [
                              //     for(int i = 0; i<Module.TrendingNames.length; i++)
                              //       DropDownValueModel(name: '${Module.TrendingNames[i]}', value: Module.TrendingNames[i])
                              //   ],
                              //
                              // )

                              // TextField(
                              //   controller: search,
                              //   onChanged: (value) {
                              //     temp.clear();
                              //     for (int i = 0; i < Module.TrendingNames.length; i++) {
                              //       if (Module.TrendingNames[i].toString()
                              //           .toLowerCase()
                              //           .contains(value.trim().toLowerCase())) {
                              //         temp.add(Module.TrendingNames[i]);
                              //       }
                              //     }
                              //
                              //
                              //
                              //   },
                              //   cursorColor: Colors.black,
                              //   textAlignVertical: TextAlignVertical.top,
                              //   style: GoogleFonts.montserrat(
                              //       textStyle: TextStyle(
                              //           fontWeight: FontWeight.bold,
                              //           fontSize: height * 0.02)),
                              //   decoration: InputDecoration(
                              //     border: InputBorder.none,
                              //     errorBorder: InputBorder.none,
                              //     enabledBorder: InputBorder.none,
                              //     focusedBorder: InputBorder.none,
                              //     hintStyle: GoogleFonts.montserrat(
                              //         textStyle: TextStyle(
                              //             fontSize: height * 0.02,
                              //             fontWeight: FontWeight.bold)),
                              //     hintText: "Search Product",
                              //     prefixIcon: Icon(
                              //       MdiIcons.shoppingSearch,
                              //       color: Colors.black,
                              //       size: height * 0.03,
                              //     ),
                              //   ),
                              // ),
                              ),

                          SizedBox(width: 10),
                          InkWell(
                            onTap: () {
                              searchVal = search2.text;

                              if (searchVal.isNotEmpty) {
                                Get.to(search(searchVal));
                              }
                            },
                            child: Container(
                              height: height * 0.053,
                              width: height * 0.053,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0x5987a7fa),
                              ),
                              child: Icon(
                                Icons.search,
                                color: Color(0xff000000),
                              ),
                            ),
                          )
                        ],
                      ),

                      SizedBox(
                        height: height * 0.02,
                      ),

                      // Auto Image Slider
                      Container(
                        height: 200,
                        padding: EdgeInsets.symmetric(vertical: 8),
                        child: CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 900),
                              autoPlayCurve: Curves.decelerate,
                              clipBehavior: Clip.antiAlias,
                              viewportFraction: 0.8,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              enlargeFactor: 0.2,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              height: height * 0.5),
                          items: Module.SareeSlider.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 600,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      image: DecorationImage(
                                          image: AssetImage(i),
                                          fit: BoxFit.fill),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                            spreadRadius: -5)
                                      ],
                                      borderRadius: BorderRadius.circular(20)),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      //Trending Products
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Text(
                            "Trending Product",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.025)),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: height * 0.046,
                          )
                        ],
                      ),
                      Divider(
                        color: Color(0xff00245a),
                        indent: width * 0.04,
                        endIndent: width / 1.28,
                        thickness: 4,
                        height: 10,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.3,
                        width: width,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          itemCount: Module.Trending.length,
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Container(
                              height: height * 0.23,
                              width: 120,
                              alignment: Alignment.center,
                              margin: EdgeInsets.all(7),
                              decoration: BoxDecoration(
                                  color: Color(0xffffffff),
                                  borderRadius: BorderRadius.circular(14),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black,
                                      spreadRadius: -6,
                                      blurRadius: 10,
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Flexible(
                                        child: Container(
                                          height: height * 0.17,
                                          width: 110,
                                          margin: EdgeInsets.all(6),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      Module.Trending[index]),
                                                  fit: BoxFit.fill),
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 0, right: 9),
                                    child: Text(
                                      "${Module.TrendingNames[index]}",
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontSize: height * 0.014,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 10, top: 4, right: 9),
                                            child: Text(
                                              "${Module.TrendingPrice[index]}",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: height * 0.012,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 1, top: 4, right: 9),
                                            child: Text(
                                              "${Module.TrendingMRP[index]}",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      decoration: TextDecoration
                                                          .lineThrough,
                                                      color: Colors.grey,
                                                      fontSize: height * 0.010,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 1, top: 4, right: 9),
                                          child: InkWell(
                                              onTap: () {
                                                c.like(index);

                                                if (c.Alk[index].value ==
                                                    true) {
                                                  Module.LikeTrending.add(
                                                      "${Module.Trending[index]}");
                                                  Module.LikeTrendingName.add(
                                                      "${Module.TrendingNames[index]}");
                                                  Module.LikeTrendingPrice.add(
                                                      "${Module.TrendingPrice[index]}");
                                                  Module.LikeTrendingMRP.add(
                                                      "${Module.TrendingMRP[index]}");
                                                  Module.LikeTiming.add(
                                                      "${DateTime.now()}");
                                                } else {
                                                  Module.LikeTrending.remove(
                                                      "${Module.Trending[index]}");
                                                  Module.LikeTrendingName.remove(
                                                      "${Module.TrendingNames[index]}");
                                                  Module.LikeTrendingPrice.remove(
                                                      "${Module.TrendingPrice[index]}");
                                                  Module.LikeTrendingMRP.remove(
                                                      "${Module.TrendingMRP[index]}");
                                                  Module.LikeTiming.removeAt(
                                                      index);
                                                }
                                              },
                                              child: Obx(() =>
                                                  c.Alk[index].value == true
                                                      ? Icon(
                                                          MdiIcons.heart,
                                                          color: Colors.red,
                                                          size: 17,
                                                        )
                                                      : Icon(
                                                          MdiIcons.heartOutline,
                                                          size: 17,
                                                        )))),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: height * 0.024,
                                        width: 70,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                            color: Color(0xff00245a),
                                            borderRadius:
                                                BorderRadius.circular(6),
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
                                                  fontSize: height * 0.014)),
                                        ),
                                      ),
                                      Container(
                                        height: height * 0.035,
                                        width: 30,
                                        alignment: Alignment.center,
                                        child: Row(
                                          children: [
                                            Text(
                                              "5.0",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.green,
                                                      fontSize: height * 0.013,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Icon(
                                              MdiIcons.star,
                                              color: Colors.green,
                                              size: height * 0.01,
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

                      // Best Deals
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Text(
                            "Best Deals",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.025)),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: height * 0.046,
                          )
                        ],
                      ),
                      Divider(
                        color: Color(0xff00245a),
                        indent: width * 0.04,
                        endIndent: width / 1.18,
                        thickness: 4,
                        height: 10,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: height * 0.2,
                        width: width,
                        alignment: Alignment.center,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          physics: BouncingScrollPhysics(),
                          itemCount: Module.Trending.length,
                          itemBuilder: (context, index) {
                            return Flexible(
                              child: Container(
                                height: height * 0.16,
                                width: 200,
                                margin: EdgeInsets.all(6),
                                decoration: BoxDecoration(
                                    color: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(14),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.black,
                                        spreadRadius: -6,
                                        blurRadius: 10,
                                      )
                                    ]),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 5),
                                          child: Container(
                                            width: 85,
                                            alignment: Alignment.center,
                                            child: Text(
                                              "${Module.TrendingNames[index]}",
                                              overflow: TextOverflow.fade,
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 10)),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 0,
                                          ),
                                          child: Text(
                                            "New Design",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.blueGrey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 8)),
                                          ),
                                        ),
                                        Container(
                                          height: height * 0.035,
                                          width: 60,
                                          alignment: Alignment.center,
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Color(0xff00245a),
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.black,
                                                    blurRadius: 10,
                                                    spreadRadius: -7)
                                              ]),
                                          child: Text(
                                            "Place Order",
                                            style: GoogleFonts.raleway(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 9)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      height: height * 0.14,
                                      width: 70,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  Module.Trending[index]),
                                              fit: BoxFit.fill)),
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(
                        height: height * 0.014,
                      ),

                      // Auto Ads Slider
                      SizedBox(
                        height: height * 0.025,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.04,
                          ),
                          Text(
                            "Top",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: height * 0.025)),
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Icon(
                            Icons.keyboard_arrow_right,
                            color: Colors.black,
                            size: height * 0.046,
                          )
                        ],
                      ),
                      Divider(
                        color: Color(0xff00245a),
                        indent: width * 0.04,
                        endIndent: width / 1.13,
                        thickness: 4,
                        height: 10,
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Container(
                        height: 170,
                        child: CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                              autoPlay: true,
                              autoPlayAnimationDuration:
                                  Duration(milliseconds: 900),
                              autoPlayCurve: Curves.decelerate,
                              clipBehavior: Clip.antiAlias,
                              viewportFraction: 0.8,
                              enlargeStrategy: CenterPageEnlargeStrategy.scale,
                              enlargeFactor: 0.2,
                              enlargeCenterPage: true,
                              enableInfiniteScroll: true,
                              height: height * 0.3),
                          items: Module.Trending.map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Container(
                                  width: 510,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                            spreadRadius: -5)
                                      ],
                                      borderRadius: BorderRadius.circular(20)),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        height: height * 0.22,
                                        width: 100,
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(12),
                                            image: DecorationImage(
                                                image: AssetImage(i),
                                                fit: BoxFit.fill)),
                                      ),
                                      Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                              "Get Upto 50% Off",
                                              style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: height * 0.02)),
                                            ),
                                          ),
                                          Container(
                                            height: height * 0.045,
                                            width: width * 0.19,
                                            alignment: Alignment.center,
                                            decoration: BoxDecoration(
                                                color: Color(0xff00245a),
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Colors.black,
                                                      blurRadius: 10,
                                                      spreadRadius: -7)
                                                ]),
                                            child: Text(
                                              "Grab The Offer",
                                              style: GoogleFonts.raleway(
                                                  textStyle: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: width * 0.022)),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),

                      // Categories
                      Container(
                        height: height * 0.25,
                        width: width,
                        margin: EdgeInsets.all(10),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: Module.category.length,
                          itemBuilder: (context, index) {
                            return Container(
                              height: height * 0.25,
                              width: 160,
                              margin: EdgeInsets.all(2),
                              child: Stack(
                                children: [
                                  Image.asset(
                                    Module.categoryImage[index],
                                    fit: BoxFit.fill,
                                    height: height * 0.25,
                                  ),
                                  Positioned(
                                    top: height * 0.17,
                                    right: height * 0.011,
                                    child: Container(
                                      height: height * 0.025,
                                      width: 180,
                                      alignment: Alignment.center,
                                      child: Text(
                                        Module.category[index],
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                shadows: [
                                              Shadow(
                                                color: Colors.white,
                                                blurRadius: 10,
                                              )
                                            ],
                                                letterSpacing: 1,
                                                color: Colors.white,
                                                fontSize: height * 0.021,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),

                      //features
                      SizedBox(
                        height: height * 0.04,
                      ),

                      Container(
                        height: height * 0.30,
                        width: width,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Lottie.network(
                                      "https://assets1.lottiefiles.com/packages/lf20_ovwsvehd.json",
                                      height: height * 0.15,
                                      width: width * 0.1,
                                      frameRate: FrameRate(120),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Free Shipping",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.018)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            "Deliver To Door",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.014)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Lottie.network(
                                      "https://assets5.lottiefiles.com/packages/lf20_zzr6z38v.json",
                                      height: height * 0.15,
                                      width: width * 0.1,
                                      frameRate: FrameRate(120),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Big Savings",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.018)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            "At Lowest Price",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.014)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Lottie.network(
                                      "https://assets5.lottiefiles.com/packages/lf20_ep1tn2ew.json",
                                      height: height * 0.15,
                                      width: width * 0.1,
                                      frameRate: FrameRate(120),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Money Back",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.018)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            "Easy To Return",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.014)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Lottie.network(
                                      "https://assets5.lottiefiles.com/packages/lf20_1snz9wmy.json",
                                      height: height * 0.15,
                                      width: width * 0.1,
                                      frameRate: FrameRate(120),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(2.0),
                                          child: Text(
                                            "Exchange Offer",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.018)),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 5, right: 5),
                                          child: Text(
                                            "Easy To Exchange",
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Colors.grey,
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: height * 0.014)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height * 0.04,
                      ),

                      //Information
                      Container(
                        height: height * 0.4,
                        width: width,
                        color: Color(0xff00245a),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.1,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "ABOUT",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.02)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Contact Us",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "About Us",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
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
                                                fontSize: height * 0.017)),
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.1,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "My Account",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.02)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Wishlist",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {
                                        Get.to(cart());
                                      },
                                      child: Text(
                                        "Returns & Orders",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Terms & Conditions",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Coming Soon",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.1,
                                  ),
                                  TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Help",
                                      style: GoogleFonts.raleway(
                                          textStyle: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: height * 0.02)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Payments",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Shipping",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "Cancellation & Returns",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        "FAQ",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      )),
                                ],
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: height * 0.1,
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
                                              fontSize: height * 0.02)),
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.home,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: width * 0.01,
                                      ),
                                      Text(
                                        "15, Vanmali Park Society\nYogichowk, Surat",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.call,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: width * 0.01,
                                      ),
                                      Text(
                                        "8160011080",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.01,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.mail,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: width * 0.01,
                                      ),
                                      Text(
                                        "anadhsuhagiya65@gmail.com",
                                        style: GoogleFonts.raleway(
                                            textStyle: TextStyle(
                                                color: Colors.white,
                                                fontSize: height * 0.017)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      //CopyRight
                      SizedBox(
                        height: height * 0.04,
                      ),

                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.06,
                              width: width * 0.55,
                              alignment: Alignment.center,
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                "© 2023 | Powered by 9 Vision",
                                style: GoogleFonts.baloo2(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: height * 0.02)),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {},
                              onHover: (value) {
                                if (value == true) {
                                  ImaFac = "images/facebookColor.png";
                                  fac = true;
                                } else {
                                  ImaFac = "images/facebook.png";
                                  fac = false;
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: height * 0.06,
                                width: height * 0.06,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.facebook,
                                  color: fac == true
                                      ? Colors.blueAccent
                                      : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            InkWell(
                              hoverColor: Colors.transparent,
                              onTap: () {},
                              onHover: (value) {
                                if (value == true) {
                                  ImaIns = "images/instagramColor.png";
                                  ins = true;
                                } else {
                                  ImaIns = "images/instagram.png";
                                  ins = false;
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: height * 0.06,
                                width: height * 0.06,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.instagram,
                                  color:
                                      ins == true ? Colors.red : Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.015,
                            ),
                            InkWell(
                              onTap: () {},
                              hoverColor: Colors.transparent,
                              onHover: (value) {
                                if (value == true) {
                                  ImaLin = "images/linkedincolor.png";
                                  lin = true;
                                } else {
                                  ImaLin = "images/linkedin.png";
                                  lin = false;
                                }
                                setState(() {});
                              },
                              child: Container(
                                height: height * 0.06,
                                width: height * 0.06,
                                alignment: Alignment.center,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  FontAwesomeIcons.linkedin,
                                  color: lin == true
                                      ? Colors.blueAccent
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: height * 0.04,
                      ),
                    ],
                  ),
                ),
              )
            : locationGet
                ? Scaffold(
      backgroundColor: Color(0x5987a7fa),
      appBar: AppBar(
        backgroundColor: Color(0xff00245a),
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                width: width * 0.03,
              ),
              Image.asset(
                'images/store.png',
                height: height * 0.05,
              ),
              SizedBox(
                width: width * 0.02,
              ),
              Text(
                "9 Vision",
                style: GoogleFonts.raleway(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: height * 0.025,
                        fontWeight: FontWeight.bold)),
              ),

              SizedBox(
                width: width * 0.032,
              ),

              // Account Signin

              Tooltip(
                message: "${widget.name}",
                textStyle: GoogleFonts.montserrat(
                    textStyle: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 10,
                        spreadRadius: -5,
                      )
                    ]),
                child: InkWell(
                  onTap: () {
                    Get.to(login());
                  },
                  onHover: (value) {
                    if (value == true) {
                      BoxShadAccount = [
                        BoxShadow(
                          color: Color(0xff000000),
                          spreadRadius: -5,
                          blurRadius: 10,
                        )
                      ];

                      AccountBorder = Border.all(
                          color: Colors.black, width: 1);
                    } else {
                      BoxShadAccount = [
                        BoxShadow(color: Colors.transparent)
                      ];
                      AccountBorder = Border.all(
                          color: Colors.white, width: 0);
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.06,
                    width: height * 0.06,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: BoxShadAccount,
                        border: AccountBorder,
                        borderRadius: BorderRadius.circular(60)),
                    child: Image.asset(
                      "images/profile.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),

              SizedBox(
                width: width * 0.03,
              ),

              // Search Text Field
              Container(
                  height: height * 0.045,
                  width: width * 0.4,
                  alignment: AlignmentDirectional.centerStart,
                  padding: EdgeInsets.only(bottom: 9, top: 4),
                  decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            spreadRadius: -10,
                            offset: Offset(2, 4))
                      ]),
                  child: TypeAheadField(
                    animationStart: 0.5,
                    animationDuration:
                    Duration(milliseconds: 500),
                    textFieldConfiguration:
                    TextFieldConfiguration(
                        controller: search2,
                        autofocus: false,
                        cursorColor: Colors.black,
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          hintStyle: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  fontSize: height * 0.02,
                                  fontWeight:
                                  FontWeight.bold)),
                          hintText: "Search Product",
                          prefixIcon: Icon(
                            MdiIcons.shoppingSearch,
                            color: Colors.black,
                            size: height * 0.03,
                          ),
                        )),
                    suggestionsBoxDecoration:
                    SuggestionsBoxDecoration(
                      color: Colors.lightBlue[50],
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suggestionsCallback: (pattern) {
                      List<String> matches = <String>[];
                      matches.addAll(Module.TrendingNames);

                      matches.retainWhere((s) {
                        return s
                            .toLowerCase()
                            .contains(pattern.toLowerCase());
                      });
                      return matches;
                    },
                    itemBuilder: (context, sone) {
                      return Card(
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(10),
                            child: Text(sone.toString()),
                          ));
                    },
                    onSuggestionSelected: (suggestion) {
                      search2.text = suggestion;
                      print(suggestion);
                      setState(() {});
                    },
                  )
                // RawAutocomplete(
                //   optionsBuilder: (TextEditingValue textEditingValue) {
                //     if (textEditingValue.text == '') {
                //       return const Iterable<String>.empty();
                //     }else{
                //       List<String> matches = [];
                //       matches.addAll(Module.TrendingNames);
                //
                //       matches.retainWhere((s){
                //         return s.toLowerCase().contains(textEditingValue.text.toLowerCase());
                //       });
                //       return matches;
                //     }
                //   },
                //
                //   onSelected: (String selection) {
                //     print('You just selected $selection');
                //   },
                //
                //   fieldViewBuilder: (BuildContext context, TextEditingController textEditingController,
                //       FocusNode focusNode,
                //       VoidCallback onFieldSubmitted) {
                //     return TextField(
                //       decoration: InputDecoration(
                //         border: InputBorder.none,
                //             errorBorder: InputBorder.none,
                //             enabledBorder: InputBorder.none,
                //             focusedBorder: InputBorder.none,
                //             hintStyle: GoogleFonts.montserrat(
                //                 textStyle: TextStyle(
                //                     fontSize: height * 0.02,
                //                     fontWeight: FontWeight.bold)),
                //             hintText: "Search Product",
                //             prefixIcon: Icon(
                //               MdiIcons.shoppingSearch,
                //               color: Colors.black,
                //               size: height * 0.03,
                //             ),
                //       ),
                //       controller: textEditingController,
                //       focusNode: focusNode,
                //       cursorColor: Colors.black,
                //       onSubmitted: (String value) {
                //
                //       },
                //     );
                //   },
                //
                //   optionsViewBuilder: (BuildContext context, void Function(String) onSelected,
                //       Iterable<String> options) {
                //     return Material(
                //       elevation: 1,
                //       shadowColor: Colors.black,
                //       textStyle: GoogleFonts.montserrat(textStyle: TextStyle(color: Colors.black)),
                //       type: MaterialType.canvas,
                //       borderRadius: BorderRadius.circular(12),
                //       child: SizedBox(
                //           height: 200,
                //           child:SingleChildScrollView(
                //             child: Column(
                //               mainAxisAlignment: MainAxisAlignment.start,
                //               children: options.map((opt){
                //                 return InkWell(
                //                     onTap: (){
                //                       onSelected(opt);
                //                     },
                //                     child:Container(
                //                         padding: EdgeInsets.only(right:60),
                //                         child:Card(
                //                             child: Container(
                //                               width: double.infinity,
                //                               padding: EdgeInsets.all(10),
                //                               child:Text(opt),
                //                             )
                //                         )
                //                     )
                //                 );
                //               }).toList(),
                //             ),
                //           )
                //       ),
                //     );
                //   },
                // )

                // DropDownTextField(
                //   textFieldDecoration: InputDecoration(
                //       border: InputBorder.none,
                //       hintText: "Search",
                //       prefixIcon: Icon(
                //         MdiIcons.shoppingSearch,
                //         color: Colors.black,
                //         size: height * 0.03,
                //       )
                //   ),
                //   textStyle: GoogleFonts.montserrat(textStyle: TextStyle(fontSize: 12,fontWeight: FontWeight.bold)),
                //   clearOption: true,
                //   enableSearch: true,
                //   dropDownList: [
                //     for(int i = 0; i<Module.TrendingNames.length; i++)
                //       DropDownValueModel(name: '${Module.TrendingNames[i]}', value: Module.TrendingNames[i])
                //   ],
                //
                // )

                // TextField(
                //   controller: search,
                //   onChanged: (value) {
                //     temp.clear();
                //     for (int i = 0; i < Module.TrendingNames.length; i++) {
                //       if (Module.TrendingNames[i].toString()
                //           .toLowerCase()
                //           .contains(value.trim().toLowerCase())) {
                //         temp.add(Module.TrendingNames[i]);
                //       }
                //     }
                //
                //
                //
                //   },
                //   cursorColor: Colors.black,
                //   textAlignVertical: TextAlignVertical.top,
                //   style: GoogleFonts.montserrat(
                //       textStyle: TextStyle(
                //           fontWeight: FontWeight.bold,
                //           fontSize: height * 0.02)),
                //   decoration: InputDecoration(
                //     border: InputBorder.none,
                //     errorBorder: InputBorder.none,
                //     enabledBorder: InputBorder.none,
                //     focusedBorder: InputBorder.none,
                //     hintStyle: GoogleFonts.montserrat(
                //         textStyle: TextStyle(
                //             fontSize: height * 0.02,
                //             fontWeight: FontWeight.bold)),
                //     hintText: "Search Product",
                //     prefixIcon: Icon(
                //       MdiIcons.shoppingSearch,
                //       color: Colors.black,
                //       size: height * 0.03,
                //     ),
                //   ),
                // ),
              ),
              SizedBox(
                width: width * 0.02,
              ),

              IconButton(
                  onPressed: () {
                    searchVal = search2.text;

                    if (searchVal.isNotEmpty) {
                      Get.to(search(searchVal));
                    }
                  },
                  icon: Icon(
                    Icons.search,
                    color: Colors.white,
                    shadows: [
                      Shadow(color: Colors.white, blurRadius: 4)
                    ],
                  )),

              SizedBox(
                width: width * 0.032,
              ),

              // Location Selection

              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text(
                          "Location Details",
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        content: Container(
                          width: 500,
                          height: height,
                          child: Column(
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      houseNoError = false;
                                      setState(() {});
                                    }
                                  },
                                  controller: houseNo,
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 14)),
                                  decoration: InputDecoration(
                                    hintText: "Enter House No.",
                                    label: Text(
                                      "House No.",
                                      style:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 12)),
                                    ),
                                    errorText: houseNoError
                                        ? "Please Enter House No."
                                        : null,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      StreetNameError = false;
                                      setState(() {});
                                    }
                                  },
                                  controller: StreetName,
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 14)),
                                  decoration: InputDecoration(
                                    hintText: "Enter Street Name",
                                    label: Text(
                                      "Street",
                                      style:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 12)),
                                    ),
                                    errorText: StreetNameError
                                        ? "Please Enter Street Name"
                                        : null,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      AreaError = false;
                                      setState(() {});
                                    }
                                  },
                                  controller: Area,
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 14)),
                                  decoration: InputDecoration(
                                    hintText: "Enter Area",
                                    label: Text(
                                      "Area",
                                      style:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 12)),
                                    ),
                                    errorText: AreaError
                                        ? "Please Enter Area"
                                        : null,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      DistrictError = false;
                                      setState(() {});
                                    }
                                  },
                                  controller: District,
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 14)),
                                  decoration: InputDecoration(
                                    hintText: "Enter District",
                                    label: Text(
                                      "District",
                                      style:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 12)),
                                    ),
                                    errorText: DistrictError
                                        ? "Please Enter District"
                                        : null,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      AStateError = false;
                                      setState(() {});
                                    }
                                  },
                                  controller: AState,
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 14)),
                                  decoration: InputDecoration(
                                    hintText: "Enter State",
                                    label: Text(
                                      "State",
                                      style:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 12)),
                                    ),
                                    errorText: AStateError
                                        ? "Please Enter State"
                                        : null,
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.all(8.0),
                                child: TextField(
                                  onChanged: (value) {
                                    if (value.isNotEmpty) {
                                      PincodeError = false;
                                      setState(() {});
                                    }
                                  },
                                  controller: Pincode,
                                  cursorColor: Colors.black,
                                  maxLength: 6,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize: 14)),
                                  decoration: InputDecoration(
                                    hintText: "Enter Pincode",
                                    label: Text(
                                      "Pincode",
                                      style:
                                      GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors
                                                  .black,
                                              fontSize: 12)),
                                    ),
                                    errorText: PincodeError
                                        ? PincodeMSG
                                        : null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        actions: [
                          TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              child: Text(
                                "Cancel",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.red,
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.bold)),
                              )),
                          TextButton(
                              onPressed: () async {
                                String HOUSENO =
                                houseNo.text.trim();
                                String STREET =
                                StreetName.text.trim();
                                String AREA = Area.text.trim();
                                String DISTRICT =
                                District.text.trim();
                                String STATE = AState.text.trim();
                                String PINCODE =
                                Pincode.text.trim();

                                if (HOUSENO.isEmpty) {
                                  houseNoError = true;
                                  setState(() {});
                                } else if (STREET.isEmpty) {
                                  StreetNameError = true;
                                  setState(() {});
                                } else if (AREA.isEmpty) {
                                  AreaError = true;
                                  setState(() {});
                                } else if (DISTRICT.isEmpty) {
                                  DistrictError = true;
                                  setState(() {});
                                } else if (STATE.isEmpty) {
                                  AStateError = true;
                                  setState(() {});
                                } else if (PINCODE.isEmpty) {
                                  PincodeError = true;
                                  PincodeMSG =
                                  "Please Enter Pincode";
                                  setState(() {});
                                } else if (PINCODE.length < 6) {
                                  PincodeError = true;
                                  PincodeMSG =
                                  "Please Enter 6 Digit Code";
                                  setState(() {});
                                } else {
                                  Location = DISTRICT;
                                  setState(() {});
                                  Get.back();


                                  Map formData = {
                                    'id': widget.id,
                                    'houseNo': HOUSENO,
                                    'streetName' : STREET,
                                    'area' : AREA,
                                    'district' : DISTRICT,
                                    'astate' : STATE,
                                    'pincode' : PINCODE
                                  };

                                  var link = Uri.parse(
                                      "https://flutteranadh.000webhostapp.com/onlineShopping/address.php");

                                  print("URL");
                                  var response = await http
                                      .post(link, body: formData);

                                  print("Response");

                                  if (response.statusCode ==
                                      200) {
                                    print(
                                        "Response ==== $response");

                                    Map map =
                                    jsonDecode(response.body);

                                    int result = map['result'];
                                    print("Result :- $result");

                                    if (result == 0) {
                                      AwesomeDialog(
                                        context: context,
                                        dialogType:
                                        DialogType.error,
                                        animType:
                                        AnimType.bottomSlide,
                                        title: 'Error',
                                        desc:
                                        'Error Please Try Again',
                                        btnOkOnPress: () {},
                                      )..show();
                                    } else if (result == 1) {
                                      print("Success");
                                      Get.to(Home(
                                          widget.id,
                                          widget.name,
                                          widget.email,
                                          widget.phone,
                                          widget.password));
                                    }
                                  }
                                }
                              },
                              child: Text(
                                "Submit",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.green,
                                        fontSize: 18,
                                        fontWeight:
                                        FontWeight.bold)),
                              ))
                        ],
                      );
                    },
                  );
                },
                onHover: (value) {
                  if (value == true) {
                    LocationHover = true;
                  } else {
                    LocationHover = false;
                  }
                  setState(() {});
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.12,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: LocationHover
                          ? [
                        BoxShadow(
                          color: Color(0xff000000),
                          spreadRadius: -5,
                          blurRadius: 10,
                        )
                      ]
                          : [
                        BoxShadow(color: Colors.transparent)
                      ],
                      border: Border.all(
                          color: Colors.black, width: 1)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/map.png",
                        height: height * 0.03,
                      ),
                      Flexible(
                        child: Text(
                          Location,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: height * 0.016,
                              )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: width * 0.032,
              ),

              // Return And Orders

              InkWell(
                onTap: () {
                  Get.to(cart());
                },
                onHover: (value) {
                  if (value == true) {
                    BoxShad = [
                      BoxShadow(
                        color: Color(0xff000000),
                        spreadRadius: -5,
                        blurRadius: 10,
                      )
                    ];
                  } else {
                    BoxShad = [
                      BoxShadow(
                        color: Colors.transparent,
                      )
                    ];
                  }
                  setState(() {});
                },
                child: Container(
                  height: height * 0.05,
                  width: width * 0.08,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Color(0xffececec),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: BoxShad,
                      border: Border.all(
                          color: Colors.black, width: 1)),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        MdiIcons.shopping,
                        color: Colors.black,
                        size: height * 0.028,
                      ),
                      Text(
                        "Returns & \nOrders",
                        style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: width * 0.007,
                                fontWeight: FontWeight.bold)),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                  tooltip: "Shopping Cart",
                  onPressed: () {
                    Get.to(cart());
                  },
                  icon: Icon(
                    MdiIcons.cartVariant,
                    color: Colors.white,
                    size: height * 0.035,
                  )),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: height * 0.02,
            ),

            // Menus
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: width * 0.02,
                    ),
                    Text(
                      "Hello !  ${widget.name}",
                      style: GoogleFonts.raleway(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: height * 0.03)),
                    ),
                  ],
                ),
                Container(
                  height: height * 0.06,
                  width: width * 0.6,
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          Get.to(Home(
                              widget.id,
                              widget.name,
                              widget.email,
                              widget.phone,
                              widget.password));
                        },
                        onHover: (value) {
                          if (value == true) {
                            HomeHover = true;
                          } else {
                            HomeHover = false;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: height * 0.052,
                          width: width * 0.09,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: HomeHover
                                  ? Color(0xff00245a)
                                  : Colors.white,
                              borderRadius:
                              BorderRadius.circular(11),
                              boxShadow: [
                                HomeHover
                                    ? BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                                    : BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                MdiIcons.home,
                                color: HomeHover
                                    ? Colors.white
                                    : Colors.black,
                                size: height * 0.03,
                              ),
                              Text(
                                "Home",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: HomeHover
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: height * 0.018,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(category());
                        },
                        onHover: (value) {
                          if (value == true) {
                            CategoryHover = true;
                          } else {
                            CategoryHover = false;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: height * 0.052,
                          width: width * 0.1,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: CategoryHover
                                  ? Color(0xff00245a)
                                  : Colors.white,
                              borderRadius:
                              BorderRadius.circular(11),
                              boxShadow: [
                                CategoryHover
                                    ? BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                                    : BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                MdiIcons.shopping,
                                color: CategoryHover
                                    ? Colors.white
                                    : Colors.black,
                                size: height * 0.03,
                              ),
                              Text(
                                "Category",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: CategoryHover
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: height * 0.018,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(sell());
                        },
                        onHover: (value) {
                          if (value == true) {
                            SellHover = true;
                          } else {
                            SellHover = false;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: height * 0.052,
                          width: width * 0.09,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: SellHover
                                  ? Color(0xff00245a)
                                  : Colors.white,
                              borderRadius:
                              BorderRadius.circular(11),
                              boxShadow: [
                                SellHover
                                    ? BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                                    : BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Icon(
                                MdiIcons.tag,
                                color: SellHover
                                    ? Colors.white
                                    : Colors.black,
                                size: height * 0.027,
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              Text(
                                "Sale",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: SellHover
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: height * 0.018,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(wishlist());
                        },
                        onHover: (value) {
                          if (value == true) {
                            wishListHover = true;
                          } else {
                            wishListHover = false;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: height * 0.052,
                          width: width * 0.1,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: wishListHover
                                  ? Color(0xff00245a)
                                  : Colors.white,
                              borderRadius:
                              BorderRadius.circular(11),
                              boxShadow: [
                                wishListHover
                                    ? BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                                    : BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                MdiIcons.heart,
                                color: wishListHover
                                    ? Colors.white
                                    : Colors.black,
                                size: height * 0.03,
                              ),
                              Text(
                                "Wishlist",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: wishListHover
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: height * 0.018,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(customerServices());
                        },
                        onHover: (value) {
                          if (value == true) {
                            custServiHover = true;
                          } else {
                            custServiHover = false;
                          }
                          setState(() {});
                        },
                        child: Container(
                          height: height * 0.052,
                          width: width * 0.13,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: custServiHover
                                  ? Color(0xff00245a)
                                  : Colors.white,
                              borderRadius:
                              BorderRadius.circular(11),
                              boxShadow: [
                                custServiHover
                                    ? BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                                    : BoxShadow(
                                  color: Colors.black,
                                  spreadRadius: -6,
                                  blurRadius: 10,
                                )
                              ]),
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                MdiIcons.account,
                                color: custServiHover
                                    ? Colors.white
                                    : Colors.black,
                                size: height * 0.03,
                              ),
                              Text(
                                "Customer Support",
                                style: GoogleFonts.raleway(
                                    textStyle: TextStyle(
                                        color: custServiHover
                                            ? Colors.white
                                            : Colors.black,
                                        fontSize: height * 0.014,
                                        fontWeight:
                                        FontWeight.bold)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  onHover: (value) {
                    if (value == true) {
                      ProfileHover = true;
                    } else {
                      ProfileHover = false;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.05,
                    decoration: BoxDecoration(
                      color: ProfileHover
                          ? Color(0xff00245a)
                          : Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          MdiIcons.account,
                          color: ProfileHover
                              ? Colors.white
                              : Colors.black,
                          size: height * 0.03,
                        ),
                        Text(
                          "Profile",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: ProfileHover
                                      ? Colors.white
                                      : Colors.black,
                                  fontSize: height * 0.014,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: height * 0.02,
            ),

            // Auto Image Slider
            Container(
              height: 400,
              child: CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration:
                    Duration(milliseconds: 900),
                    autoPlayCurve: Curves.decelerate,
                    clipBehavior: Clip.antiAlias,
                    viewportFraction: 0.5,
                    enlargeStrategy:
                    CenterPageEnlargeStrategy.scale,
                    enlargeFactor: 0.2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: height * 0.5),
                items: Module.SareeSlider.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 600,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(i),
                                fit: BoxFit.fill),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -5)
                            ],
                            borderRadius:
                            BorderRadius.circular(20)),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),

            //Trending Products
            Row(
              children: [
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  "Tranding Product",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.04)),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: height * 0.046,
                )
              ],
            ),
            Divider(
              color: Color(0xff00245a),
              indent: width * 0.04,
              endIndent: width / 1.28,
              thickness: 4,
              height: 10,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.6,
              width: width,
              alignment: Alignment.center,
              child: ListView.builder(
                itemCount: Module.Trending.length,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.44,
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
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Flexible(
                              child: Container(
                                height: height * 0.37,
                                width: 180,
                                margin: EdgeInsets.all(6),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(Module
                                            .Trending[index]),
                                        fit: BoxFit.fill),
                                    borderRadius:
                                    BorderRadius.circular(
                                        12)),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 20, top: 0, right: 9),
                          child: Text(
                            "${Module.TrendingNames[index]}",
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.black,
                                    fontSize: height * 0.02,
                                    fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
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
                                            fontSize:
                                            height * 0.017,
                                            fontWeight:
                                            FontWeight.bold)),
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
                                            TextDecoration
                                                .lineThrough,
                                            color: Colors.grey,
                                            fontSize:
                                            height * 0.015,
                                            fontWeight:
                                            FontWeight.bold)),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.only(
                                    left: 1, top: 8, right: 9),
                                child: InkWell(
                                    onTap: () {
                                      c.like(index);
                                      if (c.Alk[index].value ==
                                          true) {
                                        Module.LikeTrending.add(
                                            "${Module.Trending[index]}");
                                        Module.LikeTrendingName.add(
                                            "${Module.TrendingNames[index]}");
                                        Module.LikeTrendingPrice.add(
                                            "${Module.TrendingPrice[index]}");
                                        Module.LikeTrendingMRP.add(
                                            "${Module.TrendingMRP[index]}");
                                        Module.LikeTiming.add(
                                            "${DateTime.now()}");
                                      } else {
                                        Module.LikeTrending.remove(
                                            "${Module.Trending[index]}");
                                        Module.LikeTrendingName
                                            .remove(
                                            "${Module.TrendingNames[index]}");
                                        Module.LikeTrendingPrice
                                            .remove(
                                            "${Module.TrendingPrice[index]}");
                                        Module.LikeTrendingMRP.remove(
                                            "${Module.TrendingMRP[index]}");
                                        Module.LikeTiming
                                            .removeAt(index);
                                      }
                                    },
                                    child: Obx(() =>
                                    c.Alk[index].value == true
                                        ? Icon(
                                      MdiIcons.heart,
                                      color: Colors.red,
                                    )
                                        : Icon(
                                      MdiIcons
                                          .heartOutline,
                                    )))),
                          ],
                        ),
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.035,
                              width: 90,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  color: Color(0xff00245a),
                                  borderRadius:
                                  BorderRadius.circular(6),
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
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.017)),
                              ),
                            ),
                            Container(
                              height: height * 0.035,
                              width: 60,
                              alignment: Alignment.center,
                              child: Row(
                                children: [
                                  Text(
                                    "5.0",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.green,
                                            fontSize:
                                            height * 0.016,
                                            fontWeight:
                                            FontWeight.bold)),
                                  ),
                                  Icon(
                                    MdiIcons.star,
                                    color: Colors.green,
                                    size: height * 0.02,
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

            // Best Deals
            SizedBox(
              height: height * 0.07,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  "Best Deals",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.04)),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: height * 0.046,
                )
              ],
            ),
            Divider(
              color: Color(0xff00245a),
              indent: width * 0.04,
              endIndent: width / 1.18,
              thickness: 4,
              height: 10,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: height * 0.4,
              width: width,
              alignment: Alignment.center,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: Module.Trending.length,
                itemBuilder: (context, index) {
                  return Flexible(
                    child: Container(
                      height: height * 0.3,
                      width: width * 0.3,
                      margin: EdgeInsets.all(10),
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
                      child: Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(
                                  vertical: 10,
                                ),
                                child: Text(
                                  "${Module.TrendingNames[index]}",
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:
                                          height * 0.018)),
                                ),
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(
                                  vertical: 0,
                                ),
                                child: Text(
                                  "New Design",
                                  style: GoogleFonts.montserrat(
                                      textStyle: TextStyle(
                                          color: Colors.blueGrey,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:
                                          height * 0.015)),
                                ),
                              ),
                              Container(
                                height: height * 0.04,
                                width: width * 0.1,
                                alignment: Alignment.center,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    color: Color(0xff00245a),
                                    borderRadius:
                                    BorderRadius.circular(6),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black,
                                          blurRadius: 10,
                                          spreadRadius: -7)
                                    ]),
                                child: Text(
                                  "Place Order",
                                  style: GoogleFonts.raleway(
                                      textStyle: TextStyle(
                                          color: Colors.white,
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:
                                          height * 0.02)),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: height * 0.28,
                            width: width * 0.12,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(20),
                                image: DecorationImage(
                                    image: AssetImage(
                                        Module.Trending[index]),
                                    fit: BoxFit.fill)),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),

            SizedBox(
              height: height * 0.02,
            ),

            // Auto Ads Slider
            SizedBox(
              height: height * 0.03,
            ),
            Row(
              children: [
                SizedBox(
                  width: width * 0.04,
                ),
                Text(
                  "Top",
                  style: GoogleFonts.raleway(
                      textStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: height * 0.04)),
                ),
                SizedBox(
                  width: width * 0.01,
                ),
                Icon(
                  Icons.keyboard_arrow_right,
                  color: Colors.black,
                  size: height * 0.046,
                )
              ],
            ),
            Divider(
              color: Color(0xff00245a),
              indent: width * 0.04,
              endIndent: width / 1.13,
              thickness: 4,
              height: 10,
            ),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              height: 270,
              child: CarouselSlider(
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration:
                    Duration(milliseconds: 900),
                    autoPlayCurve: Curves.decelerate,
                    clipBehavior: Clip.antiAlias,
                    viewportFraction: 0.4,
                    enlargeStrategy:
                    CenterPageEnlargeStrategy.scale,
                    enlargeFactor: 0.2,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    height: height * 0.5),
                items: Module.Trending.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: 510,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 10,
                                  spreadRadius: -5)
                            ],
                            borderRadius:
                            BorderRadius.circular(20)),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: height * 0.34,
                              width: 150,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                  BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(i),
                                      fit: BoxFit.fill)),
                            ),
                            Column(
                              mainAxisAlignment:
                              MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                  const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Get Upto 50% Off",
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.grey,
                                            fontSize:
                                            height * 0.02)),
                                  ),
                                ),
                                Container(
                                  height: height * 0.05,
                                  width: width * 0.14,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                      color: Color(0xff00245a),
                                      borderRadius:
                                      BorderRadius.circular(
                                          6),
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black,
                                            blurRadius: 10,
                                            spreadRadius: -7)
                                      ]),
                                  child: Text(
                                    "Grab The Offer",
                                    style: GoogleFonts.raleway(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.bold,
                                            fontSize:
                                            height * 0.017)),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
            SizedBox(
              height: height * 0.02,
            ),

            // Categories
            Container(
              height: height * 0.35,
              width: width,
              margin: EdgeInsets.all(10),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: Module.category.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: height * 0.35,
                    width: width * 0.2,
                    margin: EdgeInsets.all(5),
                    child: Stack(
                      children: [
                        Image.asset(
                          Module.categoryImage[index],
                          fit: BoxFit.fill,
                          height: height * 0.35,
                        ),
                        Positioned(
                          top: height * 0.25,
                          child: Container(
                            height: height * 0.03,
                            width: width * 0.14,
                            alignment: Alignment.center,
                            child: Text(
                              Module.category[index],
                              style: GoogleFonts.raleway(
                                  textStyle: TextStyle(
                                      shadows: [
                                        Shadow(
                                          color: Colors.white,
                                          blurRadius: 10,
                                        )
                                      ],
                                      letterSpacing: 1,
                                      color: Colors.white,
                                      fontSize: height * 0.025,
                                      fontWeight:
                                      FontWeight.bold)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            //features
            SizedBox(
              height: height * 0.04,
            ),

            Container(
              height: height * 0.15,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.network(
                          "https://assets1.lottiefiles.com/packages/lf20_ovwsvehd.json",
                          height: height * 0.15,
                          width: width * 0.1,
                          frameRate: FrameRate(120),
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Free Shipping",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.022)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5),
                              child: Text(
                                "Deliver To Door",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.018)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_zzr6z38v.json",
                          height: height * 0.15,
                          width: width * 0.1,
                          frameRate: FrameRate(120),
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Big Savings",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.022)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5),
                              child: Text(
                                "At Lowest Price",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.018)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_ep1tn2ew.json",
                          height: height * 0.15,
                          width: width * 0.1,
                          frameRate: FrameRate(120),
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Money Back",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.022)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5),
                              child: Text(
                                "Easy To Return",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.018)),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: width * 0.02,
                        ),
                        VerticalDivider(
                          color: Colors.black,
                          thickness: 1,
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment:
                      MainAxisAlignment.spaceEvenly,
                      children: [
                        Lottie.network(
                          "https://assets5.lottiefiles.com/packages/lf20_1snz9wmy.json",
                          height: height * 0.15,
                          width: width * 0.1,
                          frameRate: FrameRate(120),
                        ),
                        Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Exchange Offer",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.black,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.022)),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 5, right: 5),
                              child: Text(
                                "Easy To Exchange",
                                style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.grey,
                                        fontWeight:
                                        FontWeight.bold,
                                        fontSize:
                                        height * 0.018)),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(
              height: height * 0.04,
            ),

            //Information
            Container(
              height: height * 0.4,
              width: width,
              color: Color(0xff00245a),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "ABOUT",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.02)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Contact Us",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "About Us",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {
                            Fluttertoast.showToast(
                                msg:
                                "This Option isn't Available for now",
                                textColor: Colors.white,
                                gravity: ToastGravity.BOTTOM,
                                webBgColor: LinearGradient(
                                    colors: [
                                      Colors.black,
                                      Colors.grey
                                    ]));
                          },
                          child: Text(
                            "Become a Seller",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "My Account",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.02)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Wishlist",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {
                            Get.to(cart());
                          },
                          child: Text(
                            "Returns & Orders",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Terms & Conditions",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Coming Soon",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Help",
                          style: GoogleFonts.raleway(
                              textStyle: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: height * 0.02)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Payments",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Shipping",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "Cancellation & Returns",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            "FAQ",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          )),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: height * 0.1,
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
                                  fontSize: height * 0.02)),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.02,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            "15, Vanmali Park Society\nYogichowk, Surat",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.call,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            "8160011080",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: height * 0.01,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.mail,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: width * 0.01,
                          ),
                          Text(
                            "anadhsuhagiya65@gmail.com",
                            style: GoogleFonts.raleway(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: height * 0.017)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),

            //CopyRight
            SizedBox(
              height: height * 0.04,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: height * 0.07,
                  width: width * 0.3,
                  alignment: Alignment.center,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "© 2023 | Powered by 9 Vision",
                    style: GoogleFonts.baloo2(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: height * 0.025)),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  onHover: (value) {
                    if (value == true) {
                      ImaFac = "images/facebookColor.png";
                      fac = true;
                    } else {
                      ImaFac = "images/facebook.png";
                      fac = false;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.033,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FontAwesomeIcons.facebook,
                      color: fac == true
                          ? Colors.blueAccent
                          : Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                InkWell(
                  hoverColor: Colors.transparent,
                  onTap: () {},
                  onHover: (value) {
                    if (value == true) {
                      ImaIns = "images/instagramColor.png";
                      ins = true;
                    } else {
                      ImaIns = "images/instagram.png";
                      ins = false;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.033,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FontAwesomeIcons.instagram,
                      color:
                      ins == true ? Colors.red : Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: width * 0.03,
                ),
                InkWell(
                  onTap: () {},
                  hoverColor: Colors.transparent,
                  onHover: (value) {
                    if (value == true) {
                      ImaLin = "images/linkedincolor.png";
                      lin = true;
                    } else {
                      ImaLin = "images/linkedin.png";
                      lin = false;
                    }
                    setState(() {});
                  },
                  child: Container(
                    height: height * 0.07,
                    width: width * 0.033,
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      FontAwesomeIcons.linkedin,
                      color: lin == true
                          ? Colors.blueAccent
                          : Colors.black,
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(
              height: height * 0.04,
            ),
          ],
        ),
      ),
    )
                : Center(
      child: CupertinoActivityIndicator(color: Colors.black),
    );
  }
}

class Ccontrolling extends GetxController {
  List<RxBool> Alk = [
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs,
    false.obs
  ];

  void like(int i) {
    Alk[i].toggle();
  }
}
