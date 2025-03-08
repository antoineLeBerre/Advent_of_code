import 'package:collection/collection.dart';

(List<int> partOne, List<int> partTwo) split2List(List<String> contenuAsync) {
  List<int> one = [];
  List<int> two = [];

  for(String ligne in contenuAsync){
    final ligneSplit = ligne.split('   ');

    one.add(int.parse(ligneSplit[0].trim()));
    two.add(int.parse(ligneSplit[1].trim()));
  }

  return (one, two);
}

int partOne(List<String> contenuAsync) {
  //Create 2 int list
  var (partOne, partTwo) = split2List(contenuAsync);

  //Sort lists
  partOne.sort();
  partTwo.sort();

  //Loop on list to sum the differnche of each line
  final paires = IterableZip([partOne, partTwo]);
  return paires.fold(0, (somme, paire) {
    return somme + (paire[0] - paire[1]).abs();
  });
}

int partTwo(List<String> contenuAsync) {
  var result = 0;
  //Create 2 int list
  var (partOne, partTwo) = split2List(contenuAsync);

  for(int value in partOne){
    result += value * partTwo.where((vt) => vt == value).length;
  }

  return result;
}
