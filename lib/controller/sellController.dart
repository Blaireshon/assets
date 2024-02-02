import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class SellController extends GetxController {
  late RxString selectedValue2 = ''.obs;
  late RxBool isChecked = true.obs; // 전체 체크박스
  late RxList isCheckBox = [].obs; // list 체크박스
  late RxString selectedRadio = '1'.obs;
  late RxString selectedRadio_t = '1'.obs;

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
    for (var asset in totalAssets) {
      showAssets.add(asset);
    }
    for (var asset in totalAssets) {
      isCheckBox.add(true);
    }
  }

  void getselectedValue(String selected) {
    print('hi : ' + selected);
    selectedValue2.value = selected;
    print('hi : ' + selectedValue2.value);
  }

  //체크박스 클릭했을 때
  void CheckboxState(String indx, value) {
    if (indx == 'all') {
      isChecked.value = !isChecked.value;
      for (var i = 0; i < totalAssets.length; i++) {
        isCheckBox[i] = isChecked.value;
      }
    } else {
      int chk_indx = int.parse(indx);
      isCheckBox[chk_indx] = !value;
      checkboxStateChk(chk_indx, value);
    }
  }

  // 전체 선택했다가 하나 클릭했을때
  void checkboxStateChk(int indx, value){
    if(isChecked.value && value){
      isChecked.value = !isChecked.value;
      for (var i = 0; i < totalAssets.length; i++) {
        isCheckBox[i] = false;
      }
      isCheckBox[indx] = true;
    }
  }

  void setSelectedRadio(String opt){
    selectedRadio.value = opt;
  }
  void filtersClose(){
    String temp = selectedRadio_t.value;
    selectedRadio.value = temp;
  }

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
  }
}
