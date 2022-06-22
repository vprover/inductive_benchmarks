(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(injective add (true true))
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add (add (add (add (s v3) (add (s (s v0)) (s v5))) (add (add (add v7 (s (s v4))) v6) (s (s v2)))) (s (s v7))) (s v1))) (add (s (s v9)) (s (add (s (s v1)) (s v8))))) (s (add (s v9) (add (s (add v2 (s (add (add (s v3) (add v7 (s (s (s v4))))) (add (add (add v7 (s v6)) (s (s v1))) v1))))) (s (s (add v8 (s (add (s (s v5)) (s (s v0))))))))))))))
(check-sat)
