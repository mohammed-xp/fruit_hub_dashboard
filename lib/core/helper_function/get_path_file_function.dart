import 'dart:io';
import 'package:path/path.dart' as p;

String getPathFile(File file, String path) {
  String fileName = p.basename(file.path);
  String fileExtension = p.extension(file.path);

  var pathFile = '$path/$fileName.$fileExtension';

  return pathFile;
}
