> {-# LANGUAGE UnicodeSyntax #-}
>
> module LinkedList
> where
> -- import Unicode
> import Data.IORef

> type ListRef elem  =  IORef (List elem)
>
> data List elem  =  Nil | Cons elem (ListRef elem)

< nil  ∷ IO (ListRef elem)
< cons ∷ elem → ListRef elem → IO (ListRef elem)

< fromList ∷ [elem] → IO (ListRef elem)
< toList   ∷ ListRef elem → IO [elem]

< foreach ∷ ListRef a → (a → IO b) → IO (ListRef b)

--------------------------------------------------------------------------------
author: Hendrik Werner s4549775
author: Anna Töskés s1005628

exercise 4.1
============

> nil :: IO (ListRef elem)
> nil = newIORef Nil

> cons :: elem -> ListRef elem -> IO (ListRef elem)
> cons e l = newIORef $ Cons e l
