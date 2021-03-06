(set-logic UFDT)
(declare-datatypes ((nat 0))
  (((zero) (s (s0 nat)))))
(declare-fun add (nat nat) nat)
(declare-fun even (nat) Bool)
(assert (forall ((y nat)) (= (add zero y) y)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (even zero))
(assert (not (even (s zero))))
(assert (forall ((x nat)) (= (even (s (s x))) (even x))))
(assert (not (forall ((x nat) (y nat))
  (=> (and (even x) (even y))
     (even (add x y)))
)))
(check-sat)
