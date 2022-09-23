(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(non-erasing add 2)
(injective add (true true))
(declare-fun leq (nat nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (leq zero y)))
(assert (forall ((x nat)) (not (leq (s x) zero))))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (s (add (s (add (s v0) (add (s (s v4)) v5))) (add (add (s (s v2)) v3) (s (s zero))))) (add (s zero) v1)) (s (add (s (s (add (s (add v1 (add (s zero) v0))) (s (s (s (s zero))))))) (add (add v5 v4) (add (s v3) v2))))))))
(check-sat)
