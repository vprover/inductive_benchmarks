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
(define-fun-rec size
    ((t tree)) nat
    (match t
        ((Nil zero)
        ((node p x q) (s (add (size p) (size q)))))))
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
(define-fun-rec rotateLeft
    ((t tree)) tree
    (match t
        ((Nil Nil)
        ((node p x q) (match q
            ((Nil (node p x Nil))
            ((node u v w) (rotateLeft (node (node p x u) v w)))))))))
(define-fun-rec rotateRight
    ((t tree)) tree
    (match t
        ((Nil Nil)
        ((node p x q) (match p
            ((Nil (node Nil x q))
            ((node u v w) (rotateRight (node u v (node w x q))))))))))
(define-fun-rec mirror
    ((t1 tree) (t2 tree)) Bool
    (match t1
        ((Nil (= t2 Nil))
        ((node p x q) (match t2
            ((Nil false)
            ((node u v w) (and (= x v) (mirror u q) (mirror w p)))))))))
(assert (not (forall ((x tree) (y tree))
  (=> (mirror x y) (= (rev (flatten2 x nil)) (flatten2 y nil)))
)))
(check-sat)
