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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (add (s (s (add (s (s (s v0))) v7))) (s (add (s (s (add (s (s v1)) v4))) (add (add (add v10 (s zero)) (s (add v6 (s (add (s (add (s v8) v5)) v9))))) (add (s v2) (add (s v5) v3)))))) (add (add v4 v10) (add (s v5) (s (add (s (add (s v8) (s (add (add (add (add (s (s (s v7))) v6) (s (s v2))) v0) v9)))) (s (add zero (add (s v1) (s (s (add v3 (s (s (s v5)))))))))))))))))
(check-sat)
