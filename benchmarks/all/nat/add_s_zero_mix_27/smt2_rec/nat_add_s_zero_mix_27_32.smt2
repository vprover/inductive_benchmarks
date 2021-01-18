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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (add (add (s (s (s (s v2)))) (add (s (s (add v4 (s v3)))) (add (s (s (s v4))) (add v7 (add (s (s (add (s v0) (s v6)))) v1))))) (s (add v8 (s v5))))) (s (add v1 (s (add (s v3) (s (s (add (add (add (s (s (s (s (add v6 (s (add (s (add (s (s (s (s v0)))) v8)) v4))))))) (s v5)) (s (add v2 v4))) v7)))))))))))
(check-sat)
