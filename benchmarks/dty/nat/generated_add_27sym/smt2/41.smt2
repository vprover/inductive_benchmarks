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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (s v3) v9) (add (add (add (add (add v5 (s v0)) (s (s v7))) (s (add (s v4) (s v7)))) (s v2)) (s (add (s v2) (s (s (s v1))))))) (s (add v8 (s v6)))) (add (add (s (s (add (add (s (s (s v2))) (s (s (add v7 v8)))) v9))) (add (s v7) (s (s (add v3 (s v0)))))) (add (s (add (add (s (s (add v1 v2))) v4) v6)) (s v5)))))))
(check-sat)
