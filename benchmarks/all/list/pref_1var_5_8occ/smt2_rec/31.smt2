(set-logic UFDT)
(declare-datatypes ((lst 0) (nat 0)) (((nil) (cons (cons0 nat) (cons1 lst))) ((zero) (s (s0 nat)))))
(define-fun-rec app
    ((l lst) (r lst)) lst
    (match l
        ((nil r)
        ((cons a l0) (cons a (app l0 r)))
    )))
(define-fun-rec pref
    ((l lst) (r lst)) Bool
    (match l
        ((nil true)
        ((cons a x)
            (match r
                ((nil false)
                ((cons b y) (and (= a b) (pref x y)))
            )))
    )))
(assert (not (forall ((v0 lst)) (pref (app (app (app v0 v0) (app v0 v0)) v0) (app (app v0 (app v0 v0)) (app v0 (app (app v0 (app v0 v0)) v0)))))))
(check-sat)
