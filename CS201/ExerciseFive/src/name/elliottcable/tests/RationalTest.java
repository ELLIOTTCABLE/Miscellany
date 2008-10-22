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
    assertEquals( aRational.numerator, (Integer)123 );
    assertEquals( aRational.denominator, (Integer)456 );
  }
  
  @Test public void testConstructorDefault() {
    Rational aRational = new Rational();
    assertEquals( aRational.numerator, (Integer)0 );
    assertEquals( aRational.denominator, (Integer)1 );
  }
  
  @Before public void setUp() {
    rationalNumber = new Rational();
  }
  
  @Test public void testNumeratorBean() {
    rationalNumber.setNumerator(123);
    assertEquals( rationalNumber.getNumerator(), (Integer)123 );
    assertNotNull( rationalNumber.numerator );
  }
  
  @Test public void testDenominatorBean() {
    rationalNumber.setDenominator(456);
    assertEquals( rationalNumber.getDenominator(), (Integer)456 );
    assertNotNull( rationalNumber.denominator );
  }
  
  @Test public void testGetGCD() {
    rationalNumber.setNumerator(123);
    rationalNumber.setDenominator(456);
    assertEquals( rationalNumber.getGCD(), (Integer)3 );
  }
  
}
