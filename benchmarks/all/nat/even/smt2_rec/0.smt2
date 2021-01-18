(set-logic UFDT)
(declare-datatypes ((nat 0))
  (((zero) (s (s0 nat)))))
(define-fun-rec even
    ((n nat)) Bool
    (match n
        ((zero true)
        ((s zero) false)
        ((s (s m)) (even m))
    )))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(assert (not (forall ((x nat) (y nat))
  (=> (and (even x) (even y))
     (even (add x y)))
)))
(check-sat)
