import 'dart:io';
import 'package:path/path.dart' as path;

import 'display_demo.dart';

void main() async {
  String dataPath = path.join(Directory.current.path, 'lib');
  List<DisplayDemo> displayDemoList = [];

  Directory dataDir = Directory(dataPath);
  await parserDir(dataDir, displayDemoList);

  String genPath = path.join(Directory.current.path, 'lib/code');
  Directory genDir = Directory(genPath);
  if (genDir.existsSync()) {
    await genDir.delete(recursive: true);
  }
  await genDir.create();
  for (DisplayDemo e in displayDemoList) {
    File codeFile = File(path.join(genPath, path.basename(e.name)));
    await codeFile.writeAsString(e.getCode);
  }
}

Future<void> parserDir(Directory dir, List<DisplayDemo> displayDemoList) async {
  List<FileSystemEntity> entity = dir.listSync();
  for (FileSystemEntity e in entity) {
    if (e is File && e.path.contains('demo_')) {
      File file = File(e.path);
      String content = await file.readAsString();
      displayDemoList.add(DisplayDemo(
        filePath: e.path,
        code: content,
        name: e.path.split('/').last.replaceAll('dart', 'txt'),
      ));
    } else if (e is Directory) {
      if (e.path.contains('demo')) {
        await parserDir(e, displayDemoList);
      }
    }
  }
}
