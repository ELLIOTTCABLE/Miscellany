//////////////////////////////////////////////////////////////////////////////
//
//	elliottcable
// 	Assignment 6, Programming Project 3
//	October 29, 2008
//
//////////////////////////////////////////////////////////////////////////////
package name.elliottcable.homework;

import java.util.Scanner;

//////////////////////////////////////////////////////////////////////////////
//
// Description:   This class provides a way to store a string of characters,
//                  and subsequently test if that string is (or is not) a
//                  palindrome (i.e. reads the same backwards as forwards).
//	
// Inputs:        N/A
//	
// Outputs:       N/A
//
//////////////////////////////////////////////////////////////////////////////
public class Palindrome {
  
  static Scanner keyboard = new Scanner(System.in);
  
  /**
   * Name:          main()
   * Description:   Allows a user to enter phrases to be tested for palindrome
   *                  -ness.
   */
  public static void main(String args[]) {
    boolean enter_another;
    do {
      System.out.println("Enter a phrase, and I'll test whether or not it's a palindrome:");
      char[] characters = keyboard.nextLine().toCharArray();

      if( isPalindrome(characters, characters.length) ) {
        System.out.print("That's a palindrome! ");
      } else {
        System.out.print("That's not a palindrome. ");
      }
      
      System.out.println("Do you want to test another? (y/n)");
      String response = keyboard.nextLine();
      enter_another = (response.contains("y") || response.contains("Y"));
    } while(enter_another);
  }
  
  /**
   * Name:          isPalindrome()
   * Description:   Checks whether characters are actually a palindrome or not.
   * 
   * Arguments:     characters -    Characters to test for palindrome-ness.
   *                used -          How many slots are used in the
   *                                  `characters` array.
   * Returns:       isPalindrome -  Whether or not this Palindrome object's
   *                                  characters array is actually a
   *                                  palindrome.
   */
  public static boolean isPalindrome(char[] characters, int used) {
    int middle = used / 2;
    
    for(int i = 0; i <= middle; i++){
      if(characters[i] != characters[used - i - 1])
        return false;
    }
    return true;
  }
}
