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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (add (s v1) (s (add (s (s (s (add (s (add v3 (s v0))) (s v5))))) (s (add (add (add v4 (s v9)) (add (s (add (add (s v7) v2) v1)) (s v6))) (add (s v8) (s v6))))))) (s (add (add v6 v0) (s (s (add (add (add (s (add (s (s (s (add (s (add (s v9) (s (add (s v1) (s (s (s v8))))))) (add v6 v5))))) v1)) (s v7)) v3) (add v4 v2))))))))))
(check-sat)
