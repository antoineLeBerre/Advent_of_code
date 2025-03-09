import 'package:collection/collection.dart';

List<List<int>> split2List(List<String> contenuAsync) {
  List<List<int>> one = [];

  for(String ligne in contenuAsync){
    final ligneSplit = ligne.split(' ').map((toElement) => int.parse(toElement)).toList();

    one.add(ligneSplit);
  }

  return one;
}

int partOne(List<String> contenuAsync) {
  int result = 0;
  //Create list of int list
  var partOne = split2List(contenuAsync);

  for(var li in partOne){
    /*var copyLi = List<int>.from(li);
    copyLi.sort();
    var reversedList = copyLi.reversed.toList();
    if (!li.equals(reversedList) && !li.equals(copyLi)) continue;

    bool isGood = copyLi.skip(1).toList().asMap().entries
        .every((entry) => (copyLi[entry.key + 1] - copyLi[entry.key]).abs() > 0
        && (copyLi[entry.key + 1] - copyLi[entry.key]).abs() <= 3);*/
    bool isGood = verifieRegles(li);
    if (isGood) result++;
  }

  return result;
}

int partTwo(List<String> contenuAsync) {
  var result = 0;
  //Create list of int list
  var partOne = split2List(contenuAsync);

  // Suppress single bad level
  /*for(var li in partOne) {
    var copyLi = li.toList();
    var delete = false;
    var decreased = li[1] - li[0] < 0;
    var increased = li[1] - li[0] > 0;
    if((li[1] - li[0]).abs() > 3){
      li.removeAt(0);
      delete = true;
    } else {
      for (int i = 1; i < copyLi.length; i++) {
        var difference = copyLi[i] - copyLi[i - 1];
        if ((!delete && decreased && difference >= 0)
            || (!delete && increased && difference <= 0)) {
          if ((decreased && copyLi[i] - copyLi[i - 2] >= 0) || (increased && copyLi[i] - copyLi[i - 2] <= 0)){
            li.removeAt(i - 1);
          } else {
            li.removeAt(i);
          }
          delete = true;
        } else if ((!delete && decreased && difference < -3)
            || (!delete && increased && difference > 3)) {
          li.removeAt(i);
          delete = true;
        } else if (!delete && !decreased && !increased) {
          li.removeAt(i);
          delete = true;
        }
      }
    }
  }
  

  for(var li in partOne){
    var copyLi = List<int>.from(li);
    copyLi.sort();
    var reversedList = copyLi.reversed.toList();
    if (!li.equals(reversedList) && !li.equals(copyLi)) {
      print(li);
      continue;
    }

      bool isGood = copyLi.skip(1).toList().asMap().entries
          .every((entry) => (copyLi[entry.key + 1] - copyLi[entry.key]).abs() > 0
          && (copyLi[entry.key + 1] - copyLi[entry.key]).abs() <= 3);
      if (isGood) {
        result++;
      } else {
        print(li);
      }
  }*/

  for(var line in partOne){
    bool isGood = verifieReglesPartTwo(line);
    if (isGood) result++;
  }

  return result;
}

bool verifieRegles(List<int> niveaux) {
  if (niveaux.length <= 1) {
    return true; // Une liste vide ou avec un seul élément respecte les règles trivialement
  }

  // Vérification de la direction (augmentation ou diminution)
  bool estEnAugmentation = niveaux[1] > niveaux[0];

  for (int i = 1; i < niveaux.length; i++) {
    int difference = niveaux[i] - niveaux[i - 1];
    int diffAbs = difference.abs();

    // Règle 2 : La différence doit être entre 1 et 3 inclus
    if (diffAbs < 1 || diffAbs > 3) {
      return false;
    }

    // Règle 1 : Vérification de la direction
    if ((estEnAugmentation && difference < 0) ||
        (!estEnAugmentation && difference > 0)) {
      return false;
    }
  }

  return true;
}

bool verifieReglesPartTwo(List<int> niveaux) {
  if (niveaux.length <= 1) {
    return true; // Une liste vide ou avec un seul élément respecte les règles trivialement
  }

  // Vérification directe si la liste respecte les règles sans suppression
  if (verifieRegles(niveaux)) {
    return true;
  }

  // Si la liste ne respecte pas les règles, essayons de supprimer un élément
  for (int i = 0; i < niveaux.length; i++) {
    List<int> listeModifiee = List<int>.from(niveaux);
    listeModifiee.removeAt(i);

    if (verifieRegles(listeModifiee)) {
      return true; // La suppression de cet élément rend la liste valide
    }
  }

  return false; // Aucune suppression ne rend la liste valide
}


