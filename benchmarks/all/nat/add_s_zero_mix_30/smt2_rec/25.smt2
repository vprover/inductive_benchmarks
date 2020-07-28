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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (s (add (add (s v7) (s (s (s (s (add (s (add (s (s (s (s v2)))) (add (s (s v0)) v1))) (s (s v6)))))))) (add (s (s v4)) (s (add v1 (s (add v3 (s v5))))))))) (s (add (add (s (s (add (s (s (s (s (add (s (s v2)) v6))))) (s (s (add (s (add (add (s v4) (s v3)) (s (s (s v1))))) v7)))))) (add v0 (s v5))) (s (s (s v1)))))))))
(check-sat)
