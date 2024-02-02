import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/portfolio.dart';
import 'controller/assetsController.dart';

class Assets extends StatelessWidget {
  Assets({Key? key});

  // static final List<String> genderItems  = ['091C123456SA', '091C123456SB'];
  //static String? selectedValue;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final AssetsController controller = Get.put(AssetsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(

        appBar: AppBar(
          // centerTitle: true, // 가운데 정렬
          //backgroundColor: Color(0xffFCAF17), // 앱바 색상
          toolbarHeight: 130.0,
          centerTitle: true,
          titleSpacing: 0, //appbar 양옆 padding 없애기
          title: Column(

              mainAxisAlignment: MainAxisAlignment.center, //  수직 가운데 정렬
              crossAxisAlignment: CrossAxisAlignment.center, //수평 정렬
              children: [
                Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom: BorderSide(
                          color: Color(0xffEBEEF0),
                          width: 1.0,
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/left_arrow_icon.png',
                          width: 18,
                          height: 18,
                        ),
                        SizedBox(
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 35),
                            child: Container(
                              // color: Colors.blue,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  'Assets Detail',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Image.asset(
                          'assets/right_arrow_icon.png',
                          width: 18,
                          height: 18,
                        ),
                      ],
                    ),
                  ),

                Padding(
                  padding: EdgeInsets.only(bottom: 10, top:20),
                  child: Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal:24),
                      // 양옆 margine
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            child: DropdownButtonFormField2<String>(
                              isExpanded: true,
                              decoration: InputDecoration(
                                // Add Horizontal padding using menuItemStyleData.padding so it matches
                                // the menu padding when button's width is not specified.
                                contentPadding: const EdgeInsets.symmetric(
                                    vertical: 10), // 높이 padding
                                enabledBorder: OutlineInputBorder(

                                  borderSide:const BorderSide(color: Color(0xffEBEEF0)), // 드롭박스
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                border:  OutlineInputBorder( // 눌렀을때
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                // labelStyle: new TextStyle(color: Color(0xffEBEEF0)),

                              ),
                              hint: Text(
                                '${controller.selectedValue.value}',
                                style: const TextStyle(fontSize: 14),
                              ),
                              items: controller.combo_items
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: const TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                              // validator: (value) {
                              //   if (value == null) {
                              //     return 'Please select gender.';
                              //   }
                              //   return null;
                              // },
                              onChanged: (value) {
                                controller.putselectedValue(value.toString());

                              },
                              onSaved: (value) {},
                              buttonStyleData: const ButtonStyleData(
                                padding: EdgeInsets.only(right: 11), // 오른쪽 pa
                              ),
                              iconStyleData: IconStyleData(
                                // icon: Icon(
                                //   Icons.arrow_drop_down,
                                //   color: Colors.black45,
                                // ),
                                icon: Image.asset(
                                  'assets/down_arrow_icon.png',
                                  width: 18,
                                  height: 18,
                                ),
                                iconSize: 18,
                              ),
                              dropdownStyleData: DropdownStyleData(
                                decoration: BoxDecoration(

                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              menuItemStyleData: const MenuItemStyleData(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 20), // 왼쪽 패딩
                              ),
                            ),

                          ),
                          // const SizedBox(height: 30),
                          // TextButton(
                          //   onPressed: () {
                          //     if (_formKey.currentState!.validate()) {
                          //       _formKey.currentState!.save();
                          //     }
                          //   },
                          //   child: const Text('Submit Button'),
                          // ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),

        ),
        body: DefaultTabController(
          length: 3, // 탭의 개수
          child: Column(
            children: [
              const SizedBox(
                height: 37,
                child: TabBar(
                  indicatorWeight: 1.0, // 선 두께
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Color(0xffFCAF17), // 인디케이터 색상
                  labelColor: Color(0xffFCAF17), // 라벨 색상
                  unselectedLabelColor: Color(0xffC6CBD0), // 선택되지 않은 라벨 색상
                  labelStyle:
                      TextStyle(fontSize: 14, fontWeight: FontWeight.bold), // 글씨 크기
                  // labelPadding: EdgeInsets.symmetric(horizontal: 1), // 라벨 패딩
                  tabs: [
                    Tab(
                      text: 'Portfolio',
                    ),
                    Tab(
                      text: 'Cash balance',
                    ),
                    Tab(
                      text: 'Assets Assets',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: TabBarView(
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    Portfolio(),
                    const Align(
                      alignment: Alignment.center,
                      child: Text('Cash balance', textAlign: TextAlign.center),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Text('Assets report', textAlign: TextAlign.center),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
