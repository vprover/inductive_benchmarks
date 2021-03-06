(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (s (s v3)) (add (add (add (s v0) (add (s v9) v4)) (add (add (s v11) (s v1)) (s (add v2 (s v9))))) (s (s (add (add (add v7 (s v8)) (s (add v2 (s (s (s v5)))))) (add (s v10) v6)))))) (s (add (s (s (add (add v11 (add v0 (s (s v3)))) (add (s (add v7 (add v5 (s (add (add v2 v10) (s (s v9))))))) v9)))) (s (add (s (add (s v1) (add v2 (s v8)))) (s (add v6 (s (s v4))))))))))))
(check-sat)
