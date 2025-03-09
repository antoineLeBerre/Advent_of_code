import 'dart:io';
import 'package:day_3/day_3.dart' as day_3;
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  try {
    final currentDir = Directory.current.path;
    final filePath = path.join(currentDir, 'file', 'puzzle.txt');
    final file = File(filePath);

    // OU lecture asynchrone (recommandée)
    String contenuAsync = await file.readAsString();

    print('Response part 1: ${day_3.partOne(contenuAsync)}!');
    print('Response part 2: ${day_3.partTwo(contenuAsync)}!');
  } catch (e) {
    print('Erreur lors de la lecture du fichier: $e');
  }
}