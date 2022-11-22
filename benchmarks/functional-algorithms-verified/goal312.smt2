(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun inv_heap (par (a) ((tree a)) Bool))
(assert (par (a) (inv_heap a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (m a) (r (tree a))) (= (inv_heap a (Node a l m r))
  (and (forall ((x a)) (=> (and (in_set_tree a x l) (in_set_tree a x r)) (leq a m x))) (inv_heap a l) (inv_heap a r))))))
(declare-fun del_left (par (a) ((tree a)) (pair a (tree a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_left a (Node a l x r)) (match l
  (((Leaf a) (Pair a (tree a) x r))
    (_ (let ((yl (del_left a l))) (Pair a (tree a) (Pair_0 a (tree a) yl) (Node a r x (Pair_1 a (tree a) yl)))))))))))

; del_left t = (x,t') & t != <> & heap t -> heap t'
(assert-not (par (a) (forall ((x a) (t (tree a)) (t' (tree a))) (=> (and (= (del_left a t) (Pair a (tree a) x t')) (distinct t (Leaf a)) (inv_heap a t)) (inv_heap a t')))))
