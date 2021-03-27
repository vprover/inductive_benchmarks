(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun-rec equal
    ((x nat) (y nat) (z nat)) Bool
    (match x
        ((zero (match y
                    ((zero (match z
                                ((zero true)
                                ((s z0) false)
                            )))
                    ((s y0) false))
                ))
        ((s x0) (match y
                    ((zero false)
                    ((s y0) (match z
                                ((zero false)
                                ((s z0) (equal x0 y0 z0))
                            )))
                )))
    )))
(assert (not (forall ((x nat)) (equal (add x (add (add x x) x)) (add x (add x (add x x))) (add (add x x) (add x x))))))
(check-sat)
