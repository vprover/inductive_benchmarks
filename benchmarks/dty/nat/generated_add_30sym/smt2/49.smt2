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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add (s (s v1)) (s (s (add (s (add v3 (s (s (s v6))))) v0))))) (add (add (add v6 (s v7)) (s (s v9))) (s (add (s (add (s v8) (s v4))) (add (s v2) (s (s v5))))))) (add (s (s (s (s v5)))) (add (add (add (add (s v9) v7) (add (add (s (s v3)) (s (add (s v6) v2))) (s (s (s (s (add (add v0 (s (s (s v4)))) v6))))))) (s (s (s v1)))) v8))))))
(check-sat)
