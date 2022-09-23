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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (add (add (s zero) (add (s (add (s v6) v7)) (add v3 (s v4)))) (s (s (s v2)))) (s (add (s (add (s v1) v8)) (s (add (s v5) (add (s v4) v0)))))) (s (s (add (add (s (s (s (add (add (add (s v4) v4) (add (add v8 v5) (s (s (s (add v3 (s (s (s (add v2 (add v6 (s v0)))))))))))) zero)))) v7) v1)))))))
(check-sat)
