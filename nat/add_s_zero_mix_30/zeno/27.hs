
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
prop v0 v1 v2 v3 v4 v5 v6 v7 v8 v9 v10 v11 = proveBool $  (eq ((+) (S (S v3)) ((+) ((+) ((+) (S v0) ((+) (S v9) v4)) ((+) ((+) (S v11) (S v1)) (S ((+) v2 (S v9))))) (S (S ((+) ((+) ((+) v7 (S v8)) (S ((+) v2 (S (S (S v5)))))) ((+) (S v10) v6)))))) (S ((+) (S (S ((+) ((+) v11 ((+) v0 (S (S v3)))) ((+) (S ((+) v7 ((+) v5 (S ((+) ((+) v2 v10) (S (S v9))))))) v9)))) (S ((+) (S ((+) (S v1) ((+) v2 (S v8)))) (S ((+) v6 (S (S v4)))))))))
