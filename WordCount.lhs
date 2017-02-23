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
>   mapM_ fileProcess args


> fileProcess :: String -> IO ()
> fileProcess s' = do s <- readFile s'
>                     let c = counter s
>                     print (c, s')

> counter :: String -> (Int, Int, Int)
> counter s = (lineCount s, wordCount s, byteCount s)

> wordCount :: String -> Int
> wordCount = length . words

> lineCount :: String -> Int
> lineCount = length . filter (=='\n')

> byteCount :: String -> Int
> byteCount = length
