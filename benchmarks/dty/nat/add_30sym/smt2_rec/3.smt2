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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (s (add (s (add v2 (add (s v8) v6))) (s (s (s (add (add v4 (s v2)) (s v7))))))) (s (add v1 (s (add (add (s v5) (add v3 (s (s (s (s (add (add v0 (s v0)) v0))))))) (s v8)))))) (s (add (add (s (add (add v0 (s (s (s (add (s v2) (s (s (s (s v4))))))))) (add (add v5 v3) v6))) v0) (s (s (s (s (add v0 (add (add (add v8 (add v2 (s v1))) (s (s v7))) v8))))))))))))
(check-sat)
