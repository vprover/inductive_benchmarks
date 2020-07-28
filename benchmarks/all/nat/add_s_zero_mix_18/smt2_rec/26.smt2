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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat)) (= (add (s (add (s (add (s v0) (add (s (s v4)) v5))) (add (add (s (s v2)) v3) (s (s zero))))) (add (s zero) v1)) (s (add (s (s (add (s (add v1 (add (s zero) v0))) (s (s (s (s zero))))))) (add (add v5 v4) (add (s v3) v2))))))))
(check-sat)
