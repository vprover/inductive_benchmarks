(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (s (add (add (s (s (s (add (add (add v0 (s (s v5))) (s v2)) (s (add (add (s v4) (s v3)) (s v3))))))) (s v7)) (s (add (add (s v7) v1) (s v6))))))) (add (add (s (s (add (s (add (s (s (add (add (s (s (s (add v6 (s (s v7)))))) (s (add (s (s v7)) (s v4)))) (s v1)))) (add (s v3) v0))) v3))) (s v2)) v5)))))
(check-sat)
