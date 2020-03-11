(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (add (s (add (s v3) (s (s v4)))) (s (add v2 (s (s (s v1))))))) (add (s (add (add v5 (s v0)) (s (add v1 (s v6))))) (s (s v4)))) (s (s (s (add (s (s (add (add (s v1) v0) (s (add v3 (add (s (s (add (s (s (s v4))) (s v6)))) v2)))))) (add v4 (s (add v1 (s v5))))))))))))
(check-sat)
