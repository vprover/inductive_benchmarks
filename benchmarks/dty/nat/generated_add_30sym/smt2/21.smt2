(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (add (add (s (s (s (s (s (s (add (s (s (add (s v4) (s v9)))) (s v7)))))))) (s (add v1 (s v5)))) (s (add v8 (s (s (s v6)))))) (s (add (s v0) (add v2 (s v3))))) (s (add (add (add (s (add (s (add (s (s v7)) v2)) (add (s (s v5)) (s (s (s v8)))))) (s v9)) (s (s (add (s (s (s (add (s (s v0)) (s (add v3 (s v6))))))) v1)))) v4))))))
(check-sat)
