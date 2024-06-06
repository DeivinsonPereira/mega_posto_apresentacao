import 'dart:convert';

abstract class Auth {
  static String username = 'admin';
  static String password = 'admin';
  static String basicAuth = 'Basic ${base64Encode(utf8.encode('$username:$password'))}';
  
  static Map<String, String> header = {
    'authorization': basicAuth
  };
}
