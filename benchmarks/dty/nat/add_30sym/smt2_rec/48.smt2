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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat)) (= (add (s (s (add (add v1 (s (s (s (add (s (add v7 (s v0))) (add (s (s v10)) v9)))))) (s (s (add (s v5) (s (s v2)))))))) (s (add (add (s v3) (s v8)) (s (add v6 (s v4)))))) (add (s (s (add v3 (add (s (add v10 (s (add (s (add v7 (add v5 (s (s (s (s (s (s v4))))))))) v6)))) (add (s v2) (s (s v8))))))) (add (s (s (add (s v1) (s (s v9))))) v0))))))
(check-sat)
