(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (add (s (s (s v7))) (add (s (add (add (s v4) (s (s v8))) (add (add (s v5) v9) (add (s (add (s v2) v2)) (s (s v0)))))) (s (add v6 (s v1))))) (s (add (add (s v11) v3) (s v10)))) (add v1 (s (add (s (add (add (add (s (add v4 (add (add (s (s v3)) v10) (s (s v2))))) v0) (add (add v6 (add (s (s v8)) (s (s (s (add v9 (s v2))))))) (s (s v7)))) v5)) (s (s v11)))))))))
(check-sat)