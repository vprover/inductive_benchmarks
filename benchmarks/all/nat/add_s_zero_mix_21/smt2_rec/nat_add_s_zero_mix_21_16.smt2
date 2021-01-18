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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (add (s v7) (s v5)) (add v4 (add (s v3) (add (add (s v1) v2) (s v1))))) (s (s (s (add v0 (s (s (s v6))))))))) (s (s (add v0 (add (add (add (add (add (s v3) (s (s (add v1 (s (s (s (s (add (s v7) (s v5)))))))))) v1) (s v6)) v2) v4))))))))
(check-sat)
