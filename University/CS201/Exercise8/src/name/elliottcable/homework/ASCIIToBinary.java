//////////////////////////////////////////////////////////////////////////////
//
//  elliottcable
//  Assignment 8
//  November 19, 2008
//
//////////////////////////////////////////////////////////////////////////////
package name.elliottcable.homework;

import java.util.Scanner;
import java.util.List;
import java.util.ArrayList;
import java.io.*;

//////////////////////////////////////////////////////////////////////////////
//
// Description:   This class interactively reads a filename referencing a text
//                  file containing one number per line, and then writes those
//                  numbers out to a binary file, and finally reads the
//                  numbers back in from the binary file for printing.
//  
// Inputs:        The path of an ASCII textual file with one number on each
//                  line.
//  
// Outputs:       The numbers from the input, having been printed to a binary
//                  file and then read in again.
//
//////////////////////////////////////////////////////////////////////////////

public class ASCIIToBinary {
  
  static Scanner keyboard = new Scanner(System.in);
  
  // =================
  // = main() method =
  // =================
  
  public static void main(String args[]) {
    ASCIIToBinary processor = new ASCIIToBinary();
    String newInputPath;
    boolean tryAgain;
    do {
      try {
        System.out.println("Please enter a file path to be read:");
        processor.setInputPath(keyboard.nextLine());
        // Reads input from the file
        processor.readInput();
        // Then writes it to a binary file
        processor.writeOutput();
        // And finally we read back in the binary file, and print it's
        // contents.
        ObjectInputStream input =
          new ObjectInputStream(new FileInputStream(processor.getOutputPath()));
        
        boolean done;
        do {
          try {
            System.out.println(input.readInt());
            
            done = false;
          } catch(EOFException exception) {
            done = true;
          }
        } while (!done);
        input.close();
        
        
        tryAgain = false;
      } catch (FileNotFoundException exception) {
        System.err.println(exception);
        tryAgain = true;
      } catch (IOException exception) {
        exception.printStackTrace();
        tryAgain = true;
      }
    } while (tryAgain);
  }
  
  // ========================
  // = Primary class source =
  // ========================
  
  private String inputPath;
  private String outputPath;
  private List<Integer> content;
  
  /**
   * Name:    ASCIIToBinary(), etc.
   * Desc:    Constructors for new ASCII to binary converter objects.
   */
  ASCIIToBinary () {
    inputPath = "numbers.txt";
    outputPath = "numbers.dat";
    content = new ArrayList<Integer>();
  }
  ASCIIToBinary (String initialInputPath) {
    inputPath = initialInputPath;
    outputPath = "numbers.dat";
    content = new ArrayList<Integer>();
  }
  ASCIIToBinary (String initialInputPath, String initialOutputPath) {
    inputPath = initialInputPath;
    outputPath = initialOutputPath;
    content = new ArrayList<Integer>();
  }
  
  /**
   * Name:    setInputPath(), getInputPath()
   * Desc:    Getter and setter for the path to an ASCII input file.
   */
  public void setInputPath(String newInputPath) {
    inputPath = newInputPath;
  }
  public String getInputPath() {
    return inputPath;
  }
  
  /**
   * Name:    setOutputPath(), getOutputPath()
   * Desc:    Getter and setter for the path to a binary output file.
   */
  public void setOutputPath(String newOutputPath) {
    outputPath = newOutputPath;
  }
  public String getOutputPath() {
    return outputPath;
  }
  
  /**
   * Name:    setContent(), getContent()
   * Desc:    Getter and setter for a list of Integers contained by the input
   *            file.
   */
  public void setContent(List newContent) {
    content = newContent;
  }
  public List getContent() {
    return content;
  }
  
  /**
   * Name:    readInput()
   * Desc:    Reads from the `inputFile` and stuffs an `Integer` read from
   *            each line into the `content` list.
   */
  public void readInput() throws FileNotFoundException, IOException {
    File inFile = new File(inputPath);
    
    if ( !inFile.exists() ) {
      throw new FileNotFoundException("The file " + inputPath + " does not exist");
    } else {
      FileReader reader = new FileReader(inFile);
      Scanner in = new Scanner(reader);
      int next;
      
      do {
        content.add(in.nextInt());
      } while (in.hasNextInt());
      
      reader.close();
    }
  }
  
  /**
   * Name:    writeOutput()
   * Desc:    Reads from the `content` list and writes each `Integer` into the
   *            binary `outputFile`.
   */
  public void writeOutput() throws FileNotFoundException, IOException {
    ObjectOutputStream output =
      new ObjectOutputStream(new FileOutputStream(outputPath));
    
    for (int i=0;i<content.size();i++) {
      output.writeInt( content.get(i).intValue() );
    }
    output.close();
  }
  
  
}
