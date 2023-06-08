import 'dart:io';
import 'package:mason/mason.dart';

void run(HookContext context) async {
  final progess = context.logger.progress("Installing Packages");

  await Process.run(
    'flutter',
    ['pub', 'add', 'rxdart'],
    runInShell: true,
  );

  await Process.run(
    'flutter',
    ['pub', 'get'],
    runInShell: true,
  );

  progess.complete();
}
