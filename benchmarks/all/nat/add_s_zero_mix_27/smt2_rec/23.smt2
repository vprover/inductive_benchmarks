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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat)) (= (s (s (add (s (add (add (s (add (add (add (s v0) v1) v8) (s (add (s v11) v9)))) (add (s v6) v1)) (add (add (add (s v8) (s v10)) (add (s v4) v2)) (add v3 (s v7))))) (s v5)))) (s (add (add (s (s (add v2 (s (s (s (add (add (add (add v1 (s (s (add v7 v6)))) v8) (add (s (s (add v4 v1))) (s (add v8 (add v3 (add (s (s v9)) v10)))))) v11))))))) v5) v0))))))
(check-sat)
