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
  
  // =====================
  // = Constructor tests =
  // =====================
  
  @Test public void testConstructor() {
    Rational aRational = new Rational(1, 2);
    
    assertEquals( (Integer)1, aRational.numerator );
    assertEquals( (Integer)2, aRational.denominator );
  }
  
  @Test public void testConstructorDefault() {
    Rational aRational = new Rational();
    
    assertEquals( (Integer)0, aRational.numerator );
    assertEquals( (Integer)1, aRational.denominator );
  }
  
  @Test public void testConstructorSimplification() {
    Rational aRational = new Rational(123, 456);
    
    assertEquals( (Integer)41, aRational.numerator );
    assertEquals( (Integer)152, aRational.denominator );
  }
  
  // ===================
  // = Attribute tests =
  // ===================
  
  Rational rationalNumber;
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
  
  // ================
  // = Helper tests =
  // ================
  
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
  
  @Test public void testGetValue() {
    rationalNumber.setNumerator(1);
    rationalNumber.setDenominator(2);
    
    assertEquals( 0.5, rationalNumber.getValue(), 0.0001 );
  }
  
}
