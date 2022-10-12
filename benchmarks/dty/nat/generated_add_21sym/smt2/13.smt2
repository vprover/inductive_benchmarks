(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (add (s v7) (s (add (add (s v2) v6) (s (s (add (s v5) zero)))))))) (s (add (add v1 (add (s v0) v3)) (s (s v4))))) (s (add (s (s (add (s (add (s (add (s (s (add (s v6) (add (add v5 v2) zero)))) (s (s v4)))) (s v3))) (add v7 (s v0))))) v1))))))
(check-sat)
