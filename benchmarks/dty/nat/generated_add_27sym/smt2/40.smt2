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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (add (s (s v9)) (s v7)) (add (s v2) v4)) (add (s v1) (s v3))) (add (s (add (s (s (s v0))) (s (s (s (s (s (s v5)))))))) (add v6 (s v8)))) (s (s (add v2 (add v3 (s (add (s (s (s (add (s v4) (s (s v6)))))) (add (add (s (s (s (s v9)))) (s v8)) (add v0 (s (add (s (add v1 (s v7))) v5))))))))))))))
(check-sat)
