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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat)) (= (add (add (add (s v1) (add v6 (s v7))) (s (add (s (s (add (add (s (s v2)) (s v3)) (add (s v4) v4)))) (s (add (s (s v0)) v7))))) (add (s v0) v5)) (add (s v7) (s (add (add (add v0 (s v2)) (add (s (add v1 (s v0))) (add (add (add (s (s (s v3))) (s v5)) (s (add v4 (s (s (s v4)))))) v7))) v6)))))))
(check-sat)
