import 'package:shared_preferences/shared_preferences.dart';

enum StoreKeys {
  token,
  city,
}

class Store {
  static StoreKeys? storeKeys;
  final SharedPreferences _store;
  static Future<Store> getInstance() async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return Store._internal(_prefs);
  }

  Store._internal(this._store);
  getString(StoreKeys key) async {
    return _store.get(key.toString());
  }

  setString(StoreKeys key, String value) async {
    return _store.setString(key.toString(), value);
  }

  getStringList(StoreKeys key) async {
    return _store.getStringList(key.toString());
  }

  setStringList(StoreKeys key, List<String> vaules) async {
    return _store.setStringList(key.toString(), vaules);
  }
}
