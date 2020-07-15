module Chapter1 where

import Data.Char

isLeapYear :: Int -> Bool
isLeapYear yr = if yr `mod` 400 == 0
   then True
   else if yr `mod` 100 == 0 then False else (yr `mod` 4 == 0)

evenList :: Int -> [Int] -> [Int]
evenList remainingCount lst = if remainingCount == 0
   then lst
   else evenList (remainingCount - 1) ((remainingCount * 2) : lst)

multipleSum :: Int -> Int -> Int
multipleSum currentNumber total = if currentNumber == 0
   then total
   else if (currentNumber `mod` 3 == 0) || (currentNumber `mod` 5 == 0)
      then multipleSum (currentNumber - 1) (total + currentNumber)
      else multipleSum (currentNumber - 1) total

multipleSum' :: Int -> Int -> Int -> Int
multipleSum' remainingCount startingPoint total = if remainingCount == 0
   then total
   else
      let next = firstMultipleAfter startingPoint
      in multipleSum' (remainingCount - 1) (next + 1) (total + next)

firstMultipleAfter :: Int -> Int
firstMultipleAfter n =
   if (n `mod` 3 == 0) || (n `mod` 5 == 0) then n else firstMultipleAfter (n + 1)

square :: Int -> Int
square x = x * x

sumOfSquares :: Int -> Int -> Int
sumOfSquares remainingCount total = if remainingCount == 0
   then total
   else sumOfSquares (remainingCount - 1) total + square remainingCount

squareOfSum :: Int -> Int
squareOfSum n = square (square n + n `quot` 2)

difference :: Int -> Int
difference n = abs (squareOfSum n - sumOfSquares n 0)

fibonacci :: Int -> Int
fibonacci n = if n <= 1 then 1 else fibonacci (n - 1) + fibonacci (n - 2)

evenSum :: Int -> Int -> Int -> Int
evenSum maxValue n total =
   let val = fibonacci n
   in
      if val >= maxValue
         then total
         else if val `mod` 2 == 0
            then evenSum maxValue (n + 1) (total + val)
            else evenSum maxValue (n + 1) total

-- `prev` is the n-th term of the Fibonacci sequence.
-- `current` is the (n+1)-th term of the Fibonacci sequence
-- `total` is the total of all the even Fibonacci numbers till the **(n-1)-th** term
evenSum' :: Int -> Int -> Int -> Int -> Int
evenSum' maxValue prev current total =
   let next = prev + current
   in
      if next >= maxValue
         then total
         else if next `mod` 2 == 0
            then evenSum' maxValue current next (total + next)
            else evenSum' maxValue current next total

-- Assumptions: ISBN is 10 characters; has no hyphens
isValidIsbn :: String -> Bool
isValidIsbn isbn = ((isbnSum isbn 10 0) `mod` 11) == 0

isbnSum :: String -> Int -> Int -> Int
isbnSum remainingIsbn currentMultiplier total = if currentMultiplier == 0
   then total
   else if head remainingIsbn == '-'
      then isbnSum (tail remainingIsbn) currentMultiplier total
      else isbnSum
         (tail remainingIsbn)
         (currentMultiplier - 1)
         (total + (currentMultiplier * digitToInt (head remainingIsbn)))
