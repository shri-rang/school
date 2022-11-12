import 'package:schoolman/contant/constant.dart';

import 'package:http/http.dart' as http;

class LoginService {
  Future<dynamic> loginUser(
    emailId,
    password,
  ) async {
    try {
      print('loginUser');
      print(emailId);
      // var basicAuth = await authHeader();
      var url = Uri.parse('${Constants.baseUrl}${Constants.login}');
      var response = await http.post(url,
          //  headers:
          // <String, String>{
          //   // 'authorization': basicAuth,
          //   'Accept-Language': Constants.acceptedLanguage,
          //   'platform': Platform.operatingSystem,
          //   'version': deviceVersion,
          //   'device-id': deviceId
          // },
          body: {
            'email': emailId,
            'password': password,
          });
      print(response);
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }

  Future<dynamic> schoolInfo() async {
    try {
      print('loginUser');
      // print(emailId);

      // var basicAuth = await authHeader();
      var url = Uri.parse('${Constants.baseUrl}${Constants.school_config}');
      var response = await http.get(
        url,
        //  headers:
        // <String, String>{
        //   // 'authorization': basicAuth,
        //   'Accept-Language': Constants.acceptedLanguage,
        //   'platform': Platform.operatingSystem,
        //   'version': deviceVersion,
        //   'device-id': deviceId
        // },
        // body: {
        //   'email': emailId,
        //   'password': password,
        // }
      );
      print(response);
      return response;
    } catch (e) {
      print('=======This is exception=========');
      print(e);
      return ' ';
    }
  }
  
}
