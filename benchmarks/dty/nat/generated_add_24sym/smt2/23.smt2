(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat)) (= (s (add (add zero (s v1)) (add (s (s (add (s (s v0)) (s (add (s (s (add (add (s v2) zero) (s v0)))) (add (s (s v3)) (s v1))))))) (s v1)))) (s (s (s (add (s (add (add (s (s (s zero))) v1) (add v0 zero))) (s (add v3 (add (add (add (s (s (s v2))) (s (s v1))) v0) (s (s v1)))))))))))))
(check-sat)
