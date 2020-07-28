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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (s (s (s (add (add (s (add v1 (s v2))) v0) (add (s (s v0)) (add (s (add (s v4) (s (s v0)))) (add (s v3) (s zero)))))))) (add (add (s (s v0)) (add (s (add (add (s (s zero)) v4) (s (s (s (s v1)))))) (add (add (s v3) (s (s v0))) v0))) (s v2))))))
(check-sat)
