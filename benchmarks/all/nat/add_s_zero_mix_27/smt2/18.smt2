(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (s (add (s (s (s (add (s v6) (s (add (add (s (s v3)) (s v2)) v4)))))) (add (s (add v7 (s (s (s v0))))) (s v1))))) (add (add v9 (add (s v8) v5)) v3)) (add (add (add (s (add (s (s (s (s (s (add v2 (s v9))))))) (s (add v7 (add (s (s (s (add v0 v3)))) (s (s v1))))))) (s v4)) (add v8 v3)) (s (add v6 (s v5))))))))
(check-sat)