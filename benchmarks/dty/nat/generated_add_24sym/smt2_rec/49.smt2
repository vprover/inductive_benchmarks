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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s v7)) (add (s (s (add (add (s v2) (s v0)) v2))) (add (s (s v6)) (s (add (add (add (s v5) (s v3)) v0) (s (add (s v4) (s v1)))))))) (add (add (s v0) (s (add (s (s (add (add v6 v3) (s (add (s (s v2)) (add (s v5) (s (s (s (s (s v7))))))))))) v4))) (add (add v2 v0) (s v1)))))))
(check-sat)
