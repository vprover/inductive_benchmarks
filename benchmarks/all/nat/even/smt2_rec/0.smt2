(declare-datatypes ((nat 0))
  (((zero) (s (s0 nat)))))
(define-fun-rec even
    ((n nat)) Bool
    (match n
        ((zero true)
        ((s zero) false)
        ((s (s m)) (even m)))))
(define-fun-rec plus
    ((n nat) (m nat)) nat
    (match n
        ((zero m)
        ((s n0) (s (plus n0 m))))))
(assert (not (forall ((x nat) (y nat))
  (=> (and (even x) (even y))
     (even (plus x y)))
)))
(check-sat)
