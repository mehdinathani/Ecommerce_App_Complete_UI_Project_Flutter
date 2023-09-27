import 'package:fluttertoast/fluttertoast.dart';
import 'package:uimehdinathani/styles/colors.dart';

class CustomToast {
  static void showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: AppColors.appBackgroundColor,
      textColor: AppColors.whiteText,
      fontSize: 16.0,
    );
  }
}
