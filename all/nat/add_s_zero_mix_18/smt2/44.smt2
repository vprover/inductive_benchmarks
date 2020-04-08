(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (add (s (add (s v3) v2)) v0)) (s (add (add v4 (add (s v1) (add v3 (s (add (s v4) (s v6)))))) (s v5)))) (add (add v5 (add (add (s v4) (add v1 (s (s (add (s (s (s v4))) v6))))) (add v3 (s (s (add v2 v0)))))) (s v3))))))
(check-sat)