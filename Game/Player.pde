import java.io.*;
import java.util.*;

public class Player{
  private int score = 0;
  private int highScore;
  
  public Player(){
    this.score = 0;
    this.highScore = 0;
  }
  
  public void addScore(int added){
    score += added;
    if (score > highScore){
      setHighScore(score);
    }
  }
  
  public int getScore(){
    return score;
  }
  
  public int getHighScore(){
    return highScore;
  }
  
  public void setHighScore(int score){
    this.highScore = score;
  }
  
  public void resetScore(){
    score = 0;
  }
  
}
