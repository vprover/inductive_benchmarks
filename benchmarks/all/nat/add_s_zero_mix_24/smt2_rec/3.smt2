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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (add (add (s (add (s v6) v4)) (add (add (s v8) v3) (s (add (s v0) (s v0))))) (add v1 (add v2 (s (s (add v5 (add (s v1) (add v7 (s zero))))))))))) (add (add (add (add v5 (s (s zero))) (s v2)) (add (add (s (add (s v8) v0)) (s v4)) (add (s (add (s (s v6)) v1)) (s (add (s (add v1 v7)) v3))))) (s v0))))))
(check-sat)
