import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:online_shopping/Modules.dart';
import 'package:online_shopping/search.dart';

import 'lauoutFor3device.dart';

class category extends StatefulWidget {
  const category({Key? key}) : super(key: key);

  @override
  State<category> createState() => _categoryState();
}

class _categoryState extends State<category> {
  var h, w;

  TextEditingController search2 = TextEditingController();
  TextEditingController search1 = TextEditingController();
  String searchVal = "";

  String Category = "";

  @override
  Widget build(BuildContext context) {
    //Size Media Query
    w = MediaQuery.of(context).size.width;
    h = MediaQuery.of(context).size.height;

    final CATcontrolling c = Get.put(CATcontrolling());

    return ResponsiveWidget.isSmallScreen(context)
        ? Scaffold(
            backgroundColor: Color(0x5987a7fa),
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
                    width: w * 0.03,
                  ),
                  Image.asset(
                    'images/store.png',
                    height: h * 0.04,
                  ),
                  SizedBox(
                    width: w * 0.02,
                  ),
                  Text(
                    "9 Vision",
                    style: GoogleFonts.raleway(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontSize: h * 0.023,
                            fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    width: w * 0.032,
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: h * 0.065,
                          width: w * 0.78,
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
                      InkWell(
                        onTap: () {
                          searchVal = search2.text;

                          if (searchVal.isNotEmpty) {
                            Get.to(search(searchVal));
                          }
                        },
                        child: Container(
                          height: h * 0.053,
                          width: h * 0.053,
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
                    height: h * 0.03,
                  ),
                  SizedBox(
                    height: h * 0.4,
                    width: w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: h * 0.4,
                          width: w * 0.35,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -4)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.19,
                                width: w * 0.3,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Module.Trending[index]),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              SizedBox(
                                height: h * 0.013,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "${Module.TrendingNames[index]}",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: h * 0.017)),
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 4, right: 5),
                                        child: Text(
                                          "${Module.TrendingPrice[index]}",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: h * 0.016,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 1, top: 4, right: 10),
                                        child: Text(
                                          "${Module.TrendingMRP[index]}",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                  fontSize: h * 0.014,
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
                              SizedBox(
                                height: h * 0.013,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.3,
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
                                              fontSize: h * 0.02)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.4,
                    width: w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: h * 0.4,
                          width: w * 0.35,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -4)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.19,
                                width: w * 0.3,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Module.Trending[index]),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              SizedBox(
                                height: h * 0.013,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "${Module.TrendingNames[index]}",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: h * 0.017)),
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 4, right: 5),
                                        child: Text(
                                          "${Module.TrendingPrice[index]}",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: h * 0.016,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 1, top: 4, right: 10),
                                        child: Text(
                                          "${Module.TrendingMRP[index]}",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                  fontSize: h * 0.014,
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
                              SizedBox(
                                height: h * 0.013,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.3,
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
                                              fontSize: h * 0.02)),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.4,
                    width: w,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: h * 0.4,
                          width: w * 0.35,
                          margin: EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -4)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: h * 0.19,
                                width: w * 0.3,
                                margin: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Module.Trending[index]),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(7)),
                              ),
                              SizedBox(
                                height: h * 0.013,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Container(
                                    margin: EdgeInsets.all(5),
                                    child: Text(
                                      "${Module.TrendingNames[index]}",
                                      softWrap: true,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: h * 0.017)),
                                    ),
                                  ))
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 10, top: 4, right: 5),
                                        child: Text(
                                          "${Module.TrendingPrice[index]}",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: h * 0.016,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 1, top: 4, right: 10),
                                        child: Text(
                                          "${Module.TrendingMRP[index]}",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  decoration: TextDecoration
                                                      .lineThrough,
                                                  color: Colors.grey,
                                                  fontSize: h * 0.014,
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
                              SizedBox(
                                height: h * 0.013,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: h * 0.04,
                                    width: w * 0.3,
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
                                              fontSize: h * 0.02)),
                                    ),
                                  ),
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
          )
        : Scaffold(
            backgroundColor: Color(0x5987a7fa),
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
                    width: w * 0.03,
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
                            color: Colors.white,
                            fontSize: h * 0.025,
                            fontWeight: FontWeight.bold)),
                  ),

                  SizedBox(
                    width: w * 0.032,
                  ),

                  // Search Text Field
                  Container(
                    height: h * 0.045,
                    width: w * 0.4,
                    alignment: AlignmentDirectional.centerStart,
                    padding: EdgeInsets.only(bottom: 5),
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
                    child: TextField(
                      controller: search1,
                      cursorColor: Colors.black,
                      textAlignVertical: TextAlignVertical.top,
                      style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: h * 0.02)),
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        errorBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        hintStyle: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                fontSize: h * 0.02,
                                fontWeight: FontWeight.bold)),
                        hintText: "Search Product",
                        prefixIcon: Icon(
                          MdiIcons.shoppingSearch,
                          color: Colors.black,
                          size: h * 0.03,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            body: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: h,
                    width: 350,
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black,
                              spreadRadius: -4,
                              blurRadius: 10)
                        ]),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "CATEGORIES",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 25,
                        ),
                        Obx(
                          () => RadioListTile(
                            activeColor: Color(0xff00245a),
                            title: Text(
                              "Name1",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                            ),
                            value: c.name1.value,
                            groupValue: c.SelectedCat.value,
                            onChanged: (value) {
                              print("1");
                              c.Name1(value);
                            },
                          ),
                        ),
                        Obx(
                          () => RadioListTile(
                            activeColor: Color(0xff00245a),
                            title: Text(
                              "Name2",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                            ),
                            value: c.name2.value,
                            groupValue: c.SelectedCat.value,
                            onChanged: (value) {
                              print("1");
                              c.Name2(value);
                            },
                          ),
                        ),
                        Obx(
                          () => RadioListTile(
                            activeColor: Color(0xff00245a),
                            title: Text(
                              "Name3",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                            ),
                            value: c.name3.value,
                            groupValue: c.SelectedCat.value,
                            onChanged: (value) {
                              print("1");
                              c.Name3(value);
                            },
                          ),
                        ),
                        Obx(
                          () => RadioListTile(
                            activeColor: Color(0xff00245a),
                            title: Text(
                              "Name4",
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.black, fontSize: 14)),
                            ),
                            value: c.name4.value,
                            groupValue: c.SelectedCat.value,
                            onChanged: (value) {
                              print("1");
                              c.Name4(value);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: h,
                    width: 250,
                    child: ListView.builder(
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 340,
                          width: 250,
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -4)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: 190,
                                width: 230,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Module.Trending[index]),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                    "${Module.TrendingNames[index]}",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ))
                                ],
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
                                                  fontSize: 12,
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
                                                  fontSize: 10,
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
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 130,
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
                                              fontSize: 14)),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Text(
                                          "5.0",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(
                                          MdiIcons.star,
                                          color: Colors.green,
                                          size: 18,
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
                    height: h,
                    width: 250,
                    child: ListView.builder(
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 340,
                          width: 250,
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -4)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: 190,
                                width: 230,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Module.Trending[index]),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                    "${Module.TrendingNames[index]}",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ))
                                ],
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
                                                  fontSize: 12,
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
                                                  fontSize: 10,
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
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 130,
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
                                              fontSize: 14)),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Text(
                                          "5.0",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(
                                          MdiIcons.star,
                                          color: Colors.green,
                                          size: 18,
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
                    height: h,
                    width: 250,
                    child: ListView.builder(
                      itemCount: Module.Trending.length,
                      itemBuilder: (context, index) {
                        return Container(
                          height: 340,
                          width: 250,
                          margin: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    blurRadius: 10,
                                    spreadRadius: -4)
                              ]),
                          child: Column(
                            children: [
                              Container(
                                height: 190,
                                width: 230,
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image:
                                            AssetImage(Module.Trending[index]),
                                        fit: BoxFit.fill),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Flexible(
                                      child: Text(
                                    "${Module.TrendingNames[index]}",
                                    softWrap: true,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17)),
                                  ))
                                ],
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
                                                  fontSize: 12,
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
                                                  fontSize: 10,
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
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    height: 30,
                                    width: 130,
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
                                              fontSize: 14)),
                                    ),
                                  ),
                                  Container(
                                    height: 30,
                                    width: 60,
                                    alignment: Alignment.center,
                                    child: Row(
                                      children: [
                                        Text(
                                          "5.0",
                                          style: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                  color: Colors.green,
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.bold)),
                                        ),
                                        Icon(
                                          MdiIcons.star,
                                          color: Colors.green,
                                          size: 18,
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

class CATcontrolling extends GetxController {
  RxBool Alk = false.obs;

  RxString name1 = "name1".obs;
  RxString name2 = "name2".obs;
  RxString name3 = "name3".obs;
  RxString name4 = "name4".obs;
  RxString name5 = "name5".obs;
  RxString SelectedCat = "".obs;

  void like() {
    Alk.toggle();
  }

  void Name1(Object? value) {
    SelectedCat.value = value.toString();
  }

  void Name2(Object? value) {
    SelectedCat.value = value.toString();
  }

  void Name3(Object? value) {
    SelectedCat.value = value.toString();
  }

  void Name4(Object? value) {
    SelectedCat.value = value.toString();
  }
}
