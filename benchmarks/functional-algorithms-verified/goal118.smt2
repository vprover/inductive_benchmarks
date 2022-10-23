(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-const empty (par (a) (tree a)))
(assert (par (a) (= (empty a) (Leaf a))))

; set_tree(empty) = {}
(assert-not (par (a) (forall ((x a)) (not (in_set_tree a x (empty a))))))
