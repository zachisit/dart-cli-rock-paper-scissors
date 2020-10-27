import 'dart:math';

enum Move {
  rock,
  paper,
  scissors,
}

enum AllowedInputs {
  r,
  p,
  s,
}

class MoveDetermination {
  MoveDetermination({this.playerInput});
  String playerInput;
  Move aiMove;
  var playerMove;

  int generateRandomNumber() {
    Random random = Random();
    return random.nextInt(3);
  }

  void generateAiMove() {
    this.aiMove = Move.values[this.generateRandomNumber()];
  }

  void determinePlayerMove(String move) {
    //@TODO check if value is inside Move enum

    if (this.playerInput == 'r' ||
        this.playerInput == 'p' ||
        this.playerInput == 's') {
          
      switch (this.playerInput) {
        case 'r':
          this.playerMove = Move.rock;
          break;
        case 'p':
          this.playerMove = Move.paper;
          break;
        case 's':
          this.playerMove = Move.scissors;
          break;
        default:
          this.playerInput = null;
      }
    }
  }

  bool isWinnerMove() {
    return ((this.playerMove == Move.rock && aiMove == Move.scissors ||
        this.playerMove == Move.paper && aiMove == Move.rock ||
        this.playerMove == Move.scissors && aiMove == Move.paper)) 
        ? true 
        : false;
  }

  bool isDrawMove() {
    return (this.playerMove == aiMove) ? true : false;
  }

  bool isInvalidInput() {
    return (this.playerMove == null) ? true : false;
  }

  String generateMoveResult() {
    this.determinePlayerMove(this.playerInput);
    this.generateRandomNumber();
    this.generateAiMove();

    if (this.isInvalidInput()) {
      return 'Invalid input';
    }

    if (this.isDrawMove()) {
      return 'It is a draw!';
    } else if (this.isWinnerMove()) {
      return 'You win';
    } else {
      return 'You lose';
    }
  }
}
