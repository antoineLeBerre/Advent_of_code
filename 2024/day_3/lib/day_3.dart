import 'package:collection/collection.dart';

List<List<int>> split2List(List<String> contenuAsync) {
  List<List<int>> one = [];

  for(String ligne in contenuAsync){
    final ligneSplit = ligne.split(' ').map((toElement) => int.parse(toElement)).toList();

    one.add(ligneSplit);
  }

  return one;
}

int partOne(String contenuAsync) {
  //Create list of int list
  RegExp regExp = RegExp(r'mul\((\d{1,3}),(\d{1,3})\)');
  var listRegExp = regExp.allMatches(contenuAsync);
  List<int> listRes = [];

  for(var match in listRegExp){
    listRes.add(int.parse(match.group(1)!) * int.parse(match.group(2)!));
  }

  return listRes.sum;
}

int partTwo(String contenuAsync) {
  //Create list of int list
  var doList = contenuAsync.split('do()');
  List<String> withoutDontList = [];
  for (var item in doList) {
    var splitList = item.split('don\'t()');
    withoutDontList.add(splitList[0]);
  }
  RegExp regExp = RegExp(r'mul\((\d{1,3}),(\d{1,3})\)');
  var listRegExp = regExp.allMatches(withoutDontList.join());
  List<int> listRes = [];

  for(var match in listRegExp){
    listRes.add(int.parse(match.group(1)!) * int.parse(match.group(2)!));
  }

  return listRes.sum;
}

int mul(int nombre1, int nombre2){
  return nombre1 * nombre2;
}