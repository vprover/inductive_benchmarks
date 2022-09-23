(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(non-erasing add 2)
(injective add (true true))
(declare-fun equal (nat nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (= (equal zero zero zero) (not false)))
(assert (forall ((y nat) (z nat)) (= (equal zero (s y) z) false)))
(assert (forall ((y nat) (z nat)) (= (equal zero y (s z)) false)))
(assert (forall ((x nat) (z nat)) (= (equal (s x) zero z) false)))
(assert (forall ((x nat) (y nat)) (= (equal (s x) y zero) false)))
(assert (forall ((x nat) (y nat) (z nat)) (= (equal (s x) (s y) (s z)) (equal x y z))))
(assert (not (forall ((x nat)) (equal (add x (add (add x x) x)) (add x (add x (add x x))) (add (add x x) (add x x))))))
(check-sat)
