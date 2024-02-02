import 'sellController.dart'as sellController;
import 'package:get/get.dart';

class AssetsController extends GetxController {
  RxList combo_items = ['091C123456SA', '091C123456SB'].obs;

  late RxString selectedValue = ''.obs;
  late RxString proportion = ''.obs;

  sellController.SellController sellControllerInstance = sellController.SellController();

   final RxMap<String, dynamic> totalAssets = RxMap<String, dynamic>({
    'CallRate': 0,
    'CreditInterest': 14208853.5408,
    'ExecuteRate': 0,
    'LoanLimit': 0,
    'PP': 96083449453,
    'advancedAmt': 0,
    'avlAdvance': 0,
    'avlDrawDown': 0,
    'balance': 96098258306.5408,
    'buyAmt': 0,
    'buyFeeAmt': 0,
    'buyRemainAmt': 0,
    'careceiving': 600000,
    'cash': 96083449453,
    'cidepofeeacr': 11555604.84,
    'depofeeamt': 0,
    'inPayTotal': 0,
    'loanAmt': 0,
    'marginRate': 0,
    'nav': 961111174051.7008,
    'receivingT0': 0,
    'receivingT1': 0,
    'receivingT2': 0,
    'sellFeeAmt': 0,
    'sellTaxAmt': 0,
    'stockAmt': 865024471350,
    'totalLoan': 11555604.84,
  });

  final RxList<Map<String, dynamic>> comboData = RxList<Map<String, dynamic>>([
    {
      "accountID": "0006000072",
      "basicPrice": 30000,
      "basicPriceAmt": 900000,
      "blocked": 0,
      "costPrice": 29016,
      "costPriceAmt": 870480,
      "pnlAmt": 29520,
      "pnlRate": 3.39,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "A32",
      "total": 30,
      "trade": 30,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 3800,
      "basicPriceAmt": 3800000,
      "blocked": 0,
      "costPrice": 14283,
      "costPriceAmt": 14283000,
      "pnlAmt": -10483000,
      "pnlRate": -73.39,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "AAV",
      "total": 1000,
      "trade": 1000,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 4500,
      "basicPriceAmt": 9000,
      "blocked": 0,
      "costPrice": 5113,
      "costPriceAmt": 10226,
      "pnlAmt": -1226,
      "pnlRate": -11.99,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "APP",
      "total": 2,
      "trade": 2,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 9110,
      "basicPriceAmt": 3996557000,
      "blocked": 0,
      "costPrice": 9018,
      "costPriceAmt": 3956196600,
      "pnlAmt": 40360400,
      "pnlRate": 1.02,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "ASM",
      "total": 438700,
      "trade": 438700,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 9000,
      "basicPriceAmt": 900000,
      "blocked": 0,
      "costPrice": 9347,
      "costPriceAmt": 934700,
      "pnlAmt": -34700,
      "pnlRate": -3.71,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "BBT",
      "total": 100,
      "trade": 100,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 11800,
      "basicPriceAmt": 908600,
      "blocked": 0,
      "costPrice": 22055,
      "costPriceAmt": 1698235,
      "pnlAmt": -789635,
      "pnlRate": -46.5,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "BCC",
      "total": 77,
      "trade": 77,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 13000,
      "basicPriceAmt": 19500000,
      "blocked": 0,
      "costPrice": 12024,
      "costPriceAmt": 18036000,
      "pnlAmt": 1464000,
      "pnlRate": 8.12,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "BSC",
      "total": 1500,
      "trade": 1500,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 10700,
      "basicPriceAmt": 823900,
      "blocked": 0,
      "costPrice": 10020,
      "costPriceAmt": 771540,
      "pnlAmt": 52360,
      "pnlRate": 6.79,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "C4G",
      "total": 77,
      "trade": 77,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 21700,
      "basicPriceAmt": 337595580000,
      "blocked": 0,
      "costPrice": 21659,
      "costPriceAmt": 336957726600,
      "pnlAmt": 637853400,
      "pnlRate": 0.19,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "CEO",
      "total": 15557400,
      "trade": 15557400,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 2270,
      "basicPriceAmt": 227000,
      "blocked": 0,
      "costPrice": 3008,
      "costPriceAmt": 300800,
      "pnlAmt": -73800,
      "pnlRate": -24.53,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "CMBB1901",
      "total": 100,
      "trade": 100,
      "vsdMortgage": 0
    },
    {
      "accountID": "0006000072",
      "basicPrice": 1800,
      "basicPriceAmt": 360000,
      "blocked": 0,
      "costPrice": 1867,
      "costPriceAmt": 373400,
      "pnlAmt": -13400,
      "pnlRate": -3.59,
      "receivingRight": 0,
      "receivingT0": 0,
      "receivingT1": 0,
      "receivingT2": 0,
      "remainQtty": 0,
      "sendingT0": 0,
      "sendingT1": 0,
      "sendingT2": 0,
      "symbol": "CTC",
      "total": 200,
      "trade": 200,
      "vsdMortgage": 0
    }
  ]);

  void onInit(){
    selectedValue.value =combo_items[0];
  }
  void putselectedValue(String selected) async {
    selectedValue.value = selected;
    sellControllerInstance.getselectedValue(selectedValue.value);

  }


  void setProportion(int bpa, int sa) async {
    double result = (bpa / sa) * 100;
    proportion.value = result.toStringAsFixed(1);
  }
  void setTotal() async{
    // nvl((SUM( BASICPRICEAMT) - SUM(COSTPRICEAMT))

    // nvl((SUM( BASICPRICEAMT) - SUM(COSTPRICEAMT))/SUM(COSTPRICEAMT,0)
  }
}
// final Map<String, dynamic> totalAssets = {
//   'CallRate': 0,
//   'CreditInterest': 14208853.5408,
//   'ExecuteRate': 0,
//   'LoanLimit': 0,
//   'PP': 96083449453,
//   'advancedAmt': 0,
//   'avlAdvance': 0,
//   'avlDrawDown': 0,
//   'balance': 96098258306.5408,
//   'buyAmt': 0,
//   'buyFeeAmt': 0,
//   'buyRemainAmt': 0,
//   'careceiving': 600000,
//   'cash': 96083449453,
//   'cidepofeeacr': 11555604.84,
//   'depofeeamt': 0,
//   'inPayTotal': 0,
//   'loanAmt': 0,
//   'marginRate': 0,
//   'nav': 961111174051.7008,
//   'receivingT0': 0,
//   'receivingT1': 0,
//   'receivingT2': 0,
//   'sellFeeAmt': 0,
//   'sellTaxAmt': 0,
//   'stockAmt': 865024471350,
//   'totalLoan': 11555604.84,
// };
//
// final List<Map<String, dynamic>> comboData = [
//   {
//     "accountID": "0006000072",
//     "basicPrice": 30000,
//     "basicPriceAmt": 900000,
//     "blocked": 0,
//     "costPrice": 29016,
//     "costPriceAmt": 870480,
//     "pnlAmt": 29520,
//     "pnlRate": 3.39,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "A32",
//     "total": 30,
//     "trade": 30,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 3800,
//     "basicPriceAmt": 3800000,
//     "blocked": 0,
//     "costPrice": 14283,
//     "costPriceAmt": 14283000,
//     "pnlAmt": -10483000,
//     "pnlRate": -73.39,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "AAV",
//     "total": 1000,
//     "trade": 1000,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 4500,
//     "basicPriceAmt": 9000,
//     "blocked": 0,
//     "costPrice": 5113,
//     "costPriceAmt": 10226,
//     "pnlAmt": -1226,
//     "pnlRate": -11.99,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "APP",
//     "total": 2,
//     "trade": 2,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 9110,
//     "basicPriceAmt": 3996557000,
//     "blocked": 0,
//     "costPrice": 9018,
//     "costPriceAmt": 3956196600,
//     "pnlAmt": 40360400,
//     "pnlRate": 1.02,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "ASM",
//     "total": 438700,
//     "trade": 438700,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 9000,
//     "basicPriceAmt": 900000,
//     "blocked": 0,
//     "costPrice": 9347,
//     "costPriceAmt": 934700,
//     "pnlAmt": -34700,
//     "pnlRate": -3.71,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "BBT",
//     "total": 100,
//     "trade": 100,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 11800,
//     "basicPriceAmt": 908600,
//     "blocked": 0,
//     "costPrice": 22055,
//     "costPriceAmt": 1698235,
//     "pnlAmt": -789635,
//     "pnlRate": -46.5,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "BCC",
//     "total": 77,
//     "trade": 77,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 13000,
//     "basicPriceAmt": 19500000,
//     "blocked": 0,
//     "costPrice": 12024,
//     "costPriceAmt": 18036000,
//     "pnlAmt": 1464000,
//     "pnlRate": 8.12,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "BSC",
//     "total": 1500,
//     "trade": 1500,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 10700,
//     "basicPriceAmt": 823900,
//     "blocked": 0,
//     "costPrice": 10020,
//     "costPriceAmt": 771540,
//     "pnlAmt": 52360,
//     "pnlRate": 6.79,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "C4G",
//     "total": 77,
//     "trade": 77,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 21700,
//     "basicPriceAmt": 337595580000,
//     "blocked": 0,
//     "costPrice": 21659,
//     "costPriceAmt": 336957726600,
//     "pnlAmt": 637853400,
//     "pnlRate": 0.19,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "CEO",
//     "total": 15557400,
//     "trade": 15557400,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 2270,
//     "basicPriceAmt": 227000,
//     "blocked": 0,
//     "costPrice": 3008,
//     "costPriceAmt": 300800,
//     "pnlAmt": -73800,
//     "pnlRate": -24.53,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "CMBB1901",
//     "total": 100,
//     "trade": 100,
//     "vsdMortgage": 0
//   },
//   {
//     "accountID": "0006000072",
//     "basicPrice": 1800,
//     "basicPriceAmt": 360000,
//     "blocked": 0,
//     "costPrice": 1867,
//     "costPriceAmt": 373400,
//     "pnlAmt": -13400,
//     "pnlRate": -3.59,
//     "receivingRight": 0,
//     "receivingT0": 0,
//     "receivingT1": 0,
//     "receivingT2": 0,
//     "remainQtty": 0,
//     "sendingT0": 0,
//     "sendingT1": 0,
//     "sendingT2": 0,
//     "symbol": "CTC",
//     "total": 200,
//     "trade": 200,
//     "vsdMortgage": 0
//   }
// ];