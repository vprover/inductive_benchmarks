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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (s (s (add (s (s v1)) (s (s (s (s (add (add v2 (s (s (add (s v3) v4)))) (add v0 (s v5))))))))))) (s (s (s (s v6))))) (add (s (add (add (s (s (add (s v5) (s (s (s (s (s (s (s (s (s (add v0 v1))))))))))))) (s v4)) (add v2 (s (s (s v3)))))) v6)))))
(check-sat)
