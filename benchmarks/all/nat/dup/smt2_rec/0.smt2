(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun-rec dup
    ((x nat)) nat
    (match x
        ((zero zero)
        ((s x0) (s (s (dup x0))))
    )))
(assert (not (forall ((v0 nat)) (= (dup v0) (add v0 v0)))))
(check-sat)
