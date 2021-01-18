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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat)) (= (s (add (add (s v1) (add zero (s v0))) (s (add (s v2) (add v3 (s v2)))))) (add (add (s (add v2 (s (s (add (s v3) v0))))) v1) (s (s (add zero v2))))))))
(check-sat)
