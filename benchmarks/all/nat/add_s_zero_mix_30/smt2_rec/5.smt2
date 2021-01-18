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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (add (s (s v1)) (s (s (add (s (s v2)) (s (s (add (s (s (s v1))) (s (s (add (s (s (add (add (add v4 (s v0)) (s v7)) v5))) (add (s v6) (s v3)))))))))))))) (s (add (add v7 v1) (s (s (s (add (s v1) (s (add v2 (add (add (s (s v6)) (s (s (s (add (s (s (s v5))) (s (s (s (s (add v3 v0)))))))))) (s (s (s v4))))))))))))))))
(check-sat)
