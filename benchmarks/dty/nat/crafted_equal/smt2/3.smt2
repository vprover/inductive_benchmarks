(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun equal (nat nat nat) Bool)
(assert (= (equal zero zero zero) (not false)))
(assert (forall ((y nat) (z nat)) (= (equal zero (s y) z) false)))
(assert (forall ((y nat) (z nat)) (= (equal zero y (s z)) false)))
(assert (forall ((x nat) (z nat)) (= (equal (s x) zero z) false)))
(assert (forall ((x nat) (y nat)) (= (equal (s x) y zero) false)))
(assert (forall ((x nat) (y nat) (z nat)) (= (equal (s x) (s y) (s z)) (equal x y z))))
(assert (not (forall ((x nat) (y nat) (z nat)) (= (equal x y z) (and (= x y) (= y z))))))
(check-sat)