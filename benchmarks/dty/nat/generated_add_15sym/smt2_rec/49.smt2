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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (add (s (add v5 (s v2))) v6) (s (add (s v3) v0))) (add (s (add (s v1) v4)) (s v6))) (add (add (s (add (s v6) (add v0 (s v1)))) (add (add v2 (s v6)) (s v5))) (add (s (s v4)) v3))))))
(check-sat)
