import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:wheater_clean_architecture/data/models/weather_model.dart';
import 'package:wheater_clean_architecture/domain/entities/weather_entity.dart';

import '../../helpers/dummy_data/json_reader.dart';

const testWeatherModel = WeatherModel(
  cityname: 'London',
  main: 'Clouds',
  description: 'scattered clouds',
  iconCode: '03d',
  temperature: 280.32,
  pressure: 1012,
  humidity: 81,
);

void main() {
  test('should be a class of weather entity', () {
    //* validamos que la instancia de WeatherModel sea de tipo WeatherEntity
    expect(testWeatherModel, isA<WeatherEntity>());
  });

  test('should return a valid model from json', () async {
  //* se lee el archivo jaison de prueba que se supone que debe retornar la api
    final Map<String, dynamic> jsonMap =
        json.decode(readJson('helpers/dummy_data/dummy_weather_test.json'));
  });

  //* se crea una instancia de WeatherModel a partir del json
    final result = WeatherModel.fromJson(jsonMap);
    //* se valida que la instancia sea de tipo WeatherModel
    expect(result, isA<WeatherModel>());
    //* se valida que la instancia sea de tipo WeatherEntity
    expect(result, isA<WeatherEntity>());
    //* se valida que la instancia sea igual a la instancia de prueba
    expect(result, testWeatherModel);
}
