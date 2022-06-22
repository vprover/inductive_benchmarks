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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat)) (= (s (s (add (add (s (add (s (s v0)) v2)) (s (s zero))) (s (s (s (s (add (s v3) (s v1))))))))) (add (add (s (s v3)) (s (s (s (s (s (add (s zero) (s (s v1))))))))) (s (add (s (s v2)) v0)))))))
(check-sat)
