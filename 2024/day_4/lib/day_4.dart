int partOne(List<String> contenus) {
  var total = 0;
  var contenusLength = contenus.length;
  for (int i = 0; i < contenusLength; i++) {
    for (int j = 0; j < contenus[i].length; j++) {
      if (contenus[i][j] == 'X') {
        total += checkAllDirections(contenus, i, j);
      }
    }
  }
  return total;
}

int checkAllDirections(List<String> contenus, int i, int j) {
  var count = 0;
  count += checkHorizontal(contenus, i, j);
  count += checkVertical(contenus, i, j);
  count += checkDiagonal(contenus, i, j);
  return count;
}

int checkHorizontal(List<String> contenus, int i, int j) {
  var count = 0;
  var ligne = contenus[i];
  if (j - 3 >= 0 && checkLigne(ligne.substring(j - 3, j + 1))) count++;
  if (j + 3 < ligne.length && checkLigne(ligne.substring(j, j + 4))) count++;
  return count;
}

int checkVertical(List<String> contenus, int i, int j) {
  var count = 0;
  if (i - 3 >= 0 && checkLigne(contenus[i][j] + contenus[i - 1][j] + contenus[i - 2][j] + contenus[i - 3][j])) count++;
  if (i + 3 < contenus.length && checkLigne(contenus[i][j] + contenus[i + 1][j] + contenus[i + 2][j] + contenus[i + 3][j])) count++;
  return count;
}

int checkDiagonal(List<String> contenus, int i, int j) {
  var count = 0;
  var ligneLength = contenus[i].length;
  if (i - 3 >= 0 && j - 3 >= 0 && checkLigne(contenus[i][j] + contenus[i - 1][j - 1] + contenus[i - 2][j - 2] + contenus[i - 3][j - 3])) count++;
  if (i - 3 >= 0 && j + 3 < ligneLength && checkLigne(contenus[i][j] + contenus[i - 1][j + 1] + contenus[i - 2][j + 2] + contenus[i - 3][j + 3])) count++;
  if (i + 3 < contenus.length && j - 3 >= 0 && checkLigne(contenus[i][j] + contenus[i + 1][j - 1] + contenus[i + 2][j - 2] + contenus[i + 3][j - 3])) count++;
  if (i + 3 < contenus.length && j + 3 < ligneLength && checkLigne(contenus[i][j] + contenus[i + 1][j + 1] + contenus[i + 2][j + 2] + contenus[i + 3][j + 3])) count++;
  return count;
}

int partTwo(List<String> contenus){
  var total = 0;
  var contenusLength = contenus.length;
  for (int i = 1; i < contenusLength - 1; i++) {
    var ligne = contenus[i];
    var ligneLength = ligne.length;
    for (int j = 1; j < ligneLength - 1; j++) {
      var lettre = ligne[j];
      if (lettre == 'A') {
        if (checkMas(contenus[i - 1][j - 1]+ lettre+ contenus[i + 1][j + 1]) && checkMas(contenus[i - 1][j + 1]+ lettre+ contenus[i + 1][j - 1])) {
          total++;
        }
      }
    }
  }
  return total;
}

bool checkLigne(String ligne) {
  return ligne == 'XMAS' || ligne == 'SAMX';
}

bool checkMas(String ligne) {
  return ligne == 'MAS' || ligne == 'SAM';
}