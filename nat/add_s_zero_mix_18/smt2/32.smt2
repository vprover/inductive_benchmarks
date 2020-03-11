(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (s (add (add v4 (add v5 (s v3))) (add v7 (add (add v2 (s v1)) v0)))) (add (add (s (s v1)) (add (s zero) v6)) v4))) (s (add (add (add v4 v1) zero) (add (add (s (s (add (s (add (s (s (add v6 (s v3)))) v0)) v7))) (add v1 v5)) (add v2 v4))))))))
(check-sat)
