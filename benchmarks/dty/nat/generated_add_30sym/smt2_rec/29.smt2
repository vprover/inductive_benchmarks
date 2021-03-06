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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (s (s (s (add (add (s (add (s zero) (add (s v1) (s (add (add (s v6) (s v4)) (s (add (add v8 (s v7)) (add (s (s v5)) (s v6))))))))) (add v6 (add (s (s v2)) v4))) (add v3 (s v0)))))) (add (s (add (add (s (add v6 (s (add v8 (add (s (s (add (s (s v4)) (add (s v6) (s zero))))) v6))))) v4) (add (s (s (add v2 v7))) (s (s (s (s (add (s v3) (s v0))))))))) (add v1 v5))))))
(check-sat)
