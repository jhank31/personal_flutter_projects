
import 'dart:io';

String readJson(String path) {
  var directory = Directory.current.path;
  if(directory.endsWith('/test')){
    directory = directory.replaceAll('/test', '');
  }
  return File('$directory/test/$path').readAsStringSync( );
}