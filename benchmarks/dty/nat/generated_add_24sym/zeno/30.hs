
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


(+) :: Nat -> Nat -> Nat
(<=) :: Nat -> Nat -> Bool
(+) Zero y = y
(+) (S x) y = (S ((+) x y))
(<=) Zero y = True
(<=) (S x) Zero = False
(<=) (S x) (S y) = ((<=) x y)
prop v0 v1 v2 v3 v4 v5 v6 = proveBool $  (eq ((+) ((+) (S (S (S ((+) ((+) ((+) (S v3) ((+) (S v0) v5)) v4) (S v6))))) (S v2)) (S (S ((+) (S (S (S ((+) ((+) v6 (S Zero)) v1)))) (S v2))))) (S (S (S ((+) v4 (S ((+) (S ((+) (S v2) (S ((+) (S (S v6)) Zero)))) ((+) v5 ((+) (S (S ((+) v3 v0))) ((+) v6 (S ((+) (S (S v2)) v1))))))))))))
