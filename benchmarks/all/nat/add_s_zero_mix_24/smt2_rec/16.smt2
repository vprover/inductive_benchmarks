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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat)) (= (s (add v1 (s (add (add (add (s v9) v3) (add (s (add (s (s (add (s v4) (s v8)))) (s v7))) (add v0 (s (add v2 (s (add (s v6) v5))))))) (s v8))))) (s (add v1 (s (add (s (add (add (s (s v6)) (s v9)) v3)) (add (add (add (add v7 (add (s v2) (add (s v4) (s (s v8))))) (s (s v5))) v8) (s v0))))))))))
(check-sat)
