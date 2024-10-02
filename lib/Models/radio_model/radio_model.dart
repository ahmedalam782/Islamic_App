import 'package:islamic_app_route/Models/radio_model/radio.dart';

class RadioModel {
  List<Radio>? radios;

  RadioModel({required this.radios});

  factory RadioModel.fromMap(Map<String, dynamic> data) => RadioModel(
        radios: data['radios'] == null
            ? null
            : (data['radios'] as List<dynamic>)
                .map((e) => Radio.fromMap(e as Map<String, dynamic>))
                .toList(),
      );
}
