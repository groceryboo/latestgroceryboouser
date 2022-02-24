// import 'dart:convert';
// import 'dart:ffi';
// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_paystack/flutter_paystack.dart';
// import 'package:get/get.dart';
// import 'package:groceryboouser/Model/BaseModel.dart';
// import 'package:groceryboouser/Screens/FeedScreen/model/CollectionListModel.dart';
// import 'package:groceryboouser/Screens/Networks/api_endpoint.dart';
// import 'package:groceryboouser/Screens/Networks/api_response.dart';
// import 'package:groceryboouser/Screens/PaymentFlow/Topup/model/TopUpModel.dart';
// import 'package:groceryboouser/Screens/PaymentFlow/Topup/view/TopupSuccessPage.dart';
// import 'package:groceryboouser/Styles/my_strings.dart';
// import 'package:groceryboouser/Utils/common_widget.dart';
// import 'package:http/http.dart' as http;
//
// import '../../../../Model/SigninModel.dart';
// import '../../../../Utils/preference_utils.dart';
// import '../../../../Utils/share_predata.dart';
// import '../../../../Utils/text_utilities.dart';
// import '../../../Networks/token_update_request.dart';
//
// class TopupWalletController extends GetxController {
//   Rx<TextEditingController> amountText = TextEditingController().obs;
//
//   List<CollectionDatum> collectionList = [];
//   SigninModel modelM;
//   TopUpModel topUpModel;
//
//   var token;
//   var userEmail ="";
//
//   PaystackPlugin paystack = PaystackPlugin();
//   static const String PAYSTACK_KEY =
//       "pk_test_c343f7fa48c5e5368ab068b511d9d8aa2977a231";
//
//   @override
//   void onInit() {
//     super.onInit();
//     print("init State");
//   }
//
//   initPrefs() async {
//     var preferences = MySharedPref();
//     modelM = await preferences.getSignInModel(SharePreData.key_SaveSignInModel);
//     token = modelM.data.token;
//     userEmail = modelM.data.email;
//
// // static token for testing
//     // token = testing_token;
//   }
//
//   Future callTopupApi(
//     BuildContext context,
//   ) async {
//     onLoading(context, "Loading..");
//
//     // Calling function for prefs values
//     initPrefs();
//
//     String url = urlBase + topUpWallet;
//
//     final apiReq = Request();
//
//     dynamic body = {
//       'amount': amountText.value.text.toString(),
//     };
//
//     await apiReq.postAPI(url, body, token).then((value) async {
//       Navigator.pop(context); //pop dialog
//
//       // clearning list before getting response
//       collectionList.clear();
//
//       http.StreamedResponse res = value;
//
//       if (res.statusCode == 200) {
//         res.stream.bytesToString().then((value) async {
//           String strData = value;
//           Map<String, dynamic> _mapModel = json.decode(strData);
//           TopUpModel _model = TopUpModel.fromJson(_mapModel);
//
//           printData("Topup API response message", _model.message.toString());
//
//           if (_model.statusCode == 500) {
//             final tokenUpdate = TokenUpdateRequest();
//             await tokenUpdate.updateToken();
//
//             callTopupApi(context);
//           } else if (_model.statusCode == 200) {
//             topUpModel = _model;
//             Navigator.push(context,
//                 MaterialPageRoute(builder: ((context) => TopupSuccessPage())));
//           } else {
//             snackBar(context, topUpModel.message);
//           }
//         });
//       } else {
//         print(res.reasonPhrase);
//       }
//     });
//   }
//
//   //Reference
//
//   String _getReference() {
//     String platform;
//     if (Platform.isIOS) {
//       platform = 'iOS';
//     } else {
//       platform = 'Android';
//     }
//
//     return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
//   }
//
//   //GetUi
//   PaymentCard _getCardUI() {
//     return PaymentCard(number: "", cvc: "", expiryMonth: 0, expiryYear: 0);
//   }
//
//   Future initializePlugin() async {
//     await paystack.initialize(publicKey: PAYSTACK_KEY);
//   }
//
//   //Method Charging card
//   chargeCardAndMakePayment(BuildContext context) async {
//
//     await initPrefs();
//
//     initializePlugin().then((_) async {
//       Charge charge = Charge()
//         ..amount = int.parse(amountText.value.text) * 100
//         ..email = userEmail
//         ..reference = _getReference()
//         ..card = _getCardUI();
//
//       CheckoutResponse response = await paystack.checkout(
//         context,
//         charge: charge,
//         method: CheckoutMethod.card,
//         fullscreen: false,
//         // logo: FlutterLogo(
//         //   size: 24,
//         // ),
//       );
//
//       print("Response $response");
//
//       if (response.status == true) {
//         print("Transaction successful");
//         callTopupApi(context);
//       } else {
//         print("Transaction failed");
//       }
//     });
//   }
// }
