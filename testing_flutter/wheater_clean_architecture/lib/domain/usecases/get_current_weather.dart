import 'package:dartz/dartz.dart';
import 'package:wheater_clean_architecture/core/error/failure.dart';
import 'package:wheater_clean_architecture/domain/entities/weather_entity.dart';
import 'package:wheater_clean_architecture/domain/repositories/weather_repository.dart';

class GetCurrentWeatherUseCase {
  final WeatherRepository weatherRepository;
  const GetCurrentWeatherUseCase(this.weatherRepository);
  Future<Either<Failure, WeatherEntity>> execute(String cityName) {
    return weatherRepository.getCurrentWeather(cityName);
  }
}