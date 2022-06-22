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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (add (add (add zero (s (s v4))) v2) (add (s (add v0 (s v3))) (s (add v4 (add (add v1 (s v4)) v4))))) (add (s (s (s (add zero (add (s v0) v4))))) (add (add (add (add v4 v4) v2) (s v3)) (s (add v1 v4))))))))
(check-sat)
