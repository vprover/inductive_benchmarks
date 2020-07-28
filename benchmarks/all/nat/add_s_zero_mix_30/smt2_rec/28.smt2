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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (add (s (add (s (s (add v3 (add (s v8) v0)))) (add (s v1) v6))) (s (s (s (add (s v4) (s (s (add (s (s (add (add (add v2 (s v8)) (s v5)) v7))) (s (s v8)))))))))))) (s (add v4 (s (add v3 (s (add (s v0) (add v6 (s (add (add v8 (s (s (s (add (add v7 v8) (add (s (s v5)) (s (s (s (s (s (s (add (s v1) v2))))))))))))) (s (s v8)))))))))))))))
(check-sat)
