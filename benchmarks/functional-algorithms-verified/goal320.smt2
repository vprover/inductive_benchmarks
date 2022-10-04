; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun heap (par (a) ((tree a)) Bool))
(assert (par (a) (heap a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (m a) (r (tree a))) (= (heap a (Node a l m r))
  (and (forall ((x a)) (=> (and (in_set_tree a x l) (in_set_tree a x r)) (leq a m x))) (heap a l) (heap a r))))))
(declare-fun del_left (par (a) ((tree a)) (pair a (tree a))))
(assert (par (a) (forall ((x a) (r (tree a))) (= (del_left a (Node a (Leaf a) x r)) (Pair a (tree a) x r)))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_left a (Node a l x r))
  (let ((yl (del_left a l))) (Pair a (tree a) (Pair_0 a (tree a) (yl a)) (Node a r x (Pair_1 a (tree a) (yl a)))))))))
(declare-fun sift_down (par (a) ((tree a) a (tree a)) (tree a)))
(assert (par (a) (forall ((x a) (t (tree a))) (= (sift_down a (Leaf a) x t) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (t (tree a)) (y a)) (= (sift_down a (Node a (Leaf a) x t) y (Leaf a))
  (ite (leq a y x) (Node a (Node a (Leaf a) x (Leaf a)) y (Leaf a)) (Node a (Node a (Leaf a) y (Leaf a)) x (Leaf a)))))))
(assert (par (a) (forall ((l1 (tree a)) (x1 a) (r1 (tree a)) (y a) (l2 (tree a)) (x2 a) (r2 (tree a)))
  (= (sift_down a (Node a l1 x1 r1) y (Node a l2 x2 r2)) (ite (and (leq a y x1) (leq a y x2))
    (Node a (Node a l1 x1 r1) y (Node a l2 x2 r2)) (ite (leq a x1 x2)
      (Node a (sift_down a l1 y r1) x1 (Node a l2 x2 r2)) (Node a (Node a l1 x1 r1) x2 (sift_down a l2 y r2))))))))
(declare-fun del_min_braun (par (a) ((tree a)) (tree a)))
(assert (par (a) (= (del_min_braun a (Leaf a)) (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_min_braun a (Node a l x r))
  (match l (((Leaf a) (Leaf a))
            (_ (let ((yl (del_left a l))) (sift_down a r (Pair_0 a (tree a) (yl a)) (Pair_1 a (tree a) (yl a)))))))))))

; heap t & braun t -> heap (del_min t)
(assert-not (par (a) (forall ((t (tree a))) (=> (and (heap a t) (braun a t)) (heap a (del_min_braun a t))))))
