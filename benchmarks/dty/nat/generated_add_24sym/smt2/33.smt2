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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (add (add v0 (s v1)) (s (s (add (add (s v7) v2) (s (add (s v4) (s v5))))))))) (add (s (s v6)) (s (s (s (s (s v3))))))) (add (s (s (add (s v0) (add (s (s v5)) (s (s (add (s (s (s v1))) v4))))))) (add v6 (s (s (add v3 (add v2 (s (s (s (s v7))))))))))))))
(check-sat)
