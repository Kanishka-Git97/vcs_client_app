import 'dart:convert';
import 'dart:typed_data';

class ImageUtility {
  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

  static String convertorHelper(String base64) {
    String _stringImg = base64;
    int mod = _stringImg.length % 4;
    if (mod != 0) {
      int padding = 4 - mod;
      String paddingString = "".padRight(padding, '=');
      _stringImg += paddingString;
      return _stringImg;
    }
    return _stringImg;
  }
}
