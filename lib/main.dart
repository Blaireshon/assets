import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:practice/sellSymbols.dart';
import 'assets.dart';
import 'home.dart';

void main() {
  runApp(
      const MyApp()
      // ChangeNotifierProvider( // 상태 공유
      //   create: (context) => CheckboxState(), //공유할 상태를 만들어주는 함수를 설정
      //   child: MyApp(),
      // )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        //
        // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        // useMaterial3: true,
      ),
       home: const Home(),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/sellSymbols', page: () =>  SellSymbols()) ,
        GetPage(name: '/assets', page: () =>  Assets()),
      ],

    );
  }
}
