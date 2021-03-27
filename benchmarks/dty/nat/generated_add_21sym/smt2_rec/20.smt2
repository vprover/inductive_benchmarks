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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (add (s (s v0)) (s (add (s (s (add (add (s v4) v2) v5))) v3))))) (add (s (add (add v8 (s v1)) (s v6))) (s v7))) (s (s (add v1 (add (add (s v0) (add v4 v6)) (s (s (s (s (add (s v8) (s (add (add v5 (s (add v7 (s (s v2))))) v3)))))))))))))))
(check-sat)
