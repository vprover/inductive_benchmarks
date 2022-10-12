(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (s (add v3 (add (s v6) v2))) (s v4)) (add (add (s (s (s v5))) (s (s (s v0)))) (s (add (s v2) (s (s v1)))))) (s (add (s (s (s (add (add v3 v5) (s (s (s (s v1)))))))) (s (s (s (add v2 (add (add v4 (add v6 (s v0))) (s v2))))))))))))
(check-sat)
