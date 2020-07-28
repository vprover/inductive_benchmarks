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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (s (add (s v7) (add (s (s v4)) (s (s (s v7))))))) (add (add v1 (s (s (add (s (add (add (s (add (s zero) v0)) (s v5)) (s (s v3)))) (add v6 (s v8)))))) (s (s v2)))) (add (s (s (s v1))) (add (add (s (s (s (s (s (s v5)))))) (s v3)) (add (s (s (add (s (s (s v0))) (s (s (s (add zero (add (s v7) (add (add v2 v7) v4))))))))) (add v6 v8))))))))
(check-sat)
