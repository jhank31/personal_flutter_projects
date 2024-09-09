import 'package:dartz/dartz.dart';
import 'package:wheater_clean_architecture/core/error/failure.dart';
import 'package:wheater_clean_architecture/domain/entities/weather_entity.dart';

abstract class WeatherRepository {
  Future<Either<Failure,WeatherEntity>> getCurrentWeather(String cityName);
}
