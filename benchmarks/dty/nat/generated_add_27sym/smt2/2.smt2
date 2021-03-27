(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (s (add (add (s (s (s (s v6)))) (add (s (add (add v1 (s v4)) (s (s v8)))) v7)) (add (s (add v5 (add v3 (add (add (s v5) v0) (s v9))))) (add (s v0) (s v2)))))) (s (add (s v6) (add (s (s (s (add (add (s v4) (add (s (add (s v2) v3)) v9)) v7)))) (add (s (add v1 (s (add (s (add (s v8) (s v5))) v5)))) (add (s (s v0)) v0)))))))))
(check-sat)