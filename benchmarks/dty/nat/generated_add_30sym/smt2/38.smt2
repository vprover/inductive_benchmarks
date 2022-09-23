(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(non-erasing add 2)
(injective add (true true))
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (s (add (s (s (add (add (add (s v0) v11) (add (s (s (s v3))) (s v2))) (add (s v8) (add (add (add v1 (add (s v5) v7)) (s v4)) (s (s v6))))))) (s (s (s (add (s v10) (s v9))))))) (s (s (add (add (add (s (s (s v3))) (s (add (add v8 (add (add (add v6 v9) (s (s (s (s v10))))) v1)) v7))) (s v5)) (add (s (s (add (s (s (s (s v11)))) (s v0)))) (add v4 v2)))))))))
(check-sat)
