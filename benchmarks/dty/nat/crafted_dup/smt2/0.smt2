(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(non-erasing add 2)
(injective add (true true))
(declare-fun dup (nat) nat)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (= (dup zero) zero))
(assert (forall ((x nat)) (= (dup (s x)) (s (s (dup x))))))
(assert (not (forall ((v0 nat)) (= (dup v0) (add v0 v0)))))
(check-sat)
