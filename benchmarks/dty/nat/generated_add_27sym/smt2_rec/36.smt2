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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (add (add v5 (s v1)) (s v3)) (add (s (s v2)) (s v5))) (s (add (s v4) (add (s (add (s v0) (add (add (s v4) (s v7)) (s (s v6))))) (s (s zero))))))) (add (s (add v2 v4)) (s (s (s (s (add (add v4 v6) (s (add (s (add (add (s (s (s (add v3 (s (add (s v1) (s (s v0)))))))) (s (s zero))) (add v5 v5))) v7))))))))))))
(check-sat)
