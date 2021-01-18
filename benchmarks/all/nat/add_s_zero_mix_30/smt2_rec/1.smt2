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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (add (s (add (s (s (add (s (add (add (s v3) (s v4)) (add (s v0) (s v9)))) (s v4)))) (add (s (add v6 (s v7))) (s (s (s (add (s (s v2)) v1))))))) (s (add v8 (s v5))))) (add v7 (add (add (s (s (s (add (add (add (s v1) v4) (s (s v2))) (add (s (s (add (s v9) (s (add (add (s (s (s (s (s v8))))) (s v6)) (s (s v4))))))) v0))))) (s v3)) v5))))))
(check-sat)
