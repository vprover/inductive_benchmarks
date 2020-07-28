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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (s (add (add (s (s (add (s v6) (add (add (s v0) v5) (s v7))))) (add (add (s (add (s v3) v2)) (s v7)) v4)) (add v6 (s (s v1))))) (s (s (add (add v6 (s (add v0 (add (add v7 (s (s (add v3 v2)))) (s (s (add (add (add v7 (s (s (s v4)))) (s v5)) v1))))))) v6)))))))
(check-sat)
