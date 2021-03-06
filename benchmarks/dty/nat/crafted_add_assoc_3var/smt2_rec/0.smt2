(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(assert (not (forall ((x nat) (y nat) (z nat)) (= (add x (add y z)) (add (add x y) z)))))
(check-sat)
