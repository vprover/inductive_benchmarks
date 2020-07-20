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
(define-fun-rec flatten2
    ((t tree) (l list)) list
    (match t
        ((Nil l)
        ((node p x q) (flatten2 p (cons x (flatten2 q l)))))))
(assert (not (forall ((t tree) (l list))
  (= (app (flatten0 t) l)
     (flatten2 t l)))
))
(check-sat)
