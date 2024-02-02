import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'controller/assetsController.dart';
import 'controller/sellController.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:intl/intl.dart';

class SellSymbols extends StatelessWidget {
  SellSymbols({super.key});

  final AssetsController controller = Get.put(AssetsController());
  final SellController sellController = Get.put(SellController());
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  var numberFormat = NumberFormat('#,###');

  @override
  Widget build(BuildContext context) {
    String? selectedValue = Get.arguments;

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.blue,
        centerTitle: true,
        // title 가운데
        leading: BackButton(),
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
              showDialog(
                  context: context,
                  // barrierDismissible: true, //바깥 영역 터치시 닫을지 여부 결정
                  builder: (BuildContext context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      title: SizedBox(
                          // width: MediaQuery.of(context).size.width,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Filters'),
                                IconButton(
                                  icon: Icon(Icons.close),
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 창 닫기
                                    sellController.filtersClose();
                                  },
                                ),
                              ])),
                      content:Obx( () =>
                    Container(
                        // width: double.infinity,
                        child: Column(
                          children: [
                            TextField(),
                            Text('Sell Vol'),
                            RadioListTile(
                              title: Text('100%'),
                              value: '1',
                              groupValue:  sellController.selectedRadio.value,
                              activeColor:Color(0xffFCAF17),
                              onChanged: (value) {

                                sellController.setSelectedRadio(value!);
                              },
                            ),
                            RadioListTile(
                              title: Text('50%'),
                              value: '2',
                              groupValue: sellController.selectedRadio.value,
                              activeColor:Color(0xffFCAF17),
                              onChanged: (value) {

                                sellController.setSelectedRadio(value!);
                              },
                            ),
                            Row(children: [
                              ElevatedButton(
                                  onPressed: () {}, child: Text('Reset')),
                              ElevatedButton(
                                  onPressed: () {
                                    sellController.halfVol(sellController.selectedRadio.value);
                                    Navigator.of(context).pop();

                                  }, child: Text('Apply'))
                            ])
                          ],
                        ),
                      ),
                            ),
                    );
                    //insetPadding: const  EdgeInsets.fromLTRB(0,0,0, 0), // 위젯의 내부 여백
                  });

              // 팝업 창을 띄우는 로직을 작성하세요.
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
            padding: EdgeInsets.only(bottom: 10, top: 20),
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
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
                          '${selectedValue}',
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
                          padding: EdgeInsets.only(right: 11), // 오른쪽 pa
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
              child: SizedBox(
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
                  // horizontalMargin: 0,
                  minWidth: MediaQuery.of(context).size.width,
                  columns: [
                    DataColumn2(
                      // label: Text('Symbol')
                      label: Checkbox(
                        value: sellController.isChecked.value,
                        // You can set the initial value
                        side: BorderSide(
                          color: Color(0xff8C949E),
                        ),
                        activeColor: Color(0xffFCAF17),
                        onChanged: (bool? value) {
                          sellController.CheckboxState('all', !value!);
                        },
                      ),
                      // size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text('Symbol'),
                      // size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text('Vol'),
                      // size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text('Price'),
                      // size: ColumnSize.S,
                    ),
                    DataColumn2(
                      label: Text(''),
                      // size: ColumnSize.S,
                    ),
                  ],

                  rows: sellController.showAssets.asMap().entries.map((entry) {
                    int index = entry.key;
                    dynamic asset = entry.value;
                    print('hi');
                    print(index);

                    if (asset['qty'] != null && asset['qty'] > 100) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Checkbox(
                              value: sellController.isCheckBox[index],
                              // You can set the initial value
                              side: BorderSide(
                                color: Color(0xff8C949E),
                              ),
                              activeColor: Color(0xffFCAF17),
                              onChanged: (bool? value) {
                                sellController.CheckboxState(
                                    index.toString(), !value!);
                              },
                            ),
                          ),
                          DataCell(
                            Text(
                              asset['symbol'],
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataCell(Text(
                            '${numberFormat.format(asset['qty'])}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            asset['price'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(
                            Image.asset(
                              'assets/writing_icon.png',
                              width: 18,
                              height: 18,
                              color: Color(0xff8C949E),
                            ),
                          ),
                        ],
                      );
                    } else {
                      return DataRow(
                        cells: [
                          DataCell(
                            Text(''),
                          ),
                          DataCell(Text(
                            asset['symbol'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            '${numberFormat.format(asset['qty'])}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text(
                            asset['price'],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )),
                          DataCell(Text('')),
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
            const EdgeInsets.only(right: 24, left: 24, top: 10, bottom: 10),
        child: SizedBox(
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xffEF292B),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          )),
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
}
