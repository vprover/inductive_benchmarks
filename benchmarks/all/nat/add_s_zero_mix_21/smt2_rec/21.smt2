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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (s (s (s (s (s (add (s (s (s v3))) (add (add (s v0) (s (s (s (add (s v4) v1))))) (s (s v2)))))))))) (s (add (add (add (s v2) (s (s (s (s (s (s (s (s (s (s (s (add v3 (s v1)))))))))))))) v4) (s (s v0))))))))
(check-sat)
