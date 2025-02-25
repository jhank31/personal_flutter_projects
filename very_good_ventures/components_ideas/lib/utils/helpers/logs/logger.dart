import 'package:talker/talker.dart';

class Logger {
  const Logger({
    String? tag,
  }) : _tag = tag;

  static final Talker _talker = Talker();

  static Talker get instanciaTalker => _talker;

  /// tag para identificar el origen de log
  final String? _tag;

  /// metodo para registrar logs de tipo [info]
  void info(String message) {
    final tagMessage = _tag != null ? '[$_tag] : ' : '';
    _talker.info('$tagMessage$message');
  }

  /// metodo para registrar logs de tipo [warning]
  void warning(String message) {
    final tagMessage = _tag != null ? '[$_tag] : ' : '';
    _talker.warning('$tagMessage$message');
  }

  /// metodo para registrar logs de tipo [error]
  void error(String message) {
    final tagMessage = _tag != null ? '[$_tag] : ' : '';
    _talker.error('$tagMessage$message');
  }

  /// metodo para registrar logs de tipo [debug]
  void debug(String message) {
    final tagMessage = _tag != null ? '[$_tag] : ' : '';
    _talker.debug('$tagMessage$message');
  }

  /// metodo para registrar logs de tipo [critical]
  void critical(String message) {
    final tagMessage = _tag != null ? '[$_tag] : ' : '';
    _talker.critical('$tagMessage$message');
  }

  /// metodo para manejar excepciones y registrar logs de tipo [error]
  void hanldeException(
    Object exception,
    StackTrace stackTrace, [
    String? message,
  ]) {
    final tagMessage = _tag != null ? '[$_tag] : ' : '';
    _talker.handle(exception, stackTrace, '$tagMessage$message');
  }
}
