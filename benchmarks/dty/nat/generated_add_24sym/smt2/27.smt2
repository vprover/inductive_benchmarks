(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (s (add (s (add (s v6) (add v5 (s v3)))) v4)))) (s (s (add (s (add v6 (s (add (s (add (s v1) v0)) (s v7))))) (add v2 (s v4)))))) (add (add (add v2 (add (add v7 v1) v4)) (s v0)) (s (s (s (add (s v5) (add (s (add (s (add v6 (s v3))) (s (s (s (s v4)))))) (s (s v6))))))))))))
(check-sat)
