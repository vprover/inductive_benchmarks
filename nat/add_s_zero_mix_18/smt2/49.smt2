(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (add (s (s v3)) (add (s (add (s (s v1)) (add (s v3) (s v4)))) (s (s (add (s v2) (s (s v0))))))) (s (s (s (add (s (s (add (s v1) (add (add (s (s v4)) (s (s (s (add v2 (s v0)))))) v3)))) v3))))))))
(check-sat)
