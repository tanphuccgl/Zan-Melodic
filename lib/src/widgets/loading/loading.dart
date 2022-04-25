import 'package:bot_toast/bot_toast.dart';

class XLoading {
  static CancelFunc? cancel;

  static show() {
    if (cancel != null) {
      cancel = null;
    }

    cancel ??= BotToast.showLoading();
  }

  static hide() {
    if (cancel != null) {
      cancel!();
    }
  }
}
