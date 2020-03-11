
{-# LANGUAGE ExistentialQuantification #-}
module Thry where

import Prelude ( Bool (..) )
infix 1 :=:
infixr 0 $

($) :: (a -> b) -> a -> b
f $ x = f x

otherwise :: Bool
otherwise = True

data Equals
  = forall a . (:=:) a a

data Prop
  = Given Equals Prop           
  | Prove Equals

prove :: Equals -> Prop
prove = Prove

given :: Equals -> Prop -> Prop
given = Given

proveBool :: Bool -> Prop
proveBool p = Prove (p :=: True)

givenBool :: Bool -> Prop -> Prop
givenBool p = Given (p :=: True)


and :: Bool -> Bool -> Bool
and True True = True
and _ _ = False
iff :: Bool -> Bool -> Bool
iff False False = True
iff True True = True
iff _ _ = False
impl :: Bool -> Bool -> Bool
impl l r = or (not l) r
lpmi :: Bool -> Bool -> Bool
lpmi l r = impl r l
or :: Bool -> Bool -> Bool
or False False = False
or _ _ = True
not :: Bool -> Bool
not True = False
not False = True

class Eq a where
  eq :: a -> a -> Bool

data Nat = Zero | S Nat
instance Eq Nat where
  eq (Zero) (Zero) = True
  eq (S a0) (S b0) = (and True (eq a0 b0))
  eq _ _ = False


data Lst = Nil | Cons Nat Lst
instance Eq Lst where
  eq (Nil) (Nil) = True
  eq (Cons a0 a1) (Cons b0 b1) = (and (and True (eq a0 b0)) (eq a1 b1))
  eq _ _ = False


(++) :: Lst -> Lst -> Lst
pref :: Lst -> Lst -> Bool
(++) Nil r = r
(++) (Cons a l) r = (Cons a ((++) l r))
pref Nil x = True
pref (Cons a x) Nil = False
pref (Cons a x) (Cons b y) = (and (eq a b) (pref x y))
prop v0 = proveBool $  (pref ((++) v0 ((++) v0 ((++) v0 v0))) ((++) ((++) v0 v0) ((++) ((++) v0 ((++) v0 v0)) ((++) v0 v0))))
