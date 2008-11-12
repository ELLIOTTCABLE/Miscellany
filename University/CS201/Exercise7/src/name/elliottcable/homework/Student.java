package name.elliottcable.homework;

// =============================
// = Copied from Savitch, p554 =
// =============================
public class Student extends Person {
  private int studentNumber;
  
  public Student() {
    super();
    studentNumber = 0;
  }
  
  public Student(String initialName, int initialStudentNumber) {
    super(initialName);
    studentNumber = initialStudentNumber;
  }
  
  public void reset(String newName, int newStudentNumber) {
    setName(newName);
    studentNumber = newStudentNumber;
  }
  
  public int getStudentNumber() {
    return studentNumber;
  }
  
  public void setStudentNumber(int newStudentNumber) {
    studentNumber = newStudentNumber;
  }
  
  public void writeOutput() {
    System.out.println("Name: " + getName());
    System.out.println("Student Number: " + studentNumber);
  }
  
  public boolean equals(Student otherStudent) {
    return this.hasSameName(otherStudent) &&
      (this.studentNumber == otherStudent.studentNumber);
  }
}
