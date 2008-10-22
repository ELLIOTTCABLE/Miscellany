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
    assertEquals( (int)aRational.numerator, 123 );
    assertEquals( (int)aRational.denominator, 456 );
  }
  
  @Test public void testConstructorDefault() {
    Rational aRational = new Rational();
    assertEquals( (int)aRational.numerator, 0 );
    assertEquals( (int)aRational.denominator, 1 );
  }
  
  @Before public void setUp() {
    rationalNumber = new Rational();
  }
  
  @Test public void testNumeratorBean() {
    rationalNumber.setNumerator(123);
    assertEquals( (int)rationalNumber.getNumerator(), 123 );
    assertNotNull( rationalNumber.numerator );
  }
  
  @Test public void testDenominatorBean() {
    rationalNumber.setDenominator(456);
    assertEquals( (int)rationalNumber.getDenominator(), 456 );
    assertNotNull( rationalNumber.denominator );
  }
  
  @Test public void testGetGCD() {
    rationalNumber.setNumerator(123);
    rationalNumber.setDenominator(456);
    assertEquals( (int)rationalNumber.getGCD(), 3 );
  }
  
}
