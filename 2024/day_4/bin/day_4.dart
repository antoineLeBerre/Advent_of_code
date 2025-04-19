import 'dart:io';
import 'package:day_4/day_4.dart' as day_4;
import 'package:path/path.dart' as path;

void main(List<String> arguments) async {
  try {
    final currentDir = Directory.current.path;
    final filePath = path.join(currentDir, 'file', 'puzzle.txt');
    final file = File(filePath);

    // OU lecture asynchrone (recommandée)
    List<String> contenuAsync = await file.readAsLines();

    print('Response part 1: ${day_4.partOne(contenuAsync)}!');
    print('Response part 2: ${day_4.partTwo(contenuAsync)}!');
  } catch (e) {
    print('Erreur lors de la lecture du fichier: $e');
  }
}