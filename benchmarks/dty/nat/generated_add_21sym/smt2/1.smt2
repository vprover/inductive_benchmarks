(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (s (s (add (s v6) (add (add (s v0) v5) (s v7))))) (add (add (s (add (s v3) v2)) (s v7)) v4)) (add v6 (s (s v1))))) (s (s (add (add v6 (s (add v0 (add (add v7 (s (s (add v3 v2)))) (s (s (add (add (add v7 (s (s (s v4)))) (s v5)) v1))))))) v6)))))))
(check-sat)
