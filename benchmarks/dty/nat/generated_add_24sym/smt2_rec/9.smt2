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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (add (s (s zero)) zero) (s (s (s v3)))) (add (s (s (add (add (add (add v2 (s v7)) (s v5)) (add (s (s v6)) (s v1))) (s v4)))) (s v0))) (add (add (add v3 (s v4)) (s (s (add (add (add (s (s v2)) (s v1)) (add (s (s (s (add v0 (s zero))))) zero)) (add (s v7) v6))))) (s (s (s v5))))))))
(check-sat)
