(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (s (s (add (s (s v1)) v2))) (s v5)) (add (add (s v3) (add (s (s v4)) (s (add (s v0) (s (s v3)))))) (s v6))) (s (add v6 (add (s (add (s (s v4)) (add (s (s (s v2))) v3))) (add v3 (add (add v0 (s (s (s v1)))) (s (s (s v5))))))))))))
(check-sat)
