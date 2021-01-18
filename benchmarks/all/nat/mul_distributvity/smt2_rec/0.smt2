(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((n nat) (m nat)) nat
    (match n
        ((zero m)
        ((s n0) (s (add n0 m)))
    )))
(define-fun-rec mul
    ((n nat) (m nat)) nat
    (match n
        ((zero zero)
        ((s n0) (add (mul n0 m) m))
    )))
(assert (not (forall ((x nat) (y nat) (z nat)) (= (mul x (add y z)) (add (mul x y) (mul x z))))))
(check-sat)
