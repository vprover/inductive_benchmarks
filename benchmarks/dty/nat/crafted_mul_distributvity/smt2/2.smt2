(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(non-erasing add 2)
(injective add (true true))
(declare-fun mul (nat nat) nat)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (= (mul zero y) zero)))
(assert (forall ((x nat) (y nat)) (= (mul (s x) y) (add (mul x y) y))))
(assert (not (forall ((x nat) (y nat) (z nat)) (= (mul (add x y) z) (add (mul z x) (mul y z))))))
(check-sat)
