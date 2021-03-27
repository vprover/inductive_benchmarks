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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (s (add (s (s (s (add (s v6) (s (add (add (s (s v3)) (s v2)) v4)))))) (add (s (add v7 (s (s (s v0))))) (s v1))))) (add (add v9 (add (s v8) v5)) v3)) (add (add (add (s (add (s (s (s (s (s (add v2 (s v9))))))) (s (add v7 (add (s (s (s (add v0 v3)))) (s (s v1))))))) (s v4)) (add v8 v3)) (s (add v6 (s v5))))))))
(check-sat)
