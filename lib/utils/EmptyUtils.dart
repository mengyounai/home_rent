class EmptyUtils {
  //空返回true
  static bool isNotEmpty(String? str) {
    return str != null && str.isNotEmpty;
  }

  static bool isEmpty(String? str) {
    return !isNotEmpty(str);
  }
}
