class Singleton {
  static final Singleton _singleton = Singleton._internal();
  static const bool isDev = true;

  factory Singleton() {
    return _singleton;
  }

  Singleton._internal();
}
