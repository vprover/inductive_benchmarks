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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (s (add (s (add (add (add (s v6) (add (s v3) v4)) (add v5 (s v1))) (s (add (s v5) v8)))) (s (s (s (add (s v7) v0)))))))) (s v2)) (s (s (add (add (s (s (add (s (s (s (add v2 (s (add (s v4) (add v3 (s v5)))))))) (s (add v6 (add v0 (add v1 (s (s v5))))))))) (s v8)) v7)))))))
(check-sat)
