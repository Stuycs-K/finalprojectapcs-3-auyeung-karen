import java.io.*;
import java.util.*;

class Player{
  private int score;
  private int highScore;
  
  Player(int score){
    this.score = score;
    highScore = 0;
  }
  
  void addScore(int added){
    score += added;
  }
  
  int getScore(){
    return score;
  }
  
  void setHighScore(){
    highScore = score;
  }
  
}
