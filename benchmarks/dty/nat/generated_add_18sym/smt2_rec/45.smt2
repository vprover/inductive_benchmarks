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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat)) (= (add (add (add (s v0) (s v2)) (s v1)) (s (s (add (s (add (s v2) (s (s (s v0))))) (add (s v3) v1))))) (s (s (add (add (s v3) (s (s (add v0 (add v1 (s v1)))))) (add (s v2) (add v0 (s (s (s (s v2)))))))))))))
(check-sat)
