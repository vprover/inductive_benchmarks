(set-logic UFDT)
(declare-datatypes ((nat 0) (lst 0)) (((zero) (s (s0 nat))) ((nil) (cons (cons0 nat) (cons1 lst)))))
(declare-fun app (lst lst) lst)
(injective app (true true))
(declare-fun rev (lst) lst)
(assert (forall ((r lst)) (= (app nil r) r)))
(assert (forall ((a nat) (l lst) (r lst)) (= (app (cons a l) r) (cons a (app l r)))))
(assert (= (rev nil) nil))
(assert (forall ((x nat) (xs lst)) (= (rev (cons x xs)) (app (rev xs) (cons x nil)))))
(assert (not (forall ((x lst)) (= (app x (app (rev x) x)) (app (app x (rev x)) x)))))
(check-sat)
