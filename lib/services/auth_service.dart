import 'dart:convert';

import 'package:bank_sha/shared/shared_values.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class AuthService {
  Future<bool> checkEmail(String email) async {
    try {
      final res = await http.post(
          Uri.parse(
            '$baseUrl/is-email-exist',
          ),
          body: {
            'email': email,
          });

      if (res.statusCode == 200) {
        return jsonDecode(res.body)['is_email_exist'];
        print(res.body);
      } else {
        return jsonDecode(res.body)['errors'];
        print(res.body);
      }
    } catch (e) {
      rethrow;
    }
  }
}
