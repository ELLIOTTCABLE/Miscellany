//////////////////////////////////////////////////////////////////////////////
//
//	elliottcable
// 	Assignment 6, Programming Project 7
//	October 30, 2008
//
//////////////////////////////////////////////////////////////////////////////
package name.elliottcable.runners;

import name.elliottcable.homework.TicTacToe;
import java.util.Scanner;
import java.util.Hashtable;

//////////////////////////////////////////////////////////////////////////////
//
// Description:   Allows one to play the TicTacToeBoard through a terminal.
//	
// Inputs:        N/A
//	
// Outputs:       N/A
//
//////////////////////////////////////////////////////////////////////////////
public class TicTacToeRunner {
  
  static Scanner keyboard = new Scanner(System.in);
  
  // Storing the score in an array. score[0] is X's wins, score[1] is O's wins.
  static int[] score = {0, 0};
  
  /**
   * Name:          main()
   * Description:   Allows a user to play as many games of TicTacToe as they
   *                  please, via a terminal.
   */
  public static void main(String args[]) {
    boolean play_again;
    do {
      play_game();
      
      System.out.println("Do you want to play again? (y/n)");
      String response = keyboard.next();
      play_again = (response.contains("y") || response.contains("Y"));
    } while(play_again);
  }
  
  /**
   * Name:          play_game()
   * Description:   Allows the user to interactively play a hot-seat TicTacToe
   *                  game via their terminal.
   */
  public static void play_game() {
    TicTacToe board = new TicTacToe();
    do {
      System.out.println("-- ---- ---- ---- --");
      System.out.println("** "+board.player+" move (X and Y co-ordinates, seperated with a space):");
      
      System.out.print(">> ");
      int x = keyboard.nextInt();
      int y = keyboard.nextInt();
      board.move(x,y);
      
      System.out.println(board.toString());
    } while(!board.hasWinner() && !board.isFull());
    
    if(board.hasWinner()) {
      System.out.println("** "+board.winner()+" has won the game!");
      if(board.winner() == 'X') {
        score[0] = score[0] + 1;
      } else {
        score[1] = score[1] + 1;
      }
    } else {
      System.out.println("** The game was a draw.");
    }
    
    System.out.println("** Score: X["+score[0]+"] to O["+score[1]+"]");
    keyboard.nextLine(); // Clear the scanner buffer
  }
}
