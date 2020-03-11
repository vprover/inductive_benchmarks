(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (s (s (add (s (s (s (add (add (add (s v9) v8) (add (s v3) (add (s v4) (s (s (add v5 (s v7))))))) (add (add (s v6) v2) v0))))) (s (s (add (s v1) v8))))))) (add (s (s (add (add (add (s (s (s v4))) (s (s v8))) v7) v0))) (add (s (s (add (add v5 v3) (add v2 (add v6 (s (s v1))))))) (s (add v8 (s (s (s (s v9))))))))))))
(check-sat)
