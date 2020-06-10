(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (add v2 (s (s (s (s (add (s (s zero)) (add (s v5) (s v1)))))))) (s (add (s (add v3 (s (s v0)))) (s (s v4))))) (add (s (s (s (s (s (add (s (s v4)) (s (s (add (s zero) (add (s v1) (add (s (add v5 (s (s v0)))) v3))))))))))) v2)))))
(check-sat)