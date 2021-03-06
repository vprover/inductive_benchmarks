(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (add (s (s (s (s (s (add (s (s (s (add (add (s (s v4)) (s v2)) v5)))) (add (s v2) (s v0)))))))) (add zero (s (add (s v1) (s (add (s v3) (s (s (s v4)))))))))) (s (s (add (s (s (s (s (s v2))))) (s (s (s (add (s (add (s (add (add (add (add v3 (s (s v2))) (s zero)) v4) v5)) (s (s (s (add v1 (s (s v4)))))))) (s v0))))))))))))
(check-sat)
