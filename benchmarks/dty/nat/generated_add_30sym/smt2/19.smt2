(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (s (add (s (s (s (add (add (s (add (add (add v4 (s v2)) (s v7)) (add (s v2) zero))) (s (add (s v0) v8))) (s (add (s v5) v3)))))) (add (s (add (s v1) (add (s v0) v3))) v6))))) (s (add (add v2 (s v3)) (add (add (s v3) (s (s (s v8)))) (add (s v6) (s (s (add (add (add (add (s (add v7 (s v1))) zero) (s (s (add (s (s (add (s v0) (s v2)))) v0)))) v4) v5)))))))))))
(check-sat)
