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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add (add (add (add (s v3) (add (s (s v0)) (s v5))) (add (add (add v7 (s (s v4))) v6) (s (s v2)))) (s (s v7))) (s v1))) (add (s (s v9)) (s (add (s (s v1)) (s v8))))) (s (add (s v9) (add (s (add v2 (s (add (add (s v3) (add v7 (s (s (s v4))))) (add (add (add v7 (s v6)) (s (s v1))) v1))))) (s (s (add v8 (s (add (s (s v5)) (s (s v0))))))))))))))
(check-sat)
