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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat)) (= (add (add (s (add (s (add (s v1) v1)) (add v0 (s (s (s (s (s zero)))))))) (s (add (s v4) (s v3)))) (s (s (add (s (add v2 (s zero))) zero)))) (s (s (add (s v2) (add (add (s (add (s (s v4)) (add (add v1 (add (s v3) (add v0 v1))) (s (s zero))))) zero) (s (s (s (s (s (s zero))))))))))))))
(check-sat)
