(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(injective add (true true))
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (add (add (add (s v7) v8) (add (s v6) (s v3))) (add (s (s (s (add v4 (s (s (s v2))))))) (add (add (s (s (s v5))) (s v1)) (s (add (add (add (s v0) v2) (s v5)) (s zero))))))) (add (add zero (s (s (add (add v5 (s (s (s (s (s (s (add v0 (s (s (add (s v4) (s (s v2))))))))))))) (add v8 (s v5)))))) (add (add (s v2) (add (s (add v6 (s v1))) (s v3))) v7))))))
(check-sat)
