import 'package:components_ideas/utils/helpers/logs/logger.dart';

class LoggerFactory {
  Logger createLogger(String tag) {
    return Logger(tag: tag);
  }
}
