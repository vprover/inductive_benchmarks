(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add (s v0) (s (s (s (add (s v7) v4)))))) (s (add (add (s v1) v8) (add (s (add (s (add (s v3) (add v2 (s (s v5))))) (s (s v9)))) (s (s (s (s (s v6))))))))) (add (s (add (s (s (s (add (s v6) (s (add (s (s (s (add (add (s (add v5 v8)) v4) (add v2 (s (s (s v1)))))))) (s (s (s v9))))))))) (s (s (s (add v7 (s v3))))))) v0)))))
(check-sat)
