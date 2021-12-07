import 'package:amar_karigor/app/global/config/api.dart';
import 'package:http/http.dart' as http;
/*
    @author: Nazrul Chowdhury
    @date: 06 December 2021

    |----------------------------------------------------------|
    | Using http library for API calling instead of GetConnect |
    |----------------------------------------------------------|
    
    * GetConnect (get,post) methods are not working properly in Flutter Web.
    * Getting response as null instad of actual response. 
    * Same codebase work well on the Android device.

 */

class HomeProvider {
  Future<http.Response> homePageData(String token, String phone) async {
    String url = '${Api.base_url}${Api.home_data_url}';

    http.Response response = await http.post(
          Uri.parse(url),
          headers: {"Authorization": token},
          body: {"phone":phone}
        
        );

    return response;
  }

  Future<http.Response> login(Map<String, dynamic> user) async {
    print(user);
    String url = '${Api.base_url}${Api.login_url}';
    http.Response response = await http.post(Uri.parse(url), body: user);

    return response;
  }
}
