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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (add v6 (s v5)) (add (s (s (add (add (add (s v3) (add (s v2) v2)) (add (s v5) (s v6))) v1))) (add (add (s v0) v4) (s v2))))) (add (add v0 (add (add (s (s (s (add (s (s (s (add v6 (s (s (s v5))))))) v1)))) (add v6 (add v2 v2))) (add (add v2 v3) v5))) (s v4))))))
(check-sat)
