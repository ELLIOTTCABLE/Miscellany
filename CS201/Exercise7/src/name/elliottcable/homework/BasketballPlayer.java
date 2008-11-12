//////////////////////////////////////////////////////////////////////////////
//
//	elliottcable
// 	Assignment 7
//	November 12, 2008
//
//////////////////////////////////////////////////////////////////////////////
package name.elliottcable.homework;

import java.util.Scanner;

//////////////////////////////////////////////////////////////////////////////
//
// Description:   This class, a subclass of StudentAthlete, describes a
//                  player on the Basketball team. Provides for storing and
//                  manipulating a player's points, rebounds, and assists.
//	
// Inputs:        N/A
//	
// Outputs:       N/A
//
//////////////////////////////////////////////////////////////////////////////
public class BasketballPlayer extends StudentAthlete {
  
  // =================
  // = main() method =
  // =================
  
  public static void main(String args[]) {
    System.out.println("---- ---- ---- ----");
    
    BasketballPlayer john = new BasketballPlayer("John Neumaker");
    john.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    BasketballPlayer bob = new BasketballPlayer("Bobby Trimold", 66, 42, 3.4);
    bob.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    BasketballPlayer helen = new BasketballPlayer("Helen Neffund", 184, 4, 3.7);
    // Let's average in Helen's great new World Geography Final grade!
    helen.setGPA((helen.getGPA() + 4.0) / 2.0); // Good job, Helen!
    helen.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    BasketballPlayer newStudent = new BasketballPlayer("Snitter Poly");
    // Oops! We need to insert a new student, and also put him on the team!
    if( !helen.equals(newStudent) ) {
      newStudent.setStudentNumber(helen.getStudentNumber() + 1);
      newStudent.setJerseyNumber(helen.getJerseyNumber() + 1);
    }
    helen.writeOutput();
    newStudent.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    // Let's have a game!
    bob.setPoints(bob.getPoints() + 2);
    helen.setPoints(helen.getPoints() + 3);
    bob.setRebounds(bob.getRebounds() + 1);
    helen.setAssists(helen.getAssists() + 1);
    bob.writeOutput();
    helen.writeOutput();
    
    System.out.println("---- ---- ---- ----");
  }
  
  // ========================
  // = Primary class source =
  // ========================
  private int points;
  private int rebounds;
  private int assists;
  
  /**
   * Name:    new BasketballPlayer()
   * Desc:    Constructor for BasketballPlayer
   * Returns: A new BasketballPlayer, with any missing values initialized to
   *            zero.
   */
  public BasketballPlayer(String initialName) {
    super(initialName);
    points = 0;
    rebounds = 0;
    assists = 0;
  }
  public BasketballPlayer(String initialName, int initialStudentNumber) {
    super(initialName, initialStudentNumber);
    points = 0;
    rebounds = 0;
    assists = 0;
  }
  public BasketballPlayer(String initialName, int initialStudentNumber, int initialJerseyNumber, double initialGPA) {
    super(initialName, initialStudentNumber, initialJerseyNumber, initialGPA);
    points = 0;
    rebounds = 0;
    assists = 0;
  }
  
  /**
   * Name:    setPoints(), getPoints()
   * Desc:    Getter and setter for a player's points.
   */
  public void setPoints(int newPoints) {
      points = newPoints;
  }
  public int getPoints() {
      return points;
  }
  
  /**
   * Name:    setRebounds(), getRebounds()
   * Desc:    Getter and setter for a player's rebounds.
   */
  public void setRebounds(int newRebounds) {
      rebounds = newRebounds;
  }
  public int getRebounds() {
      return rebounds;
  }
  
  /**
   * Name:    setAssists(), getAssists()
   * Desc:    Getter and setter for a player's assists.
   */
  public void setAssists(int newAssists) {
      assists = newAssists;
  }
  public int getAssists() {
      return assists;
  }
  
  
  /**
   * Name:    writeOutput()
   * Desc:    Prints all relevant attributes of this BasketballPlayer to the
   *            terminal.
   */
  public void writeOutput() {
    super.writeOutput();
    System.out.println("Points: " + points);
    System.out.println("Rebounds: " + rebounds);
    System.out.println("Assists: " + assists);
  }
}
