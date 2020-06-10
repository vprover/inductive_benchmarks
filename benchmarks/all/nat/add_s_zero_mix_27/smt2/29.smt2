(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (add (s (s (s v3))) (add (add (add (s v4) (add (s v2) v4)) (s (s (s (s (s (s v5))))))) (s (s (add (s v0) (add (s v1) (s (s (s v3)))))))))) (s (add (s (add (s v5) (s (add (s v0) (s (s (s (s (s (s (add (s (add (add v4 (s (s v3))) v2)) v3))))))))))) (s (add (s (s (s (s v4)))) v1))))))))
(check-sat)