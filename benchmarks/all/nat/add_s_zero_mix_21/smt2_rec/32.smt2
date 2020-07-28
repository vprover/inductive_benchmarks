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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (s (add (add (add v5 (s v1)) (s v0)) (add (add (s v1) v6) (add (s (add (s (s v3)) v2)) (s (add (add v6 (s (s v4))) (s v1))))))) (add (add v1 (s (add (add v5 (s (s (add (s v2) (s (s (add (add v6 (add (s (s v1)) (add v6 v1))) v3))))))) (s (s v4))))) (s v0))))))
(check-sat)
