import 'package:amar_karigor/app/global/config/api.dart';
import 'package:amar_karigor/app/global/util/local_data.dart';
import 'package:http/http.dart' as http;
/*
    @author: Nazrul Chowdhury
    @date: 28 July 2022

    |----------------------------------------------------------|
    | Using http library for API calling instead of GetConnect |
    |----------------------------------------------------------|

    * GetConnect (get,post) methods are not working properly in Flutter Web.
    * Getting response as null instead of actual response.
    * Same codebase work well on the Android device.

 */

class FeedBackProvider {


  Future<http.Response> writeFeedback(String feedback) async {
    String url = '${Api.base_url}${Api.write_feedback_url}';
    http.Response response = await http.post(Uri.parse(url),
        headers: {"Authorization": LocalData.user!.token},
        body: {"uid": LocalData.user!.uid,"feedback":feedback});

    print(response.body);

    return response;
  }


}
