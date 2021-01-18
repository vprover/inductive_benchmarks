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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (add (s (s (s (add (s (add (add v3 (s v3)) (s (s (s (add v1 (s v2))))))) (s v0))))) (s (add v1 (s (s v4)))))) (s (s (s (add v3 (s (add (s (s (add (s (s (s (add v0 v4)))) (s (s v3))))) (s (s (add v1 (add v1 (s v2)))))))))))))))
(check-sat)
