import 'dart:io';
import 'dart:math';

import 'moveDetermination.dart';

enum Move {
  rock,
  paper,
  scissors,
}
void main() {
  stdout
  .write('Time to play Rock, Paper, or Scissors. \nAre you by any chance Kiwi? Possible values are y or n: ');
  final kInput = stdin.readLineSync();
  
  while (true) {
    stdout
        .write('Let\s bust some cheeks! \nRock, paper, or scissors? \nPossible options are r, p, or s: ');
  
    final input = stdin.readLineSync();

    if (input == 'q') {
      print('Exiting application');
      break;
    }
    if (kInput == 'y') {
      print('YOU WON!');
    } else {
      print(MoveDetermination(playerInput: input).generateMoveResult());
    }
  }
}
