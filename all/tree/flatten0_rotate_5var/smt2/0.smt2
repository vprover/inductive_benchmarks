(declare-datatypes ((nat 0) (list 0) (tree 0))
  (((zero) (s (s0 nat)))
   ((nil) (cons (head nat) (tail list)))
   ((Nil) (node (lc tree) (val nat) (rc tree)))))
(declare-fun app (list list) list)
(assert (forall ((r list)) (= (app nil r) r)))
(assert (forall ((a nat) (l list) (r list)) (= (app (cons a l) r) (cons a (app l r)))))
(declare-fun flatten0 (tree) list)
(assert (= (flatten0 Nil) nil))
(assert (forall ((p tree) (x nat) (q tree))
  (= (flatten0 (node p x q))
     (app (flatten0 p) (cons x (flatten0 q))))))
(assert (not (forall ((p tree) (q tree) (r tree) (x nat) (y nat))
  (= (flatten0 (node (node p x q) y r))
     (flatten0 (node p x (node q y r))))
)))
(check-sat)
