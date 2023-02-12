class GlobalState {
  static final GlobalState _singleton = GlobalState._internal();

  factory GlobalState() {
    return _singleton;
  }

  GlobalState._internal();

  static String? token;
  static String? email;
}
