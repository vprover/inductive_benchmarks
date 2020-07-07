(set-logic UFDT)
(declare-datatypes ((nat 0) (lst 0)) (((zero) (s (s0 nat))) ((nil) (cons (cons0 nat) (cons1 lst)))))
(define-fun-rec app
    ((l lst) (r lst)) lst
    (match l
        ((nil r)
        ((cons a l0) (cons a (app l0 r))))))
(assert (not (forall ((x lst) (y lst) (z lst)) (= (app x (app y z)) (app (app x y) z)))))
(check-sat)
