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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (add (s v7) (add (s (s v4)) (s (s (s v7))))))) (add (add v1 (s (s (add (s (add (add (s (add (s zero) v0)) (s v5)) (s (s v3)))) (add v6 (s v8)))))) (s (s v2)))) (add (s (s (s v1))) (add (add (s (s (s (s (s (s v5)))))) (s v3)) (add (s (s (add (s (s (s v0))) (s (s (s (add zero (add (s v7) (add (add v2 v7) v4))))))))) (add v6 v8))))))))
(check-sat)
