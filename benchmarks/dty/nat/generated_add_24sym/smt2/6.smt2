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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (s (add (add (add (s (s v7)) (s v4)) (add (add (s (add (s v1) (s v0))) (add (s v6) (s v1))) (s v5))) (add (s v2) (s (s v3))))))) (s (add (add v7 (s (s (add (add (s (add v1 (s (s (s (s (s (s v1)))))))) (s v3)) v6)))) (s (add (add (add (s v4) (s v0)) v5) (s v2)))))))))
(check-sat)
