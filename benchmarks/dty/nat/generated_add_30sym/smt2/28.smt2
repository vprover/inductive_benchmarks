(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (add (s (add (s (s (add v3 (add (s v8) v0)))) (add (s v1) v6))) (s (s (s (add (s v4) (s (s (add (s (s (add (add (add v2 (s v8)) (s v5)) v7))) (s (s v8)))))))))))) (s (add v4 (s (add v3 (s (add (s v0) (add v6 (s (add (add v8 (s (s (s (add (add v7 v8) (add (s (s v5)) (s (s (s (s (s (s (add (s v1) v2))))))))))))) (s (s v8)))))))))))))))
(check-sat)
