import 'dart:io';

class Environment {
  static String apiUrl = Platform.isAndroid
      ? 'http://10.10.0.67:3000/api'
      : 'http://localhost:3000/api';

  static String socketUrl = Platform.isAndroid
      ? 'http://10.10.0.67:3000'
      : 'http://localhost:3000';
}
