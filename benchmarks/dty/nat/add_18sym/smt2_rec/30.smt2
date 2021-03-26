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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (add (s (add v5 (s v3))) (s (add v2 (s v3)))) (s (s (add v0 (add v6 (s v4)))))) (add (add (s zero) v1) v6)) (add (add (add v0 (s v3)) v3) (add (s (s (add v2 (s v6)))) (add (add (add v4 (s (add v5 v1))) (s zero)) (s (s v6)))))))))
(check-sat)
