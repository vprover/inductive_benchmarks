(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (add (add (s (s v7)) (s v1)) (s (add (s (s (s (s (add (s (s (s v5))) v3))))) (add (s (s v0)) (s (add (add (add (s v3) v8) (s v4)) (add (s (s v2)) (s v6))))))))) (add (s v3) (s (add (add (add (s (s (add (add (add (s (s v0)) (add (s v7) (s (s v1)))) (s v6)) (s (s (s (s v2))))))) (s (add (s v4) v8))) (s (s (s (s v3))))) v5)))))))
(check-sat)