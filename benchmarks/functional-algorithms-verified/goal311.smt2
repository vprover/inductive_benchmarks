; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun count_tree (par (a) (a (tree a)) nat))
(assert (par (a) (forall ((x a)) (= (count_tree a x (Leaf a)) zero))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (count_tree a x (Node a l y r))
  (let ((lc (count_tree a x l)) (rc (count_tree a x r))) (ite (= x y) (s (plus lc rc)) (plus lc rc)))))))
(declare-fun del_left (par (a) ((tree a)) (pair a (tree a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_left a (Node a l x r)) (match l
  (((Leaf a) (Pair a (tree a) x r))
    (_ (let ((yl (del_left a l))) (Pair a (tree a) (Pair_0 a (tree a) yl) (Node a r x (Pair_1 a (tree a) yl)))))))))))

; del_left t = (x,t') & t != <> -> mset_tree t = {{x}} + mset_tree t'
(assert-not (par (a) (forall ((x a) (t (tree a)) (t' (tree a))) (=> (and (= (del_left a t) (Pair a (tree a) x t')) (distinct t (Leaf a)))
  (forall ((y a)) (= (count_tree a y t) (ite (= x y) (count_tree a y t') (s (count_tree a y t')))))))))
