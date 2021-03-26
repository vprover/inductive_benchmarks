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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (s (s v5)) (add (add (add (s v0) (add (s v1) v1)) (s (s v2))) (s v4))) (add (s v6) (s (s v3)))) (add (s (s (s (add (add v4 (add v6 v1)) v1)))) (s (s (add (add (s (s v0)) v2) (s (add (s (s v5)) v3))))))))))
(check-sat)
