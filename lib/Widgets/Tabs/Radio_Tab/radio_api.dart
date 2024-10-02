import 'package:islamic_app_route/Models/radio_model/radio.dart';
import 'package:islamic_app_route/Models/radio_model/radio_model.dart';
import 'package:islamic_app_route/Shared/network/remote/api/api_consumer.dart';
import 'package:islamic_app_route/Shared/network/remote/api/http_consumer.dart';

import '../../../Shared/network/remote/api/end_point.dart';

class RadioApi {
  ApiConsumer apiConsumer = HttpConsumer();

  Future<List<Radio>> getRadio({String language = 'ar'}) async {
    final Uri url = Uri.http(EndPoint.baseUrl, EndPoint.radio, {
      ApiKey.language: language,
    });
    final response = await apiConsumer.get(url);
    RadioModel radioModel = RadioModel.fromMap(response);
    if (radioModel.radios != null) {
      return radioModel.radios!;
    } else {
      throw Exception('Failed to get Popular Movies');
    }
  }
}
