import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {
  // 工厂模式
  factory SharedPreferenceManager() => _instance;

  static final SharedPreferenceManager _instance = SharedPreferenceManager._internal();

  static SharedPreferenceManager get instance => _instance;

  late SharedPreferences prefs;

  SharedPreferenceManager._internal() {
    // 初始化
    _init();
  }


  void _init() {
    SharedPreferences.getInstance().then((data) {
      prefs = data;
    });
  }

  Future<SharedPreferences> getSP() async {
    return prefs ??= await SharedPreferences.getInstance();
  }
}
