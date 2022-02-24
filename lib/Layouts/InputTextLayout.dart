import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:groceryboouser/Screens/Location/controller/AddressController.dart';
import 'package:groceryboouser/Styles/my_colors.dart';
import 'package:groceryboouser/Utilities/Constant.dart';


class InputTextLayout extends StatefulWidget {

  final String hintData;
  TextEditingController inputData;
  bool numKeypad = false;
  // Function validator;

  InputTextLayout(this.hintData,this.inputData,this.numKeypad);

  @override
  _TextInputState createState() => _TextInputState(hintData,inputData,numKeypad);

}

class _TextInputState extends State<InputTextLayout> {

  AddressController controller = Get.put(AddressController());
  bool checkColor = false;
  bool checkFillColor = true;
  // Function validator;

  String hint = " ";
  TextEditingController inputData ;
  bool numKeypad = false;

  _TextInputState(String hintData,TextEditingController inputData,bool numKeypad){
    this.hint = hintData;
    this.inputData = inputData;
    this.numKeypad = numKeypad;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: grey_e9ecec,
        ),
        borderRadius: BorderRadius.all(Radius.circular(8)),
        color: checkFillColor == false
            ? checkColor == true
            ? Colors.white
            : grey_e9ecec
            : gray_f5f8f8,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
        ),
        child: TextFormField(
          keyboardType: numKeypad==false ? TextInputType.text : TextInputType.number ,
          inputFormatters: [
            numKeypad== true ? FilteringTextInputFormatter.digitsOnly : FilteringTextInputFormatter.singleLineFormatter ,
            numKeypad== true ? LengthLimitingTextInputFormatter(10) : LengthLimitingTextInputFormatter(200),
          ],
          decoration: InputDecoration(
            // you can change this with the top text like you want
            labelText: hint,
            labelStyle: TextStyle(color: Colors.grey,fontSize: 14),
            hintStyle: TextStyle(
                color: black, fontFamily: sf_pro_display_semibold,fontSize: 14),
            border: InputBorder.none,
            filled: false,
          ),
          autovalidateMode: AutovalidateMode.onUserInteraction,
          // validator: (value) => validator(value),
          textInputAction: TextInputAction.next,
          controller: inputData,
          onEditingComplete: (){
            FocusScope.of(context).unfocus();
            FocusScope.of(context).nextFocus();
          },
          onChanged: (inputValue) {
            if (inputValue.isNotEmpty) {
              setState(() {
                checkFillColor = false;
                checkColor = true;
              });
            }
            else {
              setState(() {
                checkFillColor = true;
              });
            }
          },
          onFieldSubmitted : (String value) {
            if(value.isNotEmpty){
              setState(() {
                checkFillColor = false;
                checkColor = false;
              });
            }
            else{
              setState(() {
                checkFillColor = true;
              });
            }
          },

        ),
      ),
    );

  }

}

myFunc(Function myVal){
  return TextFormField(
    validator: (v) => myVal(v),
  );

}