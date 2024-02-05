

import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SellController extends GetxController {
  late RxString selectedValue2 = ''.obs;
  late RxBool isChecked = true.obs; // 전체 체크박스
  late RxList isCheckBox = [].obs; // list 체크박스
  late RxList isCheckBoxList = [].obs; // 체크박스가 보여지는 row index
  late RxString selectedRadio = '1'.obs; // 필터 110%/50%
  late RxString selectedRadio_t = '1'.obs;// 필터 110%/50% temp
  late RxString toastMessage = ''.obs;
  late RxBool chkLock = true.obs;


  late RxList<Map<String, dynamic>> showAssets = <Map<String, dynamic>>[].obs;


  final RxList<Map<String, dynamic>> totalAssets =
      RxList<Map<String, dynamic>>([
    {
      "price": "25500",
      "qty": 30,
      "symbol": "A32",
    },
    {
      "price": "MTL",
      "qty": 1000,
      "symbol": "AAV",
    },
    {
      "price": "3900",
      "qty": 2,
      "symbol": "APP",
    },
    {
      "price": "MP",
      "qty": 438700,
      "symbol": "ASM",
    },
    {
      "price": "7700",
      "qty": 100,
      "symbol": "BBT",
    },
    {
      "price": "10700",
      "qty": 77,
      "symbol": "BCC",
    },
    {
      "price": "MTL",
      "qty": 1500,
      "symbol": "BSC",
    },
    {
      "price": "9100",
      "qty": 77,
      "symbol": "C4G",
    },
    {
      "price": "MTL",
      "qty": 15557400,
      "symbol": "CEO",
    },
    {
      "price": "670",
      "qty": 100,
      "symbol": "CMBB1901",
    },
    {
      "price": "MTL",
      "qty": 200,
      "symbol": "CTC",
    }
  ]);

  void onInit() {

    showAssets.clear();
    isCheckBox.clear();
    for (var asset in totalAssets) {
      showAssets.add(asset);
    }
    setIsCheckBoxList();
  }

  void getselectedValue(String selected) {
    selectedValue2.value = selected;
  }
// 체크박스 =====================================================================
  //체크박스 클릭했을 때
  void CheckboxState(String indx, value) {
    //전체클릭했을때
    if (indx == 'all') {
      //print('all');
      isChecked.value = !isChecked.value; // all checkbox value 수정
      for (var i = 0; i < isCheckBoxList.length; i++) { // 체크박스가 나타난 row의 checkbox value 수정
        isCheckBox[isCheckBoxList[i]] = isChecked.value;
      }
    } else {// row의 checkbox 하나를 클릭했을 때
      //print('one' + indx);
      int chk_indx = int.parse(indx);
      isCheckBox[chk_indx] = !value;
      checkboxStateChk(chk_indx, value);
    }
    sellButtonLock();
  }

  // 전체 선택했다가 하나 클릭했을때
  void checkboxStateChk(int indx, value){
    if(isChecked.value && value){ // 전체 선택 해제
      isChecked.value = !isChecked.value;
      for (var i = 0; i < isCheckBoxList.length; i++) { //체크박스가 나타난 row에 모두 false
        isCheckBox[isCheckBoxList[i]]  = false;
      }
      isCheckBox[indx] = true;
    }
    sellButtonLock();
  }

  //다시 조회했을때
  void setIsCheckBoxList(){
    isChecked.value = true;
    isCheckBoxList.clear();
    isCheckBox.clear();
    for(var i = 0; i < showAssets.length; i++){// 보여주는 list의 vol이 100초과인 행만 담음.
      isCheckBox.add(false);
      if(showAssets[i]['qty']>100){
        isCheckBoxList.add(i);
      }
    }
    // 100초과인 row에만 true 수정.
    for(var row in isCheckBoxList){
      isCheckBox[row] = true;
    }
  }

  //라디오버튼 ==================================================================
  void setSelectedRadio(String opt){
    selectedRadio.value = opt;
  }
  void filtersClose(){
    String temp = selectedRadio_t.value;
    selectedRadio.value = temp;
  }

  //100%, 50%
  void halfVol(String opt) {
    selectedRadio.value = opt;
    showAssets.clear();
    if(selectedRadio.value == '2'){

      for( var asset in totalAssets){

      int currentQty = asset['qty'];
      int newQty = currentQty ~/ 2; // 절반으로 줄이기

      Map<String, dynamic> newAsset = {
        'price': asset['price'],
        'qty': newQty,
        'symbol':asset['symbol'],
      };
      showAssets.add(newAsset);
    }
    }else{
      for (var asset in totalAssets) {
        showAssets.add(asset);
      }
    }
    String temp = selectedRadio.value;
    selectedRadio_t.value = temp;

    setIsCheckBoxList();
  }

  //click sell button
  void sellButton(){
    List<String> values = [];

      for (var i = 0; i < isCheckBox.length; i++) {
        if (isCheckBox[i]) {
          values.add(totalAssets[i]['symbol']);
          print(totalAssets[i]['symbol']);
        }
      }
      if(values.length>0) {
        String message = values.join(', ');
        toastMessage.value = message + ' 의 거래가 성공하였습니다.';
      }else{
        toastMessage.value = '거래 종목이 없습니다.';
      }
  }

  // 체크박스 모두 해제하면 sell버튼 lock
  void sellButtonLock(){

    for (var i = 0; i < isCheckBox.length; i++) { // checkbox 중에 하나라도 true이면 true/ 모두 false이면 false
      if (isCheckBox[i]) {
        chkLock.value = true;
        break;
      }else{
        chkLock.value = false;
      }
    }

  }

}
