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

exercise 4.2
============

> fromList :: [elem] -> IO (ListRef elem)
> fromList [] = nil
> fromList (e:es) = fromList es >>= cons e

> toList :: ListRef elem -> IO [elem]
> toList r = readIORef r >>= \result -> case result of
>     Nil -> return []
>     (Cons el r) -> toList r >>= \tail -> return $ el : tail

exercise 4.3
============

> foreach :: ListRef a -> (a -> IO b) -> IO (ListRef b)
> foreach r a = readIORef r >>= \l -> case l of
>     Nil -> nil
>     (Cons el ref) -> foreach ref a >>= \tail -> a el >>= \e -> cons e tail
