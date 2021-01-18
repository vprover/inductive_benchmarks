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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (add (s (s (add (s (s (s (s v4)))) (s (add (s v5) v6))))) (add (add (add (add v11 (s v8)) (s (add (add v7 (s v11)) v1))) (add (s (s v1)) v10)) (add (s (add v9 (add v3 (s v2)))) (s v0)))) (add (add (add (add (add (s (add v4 (s (s (s v7))))) (s (s v5))) (s (add v1 (s (add (s v6) v8))))) (add v1 (add (s v11) (add v11 (s (s v0)))))) (add v10 (s (s (s v9))))) (add v2 (s v3)))))))
(check-sat)
