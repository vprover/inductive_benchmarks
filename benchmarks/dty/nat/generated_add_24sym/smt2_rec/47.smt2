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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s v4) (s (add (s (add (s (s v6)) (s v3))) (add (s (add (add (s v0) (add (s v1) v4)) v8)) (add (s (s (add (s v7) (s v2)))) (s v5)))))) (add (s (add (s (add (s (add (add (s (s (s v8))) (s v4)) (s (s (s (s v0)))))) (s (add (add v3 (add v4 v1)) (s (s v2)))))) v5)) (add v6 v7))))))
(check-sat)
