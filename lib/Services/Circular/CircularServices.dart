import 'package:http/http.dart' as http;
import 'package:schoolman/contant/constant.dart';

class CircularServices {
  Future<dynamic> circular(
    String token,
  ) async {
    try {
      print(' $token');
      // print(emailId);

      // var basicAuth = await authHeader();
      var url = Uri.parse('${Constants.baseUrl}/${Constants.circular}');
      var response = await http.get(
        url,
        headers: <String, String>{
          'authorization': token,
          // 'Accept-Language': Constants.acceptedLanguage,
          // 'platform': Platform.operatingSystem,
          // 'version': deviceVersion,
          // 'device-id': deviceId
        },
        // body: {
        //   'email': emailId,
        //   'password': password,
        // }
      );
      print(response.body);
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }

  Future<dynamic> circularDetail(String token, String id) async {
    try {
      print(' $token');
      // print(emailId);

      // var basicAuth = await authHeader();
      var url =
          Uri.parse('${Constants.baseUrl}/${Constants.circularDetail}/$id');
      var response = await http.get(
        url,
        headers: <String, String>{
          'authorization': token,
          // 'Accept-Language': Constants.acceptedLanguage,
          // 'platform': Platform.operatingSystem,
          // 'version': deviceVersion,
          // 'device-id': deviceId
        },
        // body: {
        //   'email': emailId,
        //   'password': password,
        // }
      );
      print(response.body);
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }
}
