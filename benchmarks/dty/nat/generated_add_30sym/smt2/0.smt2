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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (s (s v7))) (add (add v6 (s (s (add (s v4) (s v5))))) (add (s v8) (s (s (add (add (add v3 (add (s v7) v1)) (s (s zero))) (s (s (add v9 (s (add (s v2) (s v0)))))))))))) (add (add (add (s (s (add (add v4 (add (add (s v7) v1) v7)) (s (s (s (s (s (add (s v8) (s (s (s v9)))))))))))) v0) v2) (add (s v5) (add (s (s (add zero (s (s (s v3)))))) v6)))))))
(check-sat)
