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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat)) (= (add (add (add (add (s v2) v1) (s (s v5))) v0) (add (add (add (add v4 (s v7)) (s v8)) (add (s v5) (s (add v6 (s (s v3)))))) (add (s v0) (add v0 (s zero))))) (add (add (add (add v0 (add (s (s (add (s (add (add zero v0) v1)) (add v5 (s (s (s (s (add v7 v2))))))))) (s (s (add v6 v3))))) v8) v4) (add (s (s v0)) v5))))))
(check-sat)
