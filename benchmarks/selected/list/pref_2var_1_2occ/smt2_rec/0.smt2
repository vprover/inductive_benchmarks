(set-logic UFDT)
(declare-datatypes ((lst 0) (nat 0)) (((nil) (cons (cons0 nat) (cons1 lst))) ((zero) (s (s0 nat)))))
(define-fun-rec pref
    ((l lst) (r lst)) Bool
    (match l
        ((nil true)
        ((cons a x)
            (match r
                ((nil false)
                ((cons b y) (and (= a b) (pref x y)))))))))
(define-fun-rec app
    ((l lst) (r lst)) lst
    (match l
        ((nil r)
        ((cons a l0) (cons a (app l0 r))))))
(assert (not (forall ((x lst) (y lst)) (pref x (app x y)))))
(check-sat)
