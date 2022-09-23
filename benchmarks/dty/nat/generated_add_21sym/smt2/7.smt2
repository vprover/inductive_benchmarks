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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (s (s (add (s (s v6)) (s (add (add (s (s v4)) (s v1)) (add v3 (s (s (s (add (add (add v5 (s v2)) v4) v0))))))))))) (s (s (s (add (add v6 (add (s (s (s (s (s v1))))) (s (s (s v4))))) (add (add v0 (s v2)) (add (s v3) (add v5 v4)))))))))))
(check-sat)
