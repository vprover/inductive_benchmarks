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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat)) (= (add (add (s (s (add (s (s zero)) v1))) (s (s (s (add v6 (add (s (add (s v3) v6)) (s v4))))))) (add (add (add (s v2) (s v0)) (s v5)) (s (s (s (s v1)))))) (s (add (s (s (add (s (add (add (add v3 (s v0)) (s (s (add (s (s (s zero))) (add (s v5) (s (s v1))))))) (s (add (s v2) (s (add v1 v4)))))) v6))) (s v6)))))))
(check-sat)
