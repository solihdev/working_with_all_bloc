import 'package:dio/dio.dart';
import 'package:work_with_all_blocks/data/models/card_model/card_model.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';
import 'api_client.dart';

class ApiService extends ApiClient {
  Future<MyResponse> getCardsData() async {
    MyResponse myResponse = MyResponse(error: "");
    try {
      Response response = await dio.get("${dio.options.baseUrl}/user_cards");
      if (response.statusCode == 200) {
        myResponse.data = (response.data as List?)
                ?.map((e) => CardDate.fromJson(e))
                .toList() ??
            [];
      }
    } catch (err) {
      myResponse.error = err.toString();
    }
    return myResponse;
  }
}
