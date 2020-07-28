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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (s (s (s (add (s (s (s v1))) (add (add v0 (s v5)) (add (add (s (s (s (add (s (s (s v6))) v7)))) (s v4)) v3)))))) (add (s v2) v7)) (s (add (s (add (add (add (s (add (s v2) (add (s v5) (s v7)))) (add (s v1) (s v4))) (add (s (s v7)) (s (s (s (s v0)))))) v3)) (s v6)))))))
(check-sat)
