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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (s (add (s (add (s (add v1 (s (s v0)))) (s v3))) (s (s (add v2 (s v4))))))) (s (s (s (s (add (add (s v4) (add (s (s v2)) v0)) (s (s (add (s v3) v1))))))))))))
(check-sat)
