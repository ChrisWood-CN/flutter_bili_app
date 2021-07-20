import 'package:shared_preferences/shared_preferences.dart';

class MiCache {
  SharedPreferences? prefs;

  MiCache._() {
    initPrefs();
  }

  initPrefs() async {
    if (prefs == null) {
      prefs = await SharedPreferences.getInstance();
    }
  }

  static MiCache? _instance;

  static MiCache getInstance() {
    if (_instance == null) {
      _instance = MiCache._();
    }
    return _instance!;
  }

  MiCache._pre(prefs) {
    this.prefs = prefs;
  }

  static Future<MiCache> preInit() async {
    if (_instance == null) {
      var temp = await SharedPreferences.getInstance();
      _instance = MiCache._pre(temp);
    }
    return _instance!;
  }

  setString(String key, String value) {
    prefs?.setString(key, value);
  }

  setDouble(String key, double value) {
    prefs?.setDouble(key, value);
  }

  setInt(String key, int value) {
    prefs?.setInt(key, value);
  }

  setBool(String key, bool value) {
    prefs?.setBool(key, value);
  }

  setStringList(String key, List<String> value) {
    prefs?.setStringList(key, value);
  }

  remove(String key) {
    prefs?.remove(key);
  }

  T? get<T>(String key) {
    var result = prefs?.get(key);
    if (result != null) {
      return result as T;
    }
    return null;
  }
}
