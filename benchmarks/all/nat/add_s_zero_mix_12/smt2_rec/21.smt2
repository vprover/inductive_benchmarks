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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat)) (= (add (add (s (add v2 (s v1))) v0) (s (add (add (s v3) zero) (s (s zero))))) (add (add (s v3) (add (s v2) (add (s (s (s (add v1 (s zero))))) zero))) v0)))))
(check-sat)
