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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (add (s (add v5 (add (s v1) (s (s v7))))) (add v4 (s (s (add v6 (s (s v3)))))))) (s (add (s (add (s (s v8)) (s v0))) (s v2)))) (s (add v8 (s (s (s (s (add v5 (s (add v3 (add v6 (add (add (s (s (add (s v2) (s (s (add (s (s v4)) v0)))))) v7) (s (s v1)))))))))))))))))
(check-sat)
