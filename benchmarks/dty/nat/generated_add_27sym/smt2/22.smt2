(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (add (add (s (add (add (add (s (s zero)) v6) (add (s v2) (s zero))) (s (s (s v7))))) (s (s (add v5 (s v3))))) (s v4)) (add (s v6) (s v5))) (add v1 (s v0))) (s (add (add v3 (add (add (add v6 (s (s v7))) (s (add (s v1) (add v5 v0)))) (s (s zero)))) (add zero (s (add (s v6) (s (add (s (s v4)) (add v5 (s (s (s v2)))))))))))))))
(check-sat)
