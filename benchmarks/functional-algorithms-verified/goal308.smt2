; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun count_tree (par (a) (a (tree a)) nat))
(assert (par (a) (forall ((x a)) (= (count_tree a x (Leaf a)) zero))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (count_tree a x (Node a l y r))
  (let ((lc (count_tree a x l)) (rc (count_tree a x r))) (ite (= x y) (s (plus lc rc)) (plus lc rc)))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun insert_braun (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (insert_braun a x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (insert_braun a x (Node a l y r))
  (ite (less a x y) (Node a (insert_braun a y r) x l) (Node a (insert_braun a x r) y l))))))

; mset_tree (insert x t) = {{x}} + mset_tree t
(assert-not (par (a) (forall ((x a) (y a) (t (tree a))) (= (count_tree a y (insert_braun a x t))
  (ite (= x y) (s (count_tree a y t)) (count_tree a y t))))))
