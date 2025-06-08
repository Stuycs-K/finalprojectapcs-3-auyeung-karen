import java.io.*;
import java.util.*;

public class Player{
  private int score = 0;
  private int highScore;
  private int numMoves;
  private int maxNumMoves;
  
  public Player(int numMoves){
    this.score = 0;
    this.highScore = 0;
    this.numMoves = numMoves;
    maxNumMoves = numMoves;
  }
  
  public void addScore(int added){
    score += added;
    /*if (score > highScore){
      setHighScore(score);
    }*/
  }
  
  public int getScore(){
    return score;
  }
  
  public int getHighScore(){
    return highScore;
  }
  
  public int getNumMoves(){
    return numMoves;
  }
  
  public void setHighScore(int score){
    this.highScore = score;
  }
  
  public void addNumMoves(){
    numMoves += 1;
  }
  
  public void minusNumMoves(){
    numMoves -= 1;
  }
  
  public void resetNumMoves(){
    this.numMoves = maxNumMoves;
  }
  
  public void resetScore(){
    if (score > highScore){
      setHighScore(score);
    }
    resetNumMoves();
    score = 0;
  }
  
}
