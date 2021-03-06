(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (add (add (s (add (s (s (s (add (s v4) v7)))) (s (add (s (s v1)) (add (s (s (s v3))) (s zero)))))) (s (s v6))) (s (add (add v2 (s v0)) (s (s (s v5)))))))) (s (s (s (s (add (s (add (add v0 v2) (s (add (s zero) (s (add (s (s (s (s v4)))) (add (s (s v7)) v1))))))) (add v3 (s (s (add (s (s (s (s v5)))) (s v6))))))))))))))
(check-sat)
