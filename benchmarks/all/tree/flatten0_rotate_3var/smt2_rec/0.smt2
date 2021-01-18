(set-logic UFDT)
(declare-datatypes ((nat 0) (list 0) (tree 0))
  (((zero) (s (s0 nat)))
   ((nil) (cons (head nat) (tail list)))
   ((Nil) (node (lc tree) (val nat) (rc tree)))))
(define-fun-rec app
    ((l list) (r list)) list
    (match l
        ((nil r)
        ((cons a l0) (cons a (app l0 r))))))
(define-fun-rec flatten0
    ((t tree)) list
    (match t
        ((Nil nil)
        ((node p x q) (app (flatten0 p) (cons x (flatten0 q)))))))
(assert (not (forall ((p tree) (x nat) (y nat))
  (= (flatten0 (node (node p x p) y p))
     (flatten0 (node p x (node p y p))))
)))
(check-sat)
