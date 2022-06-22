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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add zero (add (s v7) (add (s (add v2 (s v6))) (add v0 (s zero)))))) (s (add (add (s v1) (add (s (s (s (s (add (s v8) v9))))) (s (add v3 (s (s (s (s v5)))))))) (s v4)))) (s (s (s (add (add (s (add (s v1) (s (add v8 (s (add (s (s (s v3))) (s (add v9 (s v7))))))))) (add (add (add v6 (s (add zero (add v4 v2)))) (s (s (s (s v0))))) v5)) (s zero)))))))))
(check-sat)
