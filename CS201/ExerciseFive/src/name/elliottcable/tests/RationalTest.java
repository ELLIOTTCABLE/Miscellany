////////////////////////////////////////////////////////////////////////////
//
//	elliottcable
// 	Assignment 5, Programming Project 12
//	October 22, 2008
//
////////////////////////////////////////////////////////////////////////////
package name.elliottcable.tests;
import  name.elliottcable.homework.Rational;

import org.junit.*;
import static org.junit.Assert.*;

public class RationalTest {
  Rational rationalNumber;
  
  @Test public void testConstructor() {
    Rational aRational = new Rational(123, 456);
    
    assertEquals( (Integer)123, aRational.numerator );
    assertEquals( (Integer)456, aRational.denominator );
  }
  
  @Test public void testConstructorDefault() {
    Rational aRational = new Rational();
    
    assertEquals( (Integer)0, aRational.numerator );
    assertEquals( (Integer)1, aRational.denominator );
  }
  
  @Before public void setUp() {
    rationalNumber = new Rational();
  }
  
  @Test public void testNumeratorBean() {
    rationalNumber.setNumerator(123);
    
    assertEquals( (Integer)123, rationalNumber.getNumerator() );
  }
  
  @Test public void testDenominatorBean() {
    rationalNumber.setDenominator(456);
    
    assertEquals( (Integer)456, rationalNumber.getDenominator() );
  }
  
  @Test public void testGetGCD() {
    rationalNumber.setNumerator(123);
    rationalNumber.setDenominator(456);
    
    assertEquals( (Integer)3, rationalNumber.getGCD() );
  }
  
  @Test public void testSimplify() {
    rationalNumber.setNumerator(123);
    rationalNumber.setDenominator(456);
    rationalNumber.simplify();
    
    assertEquals( (Integer)41, rationalNumber.getNumerator() );
    assertEquals( (Integer)152, rationalNumber.getDenominator() );
  }
  
}
