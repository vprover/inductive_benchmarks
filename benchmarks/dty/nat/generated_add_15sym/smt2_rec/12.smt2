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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (add (s (add (s v3) (add (s (add (s v1) v5)) (s v1)))) (s (s v0))) (add (s v4) v2)) (s (add (add (s (add (add (s v1) v4) v1)) (s (s v5))) (add (add (s (s v3)) v0) (s v2))))))))
(check-sat)
