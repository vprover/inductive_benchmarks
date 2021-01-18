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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (add (add (s v3) (s v0)) (s (s v4))) (s (add (add (add v3 (s v1)) (add (s v6) (s v2))) (s v2)))) v5) (add (s (add (s v2) (add (add (s v1) v2) (add (s (s (add (add v3 (s v0)) (s (s v5))))) (add v4 (s v3)))))) v6)))))
(check-sat)
