(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (add (add v2 (s v3)) (add (s (add (s (s (s v4))) (s v7))) (s (s (s (add (s (s (add v0 (s v4)))) (add (s v1) (s v6)))))))))) (add (add (add v6 (s v6)) zero) (s v5))) (add (add v6 v6) (add (add (s v6) (s (add (s (s (add (s (s (s (s (add (s (add v7 (s v2))) (add (s zero) v1)))))) (s (add (s (s (add v0 (s v4)))) (s (s v5))))))) v4))) (s v3)))))))
(check-sat)