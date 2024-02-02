import 'package:practice/sellSymbols.dart';
import 'package:flutter/material.dart';
import 'controller/assetsController.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'controller/sellController.dart';

class Portfolio extends StatelessWidget {
  Portfolio({Key? key});

  final AssetsController controller = Get.put(AssetsController());


  var numberFormat = NumberFormat('#,###');
  var numberFormat_d = NumberFormat('###.0');

  @override
  Widget build(BuildContext context) {
    var portfolio = controller.comboData;


    return Scaffold(
          body: Column(
            children: [
              Container(
                margin:
                    const EdgeInsets.only(right: 24, left: 24, top: 15, bottom: 10),
                height: 47,
                // color: Colors.black,
                child: const Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Symbol',
                              style: TextStyle(color: Color(0xff8C949E))),
                          Text('Proportion',
                              style: TextStyle(color: Color(0xff8C949E)))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Total vol',
                              style: TextStyle(color: Color(0xff8C949E))),
                          Text('Avail. vol',
                              style: TextStyle(color: Color(0xff8C949E)))
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text('Cost Price',
                              style: TextStyle(color: Color(0xff8C949E))),
                          Text('Mar. Price',
                              style: TextStyle(color: Color(0xff8C949E)))
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 100,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('Gain/Loss',
                                style: TextStyle(color: Color(0xff8C949E))),
                            Text('%Gain/Loss',
                                style: TextStyle(color: Color(0xff8C949E)))
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(

                child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: portfolio.length + 1,
                    itemBuilder: (context, index) {
                      if (index < portfolio.length) {
                        controller.setProportion(portfolio[index]['basicPriceAmt'],
                            controller.totalAssets['stockAmt']); // proportion 계산 함수
                        return Container(

                          height: 67,
                          decoration: const BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color:   Color(0xffEBEEF0),
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Container(
                            margin: const EdgeInsets.only(
                                right: 24, left: 24, top: 10, bottom: 10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 80,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('${portfolio[index]['symbol']}',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      Text(
                                          '${controller.proportion.value.toString()}%')
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(numberFormat
                                          .format(portfolio[index]['total'])),
                                      Text(numberFormat
                                          .format(portfolio[index]['trade']))
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                          '${portfolio[index]['costPrice'] / 1000}'),
                                      Text(
                                          '${portfolio[index]['basicPrice'] / 1000}')
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          numberFormat
                                              .format(portfolio[index]['pnlAmt']),
                                          style: TextStyle(
                                            color: portfolio[index]['pnlAmt'] < 0
                                                ? const Color(0xffEF292B)
                                                : const Color(0xff67CC36),
                                          ),
                                        ),
                                        Text(
                                            '${numberFormat_d.format(portfolio[index]['pnlRate'])}%',
                                            style: TextStyle(
                                              color: portfolio[index]['pnlRate'] < 0
                                                  ? const Color(0xffEF292B)
                                                  : const Color(0xff67CC36),
                                            ))
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container(
                            height: 67,
                            color: const Color(0xffF6F7F9),
                            child: Container(
                              margin: const EdgeInsets.only(
                                  right: 24, left: 24, top: 10, bottom: 10),
                              child:  Row(
                                children: [
                                  SizedBox(
                                    width: 80,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text('Total',
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold)),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('-'),
                                        Text('-'),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Text('-'),
                                        Text('-'),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                         Obx(() =>  Text(controller.selectedValue.value)

                                         ),
                                          Text(
                                            '10',
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ));
                      }
                    }),
              ),
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
                          onPressed: () {
                            // Get.toNamed("/detail");
                            String selectedValue = controller.selectedValue.value;
                            Get.to(SellSymbols(), arguments: selectedValue);
                            // Get.toNamed("/sellSymbols/${selectedValue}");
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFCAF17),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              )),
                          child: const Text('Sell Symbols',
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
