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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add v2 (add (add (s v6) (s v4)) (s (add (s (add (s (add zero (s v5))) v1)) (add v0 (s v3)))))) (add (add (s (s (add (add (add (s v5) v6) (add (s zero) (s v1))) v3))) v2) (add (s v0) (s v4)))))))
(check-sat)
