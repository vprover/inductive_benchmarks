(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (s (s (add (s (s (add (add (s (add (s (s v0)) v4)) (add v2 (s v1))) (add (s v3) (s v5))))) (s (add v3 (s v6))))))) (s (s (add (add v6 (add v2 (add (s (add (add (s v5) v3) (s (s (s (s (s v4))))))) v1))) (s (s (s (add v3 (s v0))))))))))))
(check-sat)
