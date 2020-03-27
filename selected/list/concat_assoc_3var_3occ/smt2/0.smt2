(set-logic UFDT)
(declare-datatypes ((nat 0) (lst 0)) (((zero) (s (s0 nat))) ((nil) (cons (cons0 nat) (cons1 lst)))))
(declare-fun app (lst lst) lst)
(assert (forall ((r lst)) (= (app nil r) r)))
(assert (forall ((a nat) (l lst) (r lst)) (= (app (cons a l) r) (cons a (app l r)))))
(assert (not (forall ((x lst) (y lst) (z lst)) (= (app x (app y z)) (app (app x y) z)))))
(check-sat)
