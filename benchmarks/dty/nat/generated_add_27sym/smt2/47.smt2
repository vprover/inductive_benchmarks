(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (s (s (s v7))) (s (add (add (add (s v2) v5) (s v6)) (s (s (add (add (s v0) v4) zero)))))) (add (s (s v1)) (add (s (s v0)) (s (s (s (s v3))))))) (s (add (add (s (add (s v2) (add (s (s v0)) (s (s (add v3 (add v0 v4))))))) (add (s (s zero)) (s (add (s v6) (add (s v7) v5))))) (s (s (s (s (s v1)))))))))))
(check-sat)
