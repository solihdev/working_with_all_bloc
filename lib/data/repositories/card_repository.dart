import 'package:work_with_all_blocks/data/api_service/api_service.dart';
import 'package:work_with_all_blocks/data/models/my_response/my_response.dart';

class CardRepo {
  CardRepo({required this.apiService});

  final ApiService apiService;

  Future<MyResponse> getAllCards() => apiService.getCardsData();
}