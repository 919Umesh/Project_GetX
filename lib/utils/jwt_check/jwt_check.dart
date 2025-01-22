import 'package:jwt_decoder/jwt_decoder.dart';

Future<bool> isTokenExpired(String token) async {
  if (JwtDecoder.isExpired(token)) {
    return true;
  }
  return false;
}
