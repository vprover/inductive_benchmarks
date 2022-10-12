(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (add v1 (add (s (add (s v4) (s v3))) (add (s zero) (s (s (s (s v0))))))) (s (s (s (add (add (s v5) (s v1)) (s (s (s v2)))))))) (add (s v0) (add (s v1) (s (s (s (s (add (s v4) (add (s v3) (s (add zero (s (add (s (s (s (add (s v5) v2)))) (s (s v1))))))))))))))))))
(check-sat)
