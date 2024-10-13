import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'colors.dart';

navigateToAndReplace(context, direction){
  Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (context) => direction
      )
  );
}
navigateTo(context, direction){
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => direction
      )
  );
}

Widget defaultTextField({
  String? label='',
  String? hint,
  required var controller,
  IconData? prefix,
  var inputType,
  bool? isPassword = false,
  IconData? suffix,
  var suffixFunction,
  var validFunction,
  var submitFunction,
  var inputAction
})
=> TextFormField(
  controller: controller,
  keyboardType: inputType,
  obscureText: isPassword!,
  validator: validFunction,
  onFieldSubmitted: submitFunction,
  textInputAction: inputAction,
  /*style: TextStyle(
      fontSize: 18,
    ),*/
  decoration: InputDecoration(
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey,
        width: 1.5,
      ), // Color when not focused
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: defaultColor, width: 2.0
        ), // Color when focused
      ),
    border: const OutlineInputBorder(),
    label: Text(
        '$label'
    ),
    hintText: hint,
    prefixIcon: Icon(
      prefix,
      // size: 27,
    ),
    suffixIcon: IconButton(
        onPressed: suffixFunction,
        icon: Icon(
          suffix,

        )
    ),
  ),
);

Widget defaultButton({
  required String text,
  required var pressFunction,
  double? height,
  double? width,
  double fontSize = 17,
  Color color = defaultColor,
  Color textColor = Colors.white,
  FontWeight? weight,
})=> Container(
  height: height,
  width: width,
  color: color,
  child: MaterialButton(padding: EdgeInsets.zero,
    onPressed: pressFunction,
    child: Text(
      '$text',
      style: TextStyle(
        color: textColor,
        fontSize: fontSize,
        fontWeight: weight,
      ),
    ),
  ),
);

Future<bool?> toastMessage({
  required String message,
  Toast length=Toast.LENGTH_LONG,
  ToastGravity tGravity=ToastGravity.BOTTOM,
  int iosWebtime = 1,
  required Color color,
  Color textColor = Colors.white,
  double fontSize = 16.0,
})=>Fluttertoast.showToast(
  msg: message,
  toastLength: length,
  gravity: tGravity,
  timeInSecForIosWeb: iosWebtime,
  backgroundColor: color,
  textColor: textColor,
  fontSize: fontSize,
);