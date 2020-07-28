(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun id ((x nat)) nat x)
(assert (not (forall ((x nat) (y nat)) (= (add (id x) y) (add y x)))))
(check-sat)
