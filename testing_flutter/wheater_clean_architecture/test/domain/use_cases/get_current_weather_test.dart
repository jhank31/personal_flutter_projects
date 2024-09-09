import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:wheater_clean_architecture/domain/entities/weather_entity.dart';
import 'package:wheater_clean_architecture/domain/usecases/get_current_weather.dart';
import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetCurrentWeatherUseCase getCurrentWeatherUseCase;
  late MockWeatherRepository mockWeatherRepository;
  setUp(() {
    mockWeatherRepository = MockWeatherRepository();
    getCurrentWeatherUseCase = GetCurrentWeatherUseCase(mockWeatherRepository);
  });

  const testWeatherDetail = WeatherEntity(
    cityname: 'New York',
    main: 'Clouds',
    description: 'scattered clouds',
    iconCode: '02d',
    temperature: 20.0,
    pressure: 1010,
    humidity: 70,
  );

  const testCityName = 'New York';

  test('Should get current wrather detail from the repositorty', () async {
    //* se genera el caso de prueba, en este caso se simula la respuesta del repositorio, que es un objeto de tipo WeatherEntity
    when(mockWeatherRepository.getCurrentWeather(testCityName))
        .thenAnswer((_) async => const Right(testWeatherDetail));
    //* se ejecuta el caso de prueba
    final result = await getCurrentWeatherUseCase.execute(testCityName);
    //* se evalua el resultado
    expect(result, const Right(testWeatherDetail));
    // verify(mockWeatherRepository.getCurrentWeather(testCityName));
    // verifyNoMoreInteractions(mockWeatherRepository);
  });
}
