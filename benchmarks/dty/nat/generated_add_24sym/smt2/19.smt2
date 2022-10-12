(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (s (s (s (s (add (s (s (add (s (s v3)) (add (s (add zero (s v1))) (s (s v2)))))) (add (s (s (s v0))) (s v5))))))) (s v4)) (s (s (s (add (s (add (add v2 v3) (add v1 (add (s (s (add v4 (s v5)))) (s (s (s (s (s (s (s (s (s v0))))))))))))) (s zero)))))))))
(check-sat)
