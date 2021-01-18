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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (s (s (add (s v2) (s (add (s v6) (add (s (add (s v5) zero)) (add (s v5) v4))))))) (s (s (add v3 (add (s v0) (s v1)))))) (add v4 (s (add (add (s v3) (add (add (s v5) v5) (s (s (s v1))))) (s (s (s (add (s (s zero)) (add (add v6 (s v0)) v2))))))))))))
(check-sat)
