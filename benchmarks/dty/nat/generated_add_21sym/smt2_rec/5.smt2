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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (add v6 (s v4)) (s v0)) (add (s (s v3)) (add (s (s (add (add v1 (s v2)) (s (s (s (s v4))))))) (s (s v5))))) (s (add (s (add (s (s v5)) (s (s (s (add (s (s v4)) v0)))))) (add (add v6 (add v3 (s v1))) (s (add v2 (s (s v4)))))))))))
(check-sat)
