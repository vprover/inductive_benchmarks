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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (s (add (s v2) (s (add (s v6) (add (s (add (s v5) zero)) (add (s v5) v4))))))) (s (s (add v3 (add (s v0) (s v1)))))) (add v4 (s (add (add (s v3) (add (add (s v5) v5) (s (s (s v1))))) (s (s (s (add (s (s zero)) (add (add v6 (s v0)) v2))))))))))))
(check-sat)
