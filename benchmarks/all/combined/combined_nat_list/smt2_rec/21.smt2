(set-info :smt-lib-version 2.6)
(set-logic UFDT)
(set-info :category "crafted")
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))
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
(define-fun-rec app
    ((l lst) (r lst)) lst
    (match l
        ((nil r)
        ((cons a l0) (cons a (app l0 r)))
    )))
(define-fun-rec len
    ((x lst)) nat
    (match x
        ((nil zero)
        ((cons e l) (s (len l)))
    )))
(declare-fun outOfBounds (nat) nat)
(define-fun-rec get
    ((x lst) (n nat)) nat
    (match x
        ((nil (outOfBounds n))
        ((cons y z)
            (match n
                ((zero y)
                ((s m) (get z m))
            )))
    )))
(define-fun-rec cnt
    ((x lst) (n nat)) nat
    (match x
        ((nil zero)
        ((cons y z) (ite (= y n) (s (cnt z n)) (cnt z n)))
    )))
(define-fun-rec rev
    ((l lst)) lst
    (match l
        ((nil nil)
        ((cons a l0) (app (rev l0) (cons a nil)))
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
(define-fun less ((x nat) (y nat)) Bool (leq (s x) y))
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
(assert (not (forall ((x lst)) (= (len (rev x)) (len x)))))
(check-sat)
