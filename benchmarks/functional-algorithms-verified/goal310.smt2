(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (less a x y) (and (leq a x y) (distinct x y))))))
(assert (par (a) (forall ((x a)) (leq a x x))))
(assert (par (a) (forall ((x a) (y a) (z a)) (=> (and (leq a x y) (leq a y z)) (leq a x z)))))
(assert (par (a) (forall ((x a) (y a)) (=> (and (leq a x y) (leq a y x)) (= x y)))))
(assert (par (a) (forall ((x a) (y a)) (or (leq a x y) (leq a y x)))))
(declare-fun inv_heap (par (a) ((tree a)) Bool))
(assert (par (a) (inv_heap a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (m a) (r (tree a))) (= (inv_heap a (Node a l m r))
  (and (forall ((x a)) (=> (and (in_set_tree a x l) (in_set_tree a x r)) (leq a m x))) (inv_heap a l) (inv_heap a r))))))
(declare-fun insert_braun (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (insert_braun a x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (insert_braun a x (Node a l y r))
  (ite (less a x y) (Node a (insert_braun a y r) x l) (Node a (insert_braun a x r) y l))))))

; heap t -> heap (insert x t)
(assert-not (par (a) (forall ((x a) (t (tree a))) (=> (inv_heap a t) (inv_heap a (insert_braun a x t))))))
