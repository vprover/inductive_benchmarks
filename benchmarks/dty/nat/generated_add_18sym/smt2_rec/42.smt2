(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun-rec leq
    ((x nat) (y nat)) Bool
    (match x
        ((zero true)
        ((s x0)
            (match y
                ((zero false)
                ((s y0) (leq x0 y0))
            )))
    )))
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (add (add (add v3 (s v4)) (s (s (add (s v2) (s (s (s (s v1)))))))) (s (add (s v0) (s v1))))) (add (add (s (add v2 (add (s v0) v1))) (add v4 v3)) (s (s (s (s (s (s (s (s (s (s v1)))))))))))))))
(check-sat)
