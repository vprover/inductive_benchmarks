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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (s (s (add (s (s (add v5 (s (s v5))))) (s (s (add (add (s v2) (add (add (s v7) (s v4)) v6)) (s v5))))))))) (s (add (s v0) (add (s v1) v3)))) (s (s (s (add v3 (s (add (add (s (s (add (add v5 (s v5)) v6))) (s (s (add (add (s v7) (s (add v4 (s v2)))) v0)))) (s (add (s (s (s (s v1)))) v5))))))))))))
(check-sat)
