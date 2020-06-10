(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (add (s (add (s (s (add (s v5) (add v1 (s (s v0)))))) (add (s v4) v3))) (add (s (s v6)) (add v3 (s zero)))) (add (s (s (s v1))) v2))) (add (s (add (s (s (add zero (s (s v0))))) (add v5 (add v1 (add (add v6 v3) (add (s (s (s (add (s (s v4)) v3)))) (s v1))))))) (s (s (s v2))))))))
(check-sat)