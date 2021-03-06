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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (s (s (add (s (s (s (s (add (s (s (s v2))) (add (add v8 (s v5)) v3)))))) (add (s v2) (add (s v7) v6)))))) (add (s (add (add v9 (s v1)) (s v0))) v4)) (add (s (add (add (s (s (add (s (s v2)) v8))) v4) (s v0))) (add (s (s v1)) (add (s v9) (s (s (add (s (s (add v5 (add (s v2) v7)))) (s (add v6 (s v3)))))))))))))
(check-sat)
