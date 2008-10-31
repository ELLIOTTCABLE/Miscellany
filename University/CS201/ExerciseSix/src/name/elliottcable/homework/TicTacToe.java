//////////////////////////////////////////////////////////////////////////////
//
//	elliottcable
// 	Assignment 6, Programming Project 7
//	October 30, 2008
//
//////////////////////////////////////////////////////////////////////////////
package name.elliottcable.homework;

//////////////////////////////////////////////////////////////////////////////
//
// Description:   This class provides storage of a TicTacToe game, including
//                  current players and board status.
//	
// Inputs:        N/A
//	
// Outputs:       N/A
//
//////////////////////////////////////////////////////////////////////////////
public class TicTacToe {
  
  // Since the medium already has an established co-ordinate system, we'll
  // utilize meaningless padding to make our index numbers match said
  // co-ordinate system. If anything returns a 'Z' for any reason, that
  // denotates an error of some sort.
  public char[][] board = {
    {'Z','Z','Z','Z'},
    {'Z',' ',' ',' '},
    {'Z',' ',' ',' '},
    {'Z',' ',' ',' '}
  };
  public char player = 'X';
  
  /**
   * Name:          winner(), hasWinner()
   * Description:   Checks who is currently winning, if anybody.
   * 
   * Returns:       winner - Either 'X' or 'O', or ' ' if nobody is winning.
   */
  public char winner() {
    // Horizontal
    for(int i=1; i <= 3; i++) {
      if(board[i][1] == board[i][2])
        if(board[i][2] == board[i][3])
          return board[i][3];
    }
    
    // Vertical
    for(int i=1; i <= 3; i++) {
      if(board[1][i] == board[2][i])
        if(board[2][i] == board[3][i])
          return board[3][i];
    }
    
    // Diagonal
    if(board[1][1] == board[2][2])
      if(board[2][2] == board[3][3])
        return board[3][3];
        
    if(board[1][3] == board[2][2])
      if(board[2][2] == board[3][1])
        return board[3][1];
    
    return ' ';
  }
  public boolean hasWinner() {
    return(winner() != ' ');
  }
  
  /**
   * Name:          isFull()
   * Description:   Checks if the board is entirely full (aka a draw).
   * 
   * Returns:       whetherIsFull - Whether or not the board is full.
   */
  public boolean isFull() {
    for(int x=1; x <= 3; x++) {
      for(int y=1; y <= 3; y++) {
        if(board[x][y] == ' ')
          return false;
      }
    }
    return true;
  }
  
  /**
   * Name:          move()
   * Description:   Makes a move for the current player, filling in the
   *                  destination position with their char.
   * 
   * Arguments:     x, y - Location on the board to fill in with the current
   *                         player's char.
   */
  public void move(int x, int y) {
    try {
      if(board[x][y] == ' ') {
        board[x][y] = player;
        switchPlayer();
      } else {
        System.out.println("!! Invalid move! Try again.");
      }
    } catch (ArrayIndexOutOfBoundsException e) {
      System.out.println("!! Invalid move! Try again.");
    }
  }
  
  /**
   * Name:          switchPlayer()
   * Description:   Switches the current player.
   */
  public void switchPlayer() {
    if(player == 'X') {
      player = 'O';
    } else {
      player = 'X';
    }
  }
  
  /**
   * Name:          toString()
   * Description:   Returns a string interpretation of the board's state.
   * 
   * Returns:       boardAsString - a string interpretation of the board's
   *                                  state.
   */
  public String toString() {
    String boardAsString = " X1 2 3X";
    boardAsString = boardAsString + '\n' + "Y+------";
    
    for(int i=1; i <= 3; i++) {
      boardAsString = boardAsString + '\n';
      boardAsString = boardAsString + i;
      boardAsString = boardAsString + '|' + board[i][1];
      boardAsString = boardAsString + ' ' + board[i][2];
      boardAsString = boardAsString + ' ' + board[i][3];
    }
    
    boardAsString = boardAsString + "\nY";
    return boardAsString;
  }
  
}
