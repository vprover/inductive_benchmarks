(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (add (s v3) (s v0)) v3) (s (add (add (add (s v5) v6) (s (s (s (s (add (s (s v2)) v4)))))) (add (add (s v1) (s v6)) (s v7)))))) (add (s (s v3)) (s (s (add (s (add (add (s v0) (add (add (s v2) v3) (s (s v6)))) (add (s (s v5)) (s (add v4 (add (s v7) (s v6))))))) v1))))))))
(check-sat)