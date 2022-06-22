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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (s (add (add (add (s (add (add (s (add (s v0) v3)) (s v5)) v2)) (s (s (s v5)))) (add v2 (add (s v4) v7))) (add (s v1) (add (s (s v2)) (add v3 (s v6)))))))) (s (add (add (add (add (add v3 v0) (s v2)) (s v2)) (s (add v4 (s (s v5))))) (s (s (s (add (add (add (add v2 (s v6)) (add v1 v7)) v3) (s (s (s (s (s v5)))))))))))))))
(check-sat)
