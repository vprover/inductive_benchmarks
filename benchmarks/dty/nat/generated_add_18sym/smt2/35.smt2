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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (add (add v1 (s v3)) (add zero (add v0 (add v7 (s zero)))))) (add v6 (s (s (add (add (add v4 (add v5 (s v2))) v0) v8))))) (s (s (s (add (add v2 (add (add (add v8 (add v7 v0)) v5) (s (add v0 (add zero v3))))) (add v1 (add zero (s (add (s v4) v6))))))))))))
(check-sat)
