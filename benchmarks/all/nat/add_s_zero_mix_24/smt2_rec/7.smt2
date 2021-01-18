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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (s (s (add (add (s (s (s (add (s v2) (add v1 (s (s v0))))))) (add (s (add v3 (s v5))) (s (s (add (add v4 (add (s v5) v0)) v3))))) (s v0)))) (s (add (s (s (s (add (s (add (s (s v3)) (add (s (add v0 (add (add v3 (add (s v5) (s (s v0)))) v4))) (s (add (s (s v0)) v5))))) v1)))) v2))))))
(check-sat)
