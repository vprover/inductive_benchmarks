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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (add (add (s (s v8)) (s (s v7))) (s (s (add (s v6) v3)))) (add (add v6 (s zero)) (add (add (s (s (s v4))) (add (s (s (add (s v3) (s v2)))) (s v5))) (add (s v1) (s v0))))) (s (add (add (add (s (add (add (s (s v4)) (s (add (add (s v6) (s v6)) (s (s (add (add (s v0) v1) v8)))))) (s (s v3)))) zero) (s (s (s v5)))) (s (add v3 (s (s (add v7 v2)))))))))))
(check-sat)
