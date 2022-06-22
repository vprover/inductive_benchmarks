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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (add (add v5 (s v1)) (s v3)) (add (s (s v2)) (s v5))) (s (add (s v4) (add (s (add (s v0) (add (add (s v4) (s v7)) (s (s v6))))) (s (s zero))))))) (add (s (add v2 v4)) (s (s (s (s (add (add v4 v6) (s (add (s (add (add (s (s (s (add v3 (s (add (s v1) (s (s v0)))))))) (s (s zero))) (add v5 v5))) v7))))))))))))
(check-sat)
