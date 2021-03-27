(set-logic UFDT)
(declare-datatypes ((nat 0)) (((zero) (s (s0 nat)))))
(define-fun-rec add
    ((n nat) (m nat)) nat
    (match n
        ((zero m)
        ((s n0) (s (add n0 m))))))
(define-fun-rec mul
    ((n nat) (m nat)) nat
    (match n
        ((zero zero)
        ((s n0) (add (mul n0 m) m)))))
(assert (not (forall ((x nat) (y nat) (z nat)) (= (mul (add x y) z) (add (mul z x) (mul y z))))))
(check-sat)
