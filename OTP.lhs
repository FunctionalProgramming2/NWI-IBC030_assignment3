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
>   (arg : _) <- getArgs
>   let n = read arg :: Int
>   rs <- sequence (replicate n roll)
>   print rs
>   putStrLn ("average: " ++ show (sum rs `div` n))

> shift :: Char -> Int -> Char
> shift a r
>     | inta < 32 = a
>     | otherwise = chr . (+32) $ (inta - 32 + r) `mod` (128 - 32)
>     where inta = ord a
