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
  
  // ==============
  // = Attributes =
  // ==============
  
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
  
  // ===============
  // = Constructor =
  // ===============
  
  /**
   * Name:          Rational
   * Description:   Rational constructor, calls simplify (defaults to 0/1)
   *
   * @param initialNumerator initial value for the numerator
   *                         (will be simplified down)
   * @param initialDenominator initial value for the denominator
   *                           (will be simplified down)
   */
  public Rational(int initialNumerator, int initialDenominator) {
    setNumerator(   (Integer)initialNumerator   );
    setDenominator( (Integer)initialDenominator );
    simplify();
  }
  public Rational() {
    this(0, 1);
  }
  
  // ===========
  // = Helpers =
  // ===========
  
  /**
   * Name:          getGCD
   * Description:   Returns the greatest common denominator of the numerator
   *                and denominator.
   * 
   * @return greatestCommonDenominator a number common to both the rational's
   *                                   numerator and denominator
   */
  public Integer getGCD() {
    // Since the easiest way to calculate GCD is a recursive method, we'll
    // proxy to a version that takes arguments (so it can call itself with new
    // arguments without changing our numerator or denominator)
    return getGCD(getNumerator(), getDenominator());
  }
  
  private Integer getGCD(Integer a, Integer b) {
    if(b == 0) return a;
    else return getGCD(b, a % b);
  }
  
  /**
   * Name:          simplify
   * Description:   Simplifies the numerator and denominator by GCDs.
   *                Descructive!
   */
  public void simplify() {
    Integer gcd = getGCD();
    while(gcd > 1) {
      setNumerator(getNumerator() / gcd);
      setDenominator(getDenominator() / gcd);
      gcd = getGCD();
    }
  }
}
