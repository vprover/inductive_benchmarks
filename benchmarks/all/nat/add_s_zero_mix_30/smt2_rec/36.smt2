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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (add (add (s (s v8)) (s (s v7))) (s (s (add (s v6) v3)))) (add (add v6 (s zero)) (add (add (s (s (s v4))) (add (s (s (add (s v3) (s v2)))) (s v5))) (add (s v1) (s v0))))) (s (add (add (add (s (add (add (s (s v4)) (s (add (add (s v6) (s v6)) (s (s (add (add (s v0) v1) v8)))))) (s (s v3)))) zero) (s (s (s v5)))) (s (add v3 (s (s (add v7 v2)))))))))))
(check-sat)
