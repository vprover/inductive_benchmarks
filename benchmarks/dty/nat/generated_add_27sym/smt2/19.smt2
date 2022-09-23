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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (s (add (add (add (add (add (s v8) (add v5 (s v1))) v4) (s v6)) (add (add (s v0) (s v2)) (add (s v7) v9))) (s (s (s (add (s (add (add v7 (s v10)) (s v3))) (s zero))))))) (add (s (add (add v2 (add (s (s (add v8 zero))) v10)) v7)) (add (s (s (add (add (add (s (s v7)) (s (add v6 (s (add v1 v3))))) (s (s (s (add v9 v5))))) (s (s v0))))) v4))))))
(check-sat)
