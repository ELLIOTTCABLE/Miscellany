//////////////////////////////////////////////////////////////////////////////
//
//	elliottcable
// 	Assignment 5, Programming Project 12
//	October 22, 2008
//
//////////////////////////////////////////////////////////////////////////////
package name.elliottcable.homework;

//////////////////////////////////////////////////////////////////////////////
//
// Description:   This class provides a way to store any *rational* number as
//                the combination of a numerator and denominator.
//	
// Inputs:        N/A
//	
// Outputs:       N/A
//
//////////////////////////////////////////////////////////////////////////////
public class Rational {
  
  public Integer numerator;
  /**
   * Name:          setNumerator, getNumerator
   * Description:   Numerator bean
   * 
   * @param newNumerator new value for numerator
   */
  public void setNumerator(Integer newNumerator) {
    numerator = newNumerator;
  }

  /**
   * @return numerator
   */
  public Integer getNumerator() {
    return numerator;
  }
  
  public Integer denominator;
  /**
   * Name:          setDenominator, getDenominator
   * Description:   Denominator bean
   *
   * @param newDenominator new value for denominator
   */
  public void setDenominator(Integer newDenominator) {
    denominator = newDenominator;
  }

  /**
   * @return denominator
   */
  public Integer getDenominator() {
    return denominator;
  }
  
  public Rational(int initialNumerator, int initialDenominator) {
    setNumerator(   (Integer)initialNumerator   );
    setDenominator( (Integer)initialDenominator );
  }
  
  public Rational() {
    this(0, 1);
  }
  
}