import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:http/http.dart' as http;
/*
    @author: Nazrul Chowdhury
    @date: 26 July 2022

    |----------------------------------------------------------|
    | Using http library for API calling instead of GetConnect |
    |----------------------------------------------------------|

    * GetConnect (get,post) methods are not working properly in Flutter Web.
    * Getting response as null instead of actual response.
    * Same codebase work well on the Android device.

 */

class NotificationsProvider {
  Future<http.Response> notifications() async {

    http.Response response = await http.post(Uri.parse('${Api.base_url}${Api.notifications_url}'),
        headers: {"Authorization": LocalData.user!.token},
        body: {"uid": LocalData.user!.uid});
    print(response.body);

    return response;
  }


}
