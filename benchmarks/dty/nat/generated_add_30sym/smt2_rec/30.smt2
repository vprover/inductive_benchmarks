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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s (add (s v0) (s (s (s (add (s v7) v4)))))) (s (add (add (s v1) v8) (add (s (add (s (add (s v3) (add v2 (s (s v5))))) (s (s v9)))) (s (s (s (s (s v6))))))))) (add (s (add (s (s (s (add (s v6) (s (add (s (s (s (add (add (s (add v5 v8)) v4) (add v2 (s (s (s v1)))))))) (s (s (s v9))))))))) (s (s (s (add v7 (s v3))))))) v0)))))
(check-sat)
