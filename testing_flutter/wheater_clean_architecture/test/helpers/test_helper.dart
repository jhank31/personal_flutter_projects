import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:wheater_clean_architecture/domain/repositories/weather_repository.dart';
@GenerateMocks(
  [WeatherRepository],
  customMocks: [MockSpec<http.Client>(as: #MockHttpClient)]
)
void main() {}
