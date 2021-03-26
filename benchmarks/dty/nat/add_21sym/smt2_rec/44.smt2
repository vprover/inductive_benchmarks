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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (add (add (add (s (s v6)) (add v1 (s (s v2)))) (add (s v1) (s v0))) (s v3)) (s (add (s (s (add (s v4) v1))) v5)))) (s (add (s (s (add (s (s (s v0))) (s (s (s (add v1 (add (add (s v1) (add v6 (s v1))) v2)))))))) (add (s (add v4 v3)) v5)))))))
(check-sat)
