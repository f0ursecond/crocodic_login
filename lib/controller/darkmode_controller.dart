import 'package:get/get.dart';

class ChangeTheme extends GetxController {
  var isDark = false.obs;

  isDarkTheme() => isDark.value = !isDark.value;
}
