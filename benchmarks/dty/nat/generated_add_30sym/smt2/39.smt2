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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (s (s (add (s (s (s (s v4)))) (s (add (s v5) v6))))) (add (add (add (add v11 (s v8)) (s (add (add v7 (s v11)) v1))) (add (s (s v1)) v10)) (add (s (add v9 (add v3 (s v2)))) (s v0)))) (add (add (add (add (add (s (add v4 (s (s (s v7))))) (s (s v5))) (s (add v1 (s (add (s v6) v8))))) (add v1 (add (s v11) (add v11 (s (s v0)))))) (add v10 (s (s (s v9))))) (add v2 (s v3)))))))
(check-sat)
