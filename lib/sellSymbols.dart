import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'controller/assetsController.dart';
import 'controller/sellController.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';


class SellSymbols extends StatelessWidget {
  SellSymbols({super.key});

  final AssetsController controller = Get.put(AssetsController());
  final SellController sellController = Get.put(SellController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();



  var numberFormat = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    String? selectedValue = Get.arguments;
    Color buttonColor = sellController.chkLock.value ? Color(0xffEF292B) : Color(0xffC6CBD0);

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        scrolledUnderElevation: 0,
        // 스크롤 할 때 appbar컬러 바뀐는거 고정
        centerTitle: true,
        // title 가운데
        leading: const BackButton(),
        title: const FittedBox(
            child: Text(
          'Sell Symbols',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        )),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_alt, color: Colors.black),
            onPressed: () {
              _displayFilters(context);
              //  AlertDialog(
              //   shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(5),
              //   ),
              //   title: SizedBox(
              //       // width: MediaQuery.of(context).size.width,
              //       width: double.infinity,
              //       child: Row(
              //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //           children: [
              //             Text('Filters'),
              //             IconButton(
              //               icon: Icon(Icons.close),
              //               onPressed: () {
              //                 Navigator.of(context).pop(); // 창 닫기
              //                 sellController.filtersClose();
              //               },
              //             ),
              //           ])),
              //   content:Obx( () =>
              // Container(
              //     // width: double.infinity,
              //     child: Column(
              //       children: [
              //         TextField(),
              //         Text('Sell Vol'),
              //         RadioListTile(
              //           title: Text('100%'),
              //           value: '1',
              //           groupValue:  sellController.selectedRadio.value,
              //           activeColor:Color(0xffFCAF17),
              //           onChanged: (value) {
              //
              //             sellController.setSelectedRadio(value!);
              //           },
              //         ),
              //         RadioListTile(
              //           title: Text('50%'),
              //           value: '2',
              //           groupValue: sellController.selectedRadio.value,
              //           activeColor:Color(0xffFCAF17),
              //           onChanged: (value) {
              //
              //             sellController.setSelectedRadio(value!);
              //           },
              //         ),
              //         Row(children: [
              //           ElevatedButton(
              //               onPressed: () {}, child: Text('Reset')),
              //           ElevatedButton(
              //               onPressed: () {
              //                 sellController.halfVol(sellController.selectedRadio.value);
              //                 Navigator.of(context).pop();
              //
              //               }, child: Text('Apply'))
              //         ])
              //       ],
              //     ),
              //   ),
              //         ),
              // );
              //insetPadding: const  EdgeInsets.fromLTRB(0,0,0, 0), // 위젯의 내부 여백
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1.0),
          child: Container(
            color: const Color(0xffEBEEF0), //
            height: 1.0,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 15, top: 15),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                // 양옆 margin
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
                            borderSide:
                                const BorderSide(color: Color(0xffEBEEF0)),
                            // 드롭박스
                            borderRadius: BorderRadius.circular(10),
                          ),
                          border: OutlineInputBorder(
                              // 눌렀을때
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        hint: Text(
                          '$selectedValue',
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
                        onChanged: (value) {
                          // controller.putselectedValue(value.toString());
                          // print(controller.selectedValue.value);
                        },
                        onSaved: (value) {},
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 20), // 오른쪽 pa
                        ),
                        iconStyleData: IconStyleData(
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
                  ],
                ),
              ),
            ),
          ),
          Obx(
            () => Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: DataTable2(
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => const Color(0xffF6F7F9)),
                  // 헤더 컬러
                  headingTextStyle: const TextStyle(color: Color(0xff8C949E)),
                  // 헤더 font color
                  showCheckboxColumn: false,
                  fixedTopRows: 1,
                  // 헤더 고정
                  dataRowHeight: 61.0,
                  //row 높이
                  headingRowHeight: 51.0,
                  // 헤더 높이
                  columnSpacing: 10,
                  // 0 : 텍스트 내용의 길이로 설정
                  horizontalMargin: 24,

                  minWidth: MediaQuery.of(context).size.width,
                  columns: [
                    DataColumn2(
                      fixedWidth: (MediaQuery.of(context).size.width -48) * .1,
                      label: Checkbox(
                        value: sellController.isChecked.value,



                        side: const BorderSide(
                          color: Color(0xff8C949E),
                        ),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        activeColor: const Color(0xffFCAF17),
                        onChanged: (bool? value) {
                          sellController.CheckboxState('all', !value!);
                        },
                      ),
                    ),
                    DataColumn2(
                      fixedWidth: (MediaQuery.of(context).size.width -48)  * .25,
                      label: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //width: MediaQuery.of(context).size.width * .2,
                          Text('Symbol'),
                        ],
                      ),
                    ),
                    DataColumn2(
                      fixedWidth: (MediaQuery.of(context).size.width -48)  * .29,
                      label: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //color: Colors.red,
                            //width: MediaQuery.of(context).size.width * .2,
                            Text('Vol.')
                          ]),
                    ),
                    DataColumn2(
                      fixedWidth: (MediaQuery.of(context).size.width -48)  * .25,
                      label: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Price'),
                          InkWell(
                              onTap: () {
                                print('exclamation');
                              },
                              child:const Padding(
                                padding: EdgeInsets.only(left :4.0),
                                child:  Icon(
                                  Icons.error_outline,
                                  color:Color(0xffFCAF17),
                                  size: 18,
                                ),
                              ),
                            ),

                        ],
                      ),
                    ),
                    DataColumn2(
                      fixedWidth:(MediaQuery.of(context).size.width - 48) * .1,
                      label: Container(
                          color: Colors.red,
                          //width: MediaQuery.of(context).size.width * .2,
                          child: Text('')),
                      //size: ColumnSize.S,
                    ),
                  ],

                  rows: sellController.showAssets.asMap().entries.map((entry) {
                    int index = entry.key;
                    dynamic asset = entry.value;

                    if (asset['qty'] != null && asset['qty'] > 100) {
                      return DataRow(
                        // border:  TableBorder(bottom: BorderSide(color: Colors.red, width: 1));
                        cells: [
                          DataCell(
                            Checkbox(
                              value: sellController.isCheckBox[index],
                              // You can set the initial value
                              side: const BorderSide(
                                color: Color(0xff8C949E),
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5)),
                              activeColor: const Color(0xffFCAF17),
                              onChanged: (bool? value) {
                                sellController.CheckboxState(
                                    index.toString(), !value!);
                              },
                            ),
                          ),
                          DataCell(
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    asset['symbol'],
                                    style: const TextStyle(),
                                  ),
                                ]),
                          ),
                          DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  numberFormat.format(asset['qty']),
                                  style: const TextStyle(),
                                )
                              ])),
                          DataCell(

                              Container(
                                margin:EdgeInsets.only(left: 8, right: 8),
                                padding: EdgeInsets.only(top :10, bottom: 10),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Color(0xffF6F7F9),
                                ),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    asset['price'],
                                    style: const TextStyle(),
                                  )
                                ]),
                              )),
                          DataCell(
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      _displayPriceChange(context);
                                    },
                                    child: Image.asset(
                                      'assets/writing_icon.png',
                                      width: 18,
                                      height: 18,
                                      color: const Color(0xff8C949E),
                                    ),
                                  )
                                ]),
                          ),
                        ],
                      );
                    } else {
                      return DataRow(
                        cells: [
                          const DataCell(
                            Text(''),
                          ),
                          DataCell(
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  asset['symbol'],
                                  style: const TextStyle(),
                                ),
                              ],
                            ),
                          ),
                          DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  numberFormat.format(asset['qty']),
                                  style: const TextStyle(),
                                )
                              ])),
                          DataCell(
                              Container(
                                margin:EdgeInsets.only(left: 8, right: 8),
                                padding: EdgeInsets.only(top :10, bottom: 10),

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color:Color(0xffF6F7F9),
                                ),
                                child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    asset['price'],
                                    style: const TextStyle(),
                                  )
                                ]),
                              )),
                          const DataCell(Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [Text('')])),
                        ],
                        // onSelectChanged: (bool? selected) {
                        //   selected == null
                        //       ? print('selected is null')
                        //       : print('${asset['symbol']} is $selected');
                        // },
                        // showCheckbox: false,
                      );
                    }
                  }).toList(),

                  // 헤더 셀 스타일 설정
                  // defaultHeaderStyle: TextStyle(
                  //   fontWeight: FontWeight.bold,
                  // ),
                ),

              ),
            ),
          ),

          // Container(
          //            width: MediaQuery.of(context).size.width,
          //  height: 300,
          //
          //  child: SingleChildScrollView(
          //  scrollDirection: Axis.vertical,
          //            child: DataTable(
          //
          //              columnSpacing: (0),  // 테이블 가로 컬럼 사이 간격
          //              horizontalMargin: 0, // 좌우 여백
          //              dataRowMaxHeight: 61.0, //row 높이
          //              headingRowHeight: 51.0, // 헤더 높이
          //              columns: [
          //                DataColumn(
          //
          //                  label: Checkbox(
          //                    value: true,
          //                    onChanged: (bool? value) {
          //                      // 체크박스 값이 변경되었을 때의 동작
          //                    },
          //                  ),
          //                ),
          //                DataColumn(label: Text('Symbol')),
          //                DataColumn(label: Text('Vol')),
          //                DataColumn(label: Text('Price')),
          //                DataColumn(label: Text('')),
          //              ],
          //              rows: sellController.totalAssets.map((asset) {
          //                return DataRow(
          //                  cells: [
          //                    DataCell(Checkbox(
          //                      value: true,
          //                      onChanged: (bool? value) {
          //                        // 체크박스 값이 변경되었을 때의 동작
          //                      },
          //                    )),
          //                    DataCell(Text(asset['symbol'])),
          //                    DataCell(Text(asset['qty'].toString())),
          //                    DataCell(Text(asset['price'])),
          //                    DataCell(Text('hi')),
          //                  ],
          //
          //                );
          //              }).toList(),
          //
          //            ),
          //  ),
          //        ),
        ],
      ),

      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(right: 24, left: 24, top: 10, bottom: 20),
        child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(

            child: ElevatedButton(
                        onPressed: ()  {
                          sellController.sellButton();
                          _showToast(context,sellController.toastMessage.value);
                          },
                        style: ElevatedButton.styleFrom(

                          backgroundColor: Color(0xffEF292B) ,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          elevation: 0,
                        ),
                        child: const Text('Sell',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.white))),

                ),
              ],
            )),
      ),
    );
  }
  void _showToast(context,text) {
    final fToast = FToast();
    fToast.init(context);
    Widget toast =
    Container(
      width: MediaQuery.of(context).size.width-50,
      padding: const EdgeInsets.symmetric(horizontal: 24.0,vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Color(0xff67CC36),
      ),
      child: Center(child: Text(text,style: TextStyle(color:Colors.white), textAlign: TextAlign.center,overflow: TextOverflow.ellipsis,maxLines: 5,)),
    );

    fToast.showToast(
        child: toast,
        toastDuration: const Duration(seconds: 3),
        positionedToastBuilder: (context, child) {
          return Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                child: child,
                top: 100,
              ),
            ],
          );
        }
    );
  }

  void _displayFilters(BuildContext context) {
    showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Padding(
            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height - 437, 0, 0),
            // padding으로 화면 크기 조절
            child: Scaffold(
              backgroundColor: Colors.black.withOpacity(0.5),
              body: Obx(
                () => Container(
                  padding:
                      const EdgeInsets.only(bottom: 10, right: 24, left: 24),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10), // 왼쪽 위 모서리
                      topRight: Radius.circular(10), // 오른쪽 위 모서리
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        height: 54,
                        color: Colors.blue,
                        // padding: EdgeInsets.only(right: 0),
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Filters',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                            IconButton(
                              icon: const Icon(Icons.close, size: 24),
                              onPressed: () {
                                Navigator.of(context).pop(); // 창 닫기
                                sellController.filtersClose();
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 40,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: TextFormField(
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: const Color(0xffF6F7F9),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  borderSide: BorderSide.none,
                                ))),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 20),
                        color: Colors.white,
                        child: const Text(
                          'Sell Vol.',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF6F7F9),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: RadioListTile(
                          title: const Text('100%'),
                          value: '1',
                          groupValue: sellController.selectedRadio.value,
                          activeColor: const Color(0xffFCAF17),
                          onChanged: (value) {
                            sellController.setSelectedRadio(value!);
                          },
                        ),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xffF6F7F9),
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                        ),
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.only(bottom: 20),
                        child: RadioListTile(
                          title: const Text('50%'),
                          value: '2',
                          groupValue: sellController.selectedRadio.value,
                          activeColor: const Color(0xffFCAF17),
                          onChanged: (value) {
                            sellController.setSelectedRadio(value!);
                          },
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(top: 30, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffF6F7F9),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text('Reset',
                                    style: TextStyle(color: Colors.black)),
                              ),
                            ),
                            const SizedBox(width: 15),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  sellController.halfVol(
                                      sellController.selectedRadio.value);
                                  Navigator.of(context).pop();
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xffFCAF17),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 0,
                                ),
                                child: const Text(
                                  'Apply',
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      // ElevatedButton(
                      //   onPressed: () {
                      //     Navigator.of(context).pop();
                      //   },
                      //   child: Text('취소'),
                      // ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }

  void _displayPriceChange(BuildContext context){
    showGeneralDialog(
        barrierLabel: "Barrier",
        barrierDismissible: false,
        barrierColor: Colors.black.withOpacity(0.5),
        context: context,
        pageBuilder: (context, animation, secondaryAnimation) {
          return Padding(

            padding: EdgeInsets.fromLTRB(
                0, MediaQuery.of(context).size.height - 437, 0, 200),

            child: Scaffold(
              body: Container(
                    // backgroundColor: Colors.white,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                    child:Column(
                          children: <Widget>[
                            Container(
                              height: 54,

                              padding: EdgeInsets.only(left:24, right: 20),
                              //margin: const EdgeInsets.only(bottom: 20),
                              // decoration: const BoxDecoration(
                              //   color: Colors.white,
                              //   borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              // ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text('Price change',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black)),
                                  IconButton(
                                    icon: const Icon(Icons.close, size: 24),
                                    onPressed: () {
                                      Navigator.of(context).pop(); // 창 닫기
                                      sellController.filtersClose();
                                    },
                                  ),
                                ],
                              ),
                            ),
                      Container(
                        color: const Color(0xffEBEEF0),
                        height: 1.0,
                        margin: EdgeInsets.only(bottom: 20),
                      ),
                        Container(
                              height: 60,

                              margin: const EdgeInsets.only(bottom: 20,),
                              padding: const EdgeInsets.only(left:24,right: 24,top:10, bottom: 10),
                              child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children:[
                              Text('Sell Price'),
                                Container(
                                  width: MediaQuery.of(context).size.width/2 ,
                                  child: TextField(

                                      decoration: InputDecoration(
                                          filled: true,
                                          fillColor: const Color(0xffF6F7F9),
                                          border: OutlineInputBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                            borderSide: BorderSide.none,
                                          ))),
                                ),
                              ]),
                            ),
                            Container(
                              color: Colors.white,
                              padding: const EdgeInsets.only( left:24, bottom: 20,right: 24),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: const Color(0xffF6F7F9),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(10),
                                        ),
                                        elevation: 0,
                                      ),
                                      child: const Text('Close',
                                          style: TextStyle(color: Colors.black)),
                                    ),
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child:ElevatedButton(
                                        onPressed: () {

                                          Navigator.of(context).pop();
                                        },
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: const Color(0xffFCAF17),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10),
                                          ),
                                          elevation: 0,
                                        ),
                                        child: const Text(
                                          'Confirm',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),

                                  )
                                ],
                              ),
                            ),
                            // ElevatedButton(
                            //   onPressed: () {
                            //     Navigator.of(context).pop();
                            //   },
                            //   child: Text('취소'),
                            // ),
                          ],
                        ),


                  ),
            ),
          );
       

        });
  }
}
