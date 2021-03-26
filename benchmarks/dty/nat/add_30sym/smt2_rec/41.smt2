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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (add (s v1) (add (add (s v3) (s (s (s v8)))) (s (add (add (s v4) (add (s (s (add (add (s v10) (add (s v0) (add (s v2) (add v5 (s v2))))) v6))) (add (s v2) (s v9)))) (s (s v7)))))) (add (add (add (s (add (s (s (s (s v6)))) v2)) v7) (s (add (add v2 v8) (add (s (s (add (add (s (add (s v10) (s (s (s v5))))) v0) (s (add (s v2) v9))))) v4)))) (s (add (s v3) v1)))))))
(check-sat)
