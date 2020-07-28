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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (add (add (add (s zero) (s (s (s v4)))) (add (s (s zero)) v1)) (add (s (s (add v0 (s v2)))) (add (s v3) (s (s v0)))))) (add (add v2 (add (s (s (s (s (add v0 (s (add (s v0) (s (s (s zero)))))))))) (add zero (s (s (s (add v3 v1))))))) (s v4))))))
(check-sat)
