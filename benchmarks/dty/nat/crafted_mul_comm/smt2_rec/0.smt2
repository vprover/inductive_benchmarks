(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((x nat) (y nat)) nat
    (match x
        ((zero y)
        ((s x0) (s (add x0 y)))
    )))
(define-fun-rec mul
    ((n nat) (m nat)) nat
    (match n
        ((zero zero)
        ((s n0) (add (mul n0 m) m))
    )))
(assert (not (forall ((x nat) (y nat)) (= (mul x y) (mul y x)))))
(check-sat)
