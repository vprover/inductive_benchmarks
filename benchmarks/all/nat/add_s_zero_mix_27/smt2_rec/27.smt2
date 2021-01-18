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
(assert (not (forall ((v0 nat) (v1 nat) (v2 nat) (v3 nat) (v4 nat) (v5 nat) (v6 nat) (v7 nat) (v8 nat) (v9 nat) (v10 nat) (v11 nat) (v12 nat)) (= (add (add (add (s v4) (add (s v5) v8)) (s (add (s v10) (s (add (add (s v1) v11) v9))))) (add (s (add (s v7) (add v0 (add v2 (s v3))))) (add (s v10) (s (add v6 (s (s v12))))))) (s (s (add (s v9) (add (add (add (s (s (s v3))) (add v4 (add (add (s v10) (add (add (add (add (s (s v5)) v0) (add (s (add v11 (s v12))) (s v7))) v1) v8)) v10))) v6) (s v2)))))))))
(check-sat)
