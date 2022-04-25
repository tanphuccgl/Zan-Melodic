import 'package:bot_toast/bot_toast.dart';

class XSnackbar {
  static show({required String msg}) => BotToast.showText(text: msg);
}
