(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (add (add (s (add (s v6) v4)) (add (add (s v8) v3) (s (add (s v0) (s v0))))) (add v1 (add v2 (s (s (add v5 (add (s v1) (add v7 (s zero))))))))))) (add (add (add (add v5 (s (s zero))) (s v2)) (add (add (s (add (s v8) v0)) (s v4)) (add (s (add (s (s v6)) v1)) (s (add (s (add v1 v7)) v3))))) (s v0))))))
(check-sat)
