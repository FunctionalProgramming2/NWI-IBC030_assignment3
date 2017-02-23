ghc --make WordCount.lhs

> {-# LANGUAGE UnicodeSyntax #-}
>
> module Main
> where
> import Unicode ()
> import System.Environment

--------------------------------------------------------------------------------
author: Hendrik Werner s4549775
author: Anna Töskés s1005628

> main :: IO ()
> main = do
>   args <- getArgs
>   putStrLn (unwords args)
