ghc --make OTP.lhs


> {-# LANGUAGE UnicodeSyntax #-}
>
> module Main
> where
> import Unicode ()
> import System.Random
> import System.Environment
> import Data.Char

> dice :: IO Int
> dice = getStdRandom (randomR (1,6))
>
> roll ∷ IO Int
> roll  =  do  a ← dice
>              b ← dice
>              return (a + b)

--------------------------------------------------------------------------------
author: Hendrik Werner s4549775
author: Anna Töskés s1005628

> main :: IO ()
> main = do
>   setStdGen (mkStdGen 4711)
>   (md : input : output : _) <- getArgs
>   let mode = read $ capitalize md :: Mode
>   inContent <- readFile input
>   let inSize = length inContent
>   rs <- sequence (replicate inSize roll)
>   writeFile output $ ceasar mode inContent rs

> capitalize :: String -> String
> capitalize (c:cs) = toUpper c : map toLower cs

> data Mode = Encrypt | Decrypt
>     deriving (Eq, Read, Show)

> ceasar :: Mode -> String -> [Int] -> String
> ceasar m cs rs
>     | m == Encrypt = zipWith shift cs rs
>     | otherwise = zipWith shift cs $ map negate rs

> shift :: Char -> Int -> Char
> shift a r
>     | inta < 32 = a
>     | otherwise = chr . (+32) $ (inta - 32 + r) `mod` (128 - 32)
>     where inta = ord a
