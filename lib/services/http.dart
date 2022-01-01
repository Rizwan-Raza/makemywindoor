import 'dart:convert';

import 'package:http/http.dart' as http;

class HttpServices {
  Future<Map<String, dynamic>> sendOTP(String number, String otp) async {
    http.Response response = await http.get(
      Uri.parse(
          "https://www.fast2sms.com/dev/bulkV2?authorization=lrkVeZSPcGziXyUsvHBK9gDOm0nfu8Lx6hobtFTAE3aW4NqJY1UApqYRZoV3KcvE26QmGLCbDzMfTeBl&variables_values=$otp&route=otp&numbers=$number"),
    );
    return (jsonDecode(response.body) as Map<String, dynamic>);
  }
}
