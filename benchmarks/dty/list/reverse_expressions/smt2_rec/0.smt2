(set-logic UFDT)
(declare-datatypes ((nat 0) (lst 0)) (((zero) (s (s0 nat))) ((nil) (cons (cons0 nat) (cons1 lst)))))
(define-fun-rec app
    ((l lst) (r lst)) lst
    (match l
        ((nil r)
        ((cons a l0) (cons a (app l0 r)))
    )))
(define-fun-rec rev
    ((l lst)) lst
    (match l
        ((nil nil)
        ((cons a l0) (app (rev l0) (cons a nil)))
    )))
(define-fun-rec revAccInner
    ((x lst) (y lst)) lst
    (match x
        ((nil y)
        ((cons x0 x1) (revAccInner x1 (cons x0 y))))))
(define-fun revAcc
    ((x lst)) lst (revAccInner x nil))
(assert (not (forall ((x lst)) (= (revAcc x) (rev x)))))
(check-sat)
