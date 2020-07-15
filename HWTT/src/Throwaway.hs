module Throwaway where

import Data.Char (toUpper)

addInts :: Int -> Int -> Int
addInts x y = x + y

checkNumber :: Int -> String
checkNumber x = if mod x 2 == 0 then "even" else "odd"

sumOfList :: Int -> [Int] -> Int
sumOfList total lst = if null lst then total else sumOfList (total + head lst) (tail lst)

doubleList :: [Int] -> [Int] -> [Int]
doubleList processed lst =
   if null lst then processed else doubleList (processed ++ [head lst * 2]) (tail lst)

toUppercase :: String -> String -> String
toUppercase processed string = if null string
   then processed
   else toUppercase (processed ++ [toUpper (head string)]) (tail string)

isCharPresent :: Char -> String -> Bool
isCharPresent needle string =
   if needle == (head string) then True else isCharPresent needle (tail string)


allCharsPresent needles string = if not (isCharPresent (head needles) string)
   then False
   else allCharsPresent (tail needles) string

evenList :: Int -> [Int] -> [Int]
evenList n lst = if n == 0
   then lst
   else if (mod n 2) == 0 then evenList (n - 1) (n : lst) else evenList (n - 1) (lst)
