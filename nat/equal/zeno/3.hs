
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


equal :: Nat -> Nat -> Nat -> Bool
equal Zero Zero Zero = (not False)
equal Zero (S y) z = False
equal Zero y (S z) = False
equal (S x) Zero z = False
equal (S x) y Zero = False
equal (S x) (S y) (S z) = (equal x y z)
prop x y z = proveBool $  (iff (equal x y z) (and (eq x y) (eq y z)))
