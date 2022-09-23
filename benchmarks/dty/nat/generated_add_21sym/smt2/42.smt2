(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(non-erasing add 2)
(injective add (true true))
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (add v4 (s (s v0))) (add (s (add (s (s (add (s v1) (s (add (s v2) v3))))) (s (s (add (s v4) v3))))) (s (s v5)))) (add (add (s (s v3)) (s v4)) (add (s v4) (s (add (s (add (s (s (add v5 v0))) v1)) (s (add v3 (s (s (s (s v2))))))))))))))
(check-sat)
