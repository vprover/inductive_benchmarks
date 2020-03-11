(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (add (add (s v0) (s (s v0))) (add (s (add (add v3 (s v4)) v1)) (add v2 (add (s v4) zero))))) (add zero (add (s v1) (add (add v4 (add v0 v0)) (s (s (s (add (s (s v3)) (s (add v4 v2)))))))))))))
(check-sat)
