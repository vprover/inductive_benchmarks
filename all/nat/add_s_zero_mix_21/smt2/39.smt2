(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (s (s (add (s (s (s (add (add (s (s v3)) (add v5 (s v1))) v4)))) (add (s v0) (s (add (s v2) (s (s zero))))))))) (s (s (add (s v4) (add (s (add v0 zero)) (add (s v5) (s (add (s (s (add (s (s v3)) (s (s (s (s v2))))))) v1)))))))))))
(check-sat)