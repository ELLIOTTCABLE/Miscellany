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
// Description:   This class, a subclass of Student, describes a specific type
//                  of Student — one who is also an athlete. Provides for
//                  storing and manipulating an athlete's jersey number and
//                  grade point average.
//	
// Inputs:        N/A
//	
// Outputs:       N/A
//
//////////////////////////////////////////////////////////////////////////////
public class StudentAthlete extends Student {
  
  // =================
  // = main() method =
  // =================
  
  public static void main(String args[]) {
    System.out.println("---- ---- ---- ----");
    
    StudentAthlete john = new StudentAthlete("John Neumaker");
    john.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    StudentAthlete bob = new StudentAthlete("Bobby Trimold", 66, 42, 3.4);
    bob.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    StudentAthlete helen = new StudentAthlete("Helen Neffund", 184, 4, 3.7);
    // Let's average in Helen's great new World Geography Final grade!
    helen.setGPA((helen.getGPA() + 4.0) / 2.0); // Good job, Helen!
    helen.writeOutput();
    
    System.out.println("---- ---- ---- ----");
    
    StudentAthlete newStudent = new StudentAthlete("Snitter Poly");
    // Oops! We need to insert a new student, and also put him on the team!
    if( !helen.equals(newStudent) ) {
      newStudent.setStudentNumber(helen.getStudentNumber() + 1);
      newStudent.setJerseyNumber(helen.getJerseyNumber() + 1);
    }
    helen.writeOutput();
    newStudent.writeOutput();
    
    System.out.println("---- ---- ---- ----");
  }
  
  // ========================
  // = Primary class source =
  // ========================
  private int jerseyNumber;
  private double gPA;
  
  /**
   * Name:    new StudentAthlete()
   * Desc:    Constructor for StudentAthletes
   * Returns: A new StudentAthlete, with any missing values initialized to
   *            zero.
   */
  public StudentAthlete(String initialName) {
    super(initialName, 0);
    jerseyNumber = 0;
    gPA = 4.0;
  }
  public StudentAthlete(String initialName, int initialStudentNumber) {
    super(initialName, initialStudentNumber);
    jerseyNumber = 0;
    gPA = 4.0;
  }
  public StudentAthlete(String initialName, int initialStudentNumber, int initialJerseyNumber, double initialGPA) {
    super(initialName, initialStudentNumber);
    jerseyNumber = initialJerseyNumber;
    gPA = initialGPA;
  }
  
  /**
   * Name:    setJerseyNumber(), getJerseyNumber()
   * Desc:    Getter and setter for the jersey number.
   */
  public void setJerseyNumber(int newJerseyNumber) {
      jerseyNumber = newJerseyNumber;
  }
  public int getJerseyNumber() {
      return jerseyNumber;
  }
  
  /**
   * Name:    setGPA(), getGPA()
   * Desc:    Getter and setter for GPA.
   */
  public void setGPA(double newGPA) {
      gPA = newGPA;
  }
  public double getGPA() {
      return gPA;
  }
  
  /**
   * Name:    writeOutput()
   * Desc:    Prints all relevant attributes of this StudentAthlete to the
   *            terminal.
   */
  public void writeOutput() {
    super.writeOutput();
    System.out.println("Jersey Number: " + jerseyNumber);
    System.out.println("GPA: " + gPA);
  }
}
