(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-const LeafP (par (a b) (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-fun in_set_ptree (par (a b) (a (ptree a b)) Bool))
(assert (par (a b) (forall ((x a)) (not (in_set_ptree a b x (LeafP a b))))))
(assert (par (a b) (forall ((x a) (l (ptree a b)) (y a) (z b) (r (ptree a b))) (= (in_set_ptree a b x (NodeP a b l y z r)) (or (= x y) (in_set_ptree a b x l) (in_set_ptree a b x r))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun bst (par (a) ((tree a)) Bool))
(assert (par (a) (bst a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (bst a (Node a l x r))
  (and (forall ((y a)) (=> (in_set_tree a y l) (less a y x))) (forall ((y a)) (=> (in_set_tree a y r) (less a x y))) (bst a l) (bst a r))))))
; these are supposed to be uninterpreted and defined by their specification below
(declare-fun joinp (par (a b) ((ptree a b) a (ptree a b)) (ptree a b)))
(declare-fun invp (par (a b) ((ptree a b)) Bool))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (r (ptree a b)) (y a)) (= (in_set_ptree a b y (joinp a b l x r))
  (or (in_set_ptree a b y l) (= x y) (in_set_ptree a b y r))))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b)))
  (=> (bst (pair a b) (NodeP a b l x y r)) (bst (pair a b) (joinp a b l x r))))))
(assert (par (a b) (invp a b (LeafP a b))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (r (ptree a b)))
  (=> (and (invp a b l) (invp a b r)) (invp a b (joinp a b l x r))))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b)))
  (=> (invp a b (NodeP a b l x y r)) (and (invp a b l) (invp a b r))))))

(declare-fun split_minp (par (a b) ((ptree a b)) (pair a (ptree a b))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (split_minp a b (NodeP a b l x y r))
  (ite (= l (LeafP a b)) (Pair a (ptree a b) x r) (let ((xl (split_minp a b l))) (Pair a (ptree a b) (Pair_0 a (ptree a b) xl) (joinp a b (Pair_1 a (ptree a b) xl) x r))))))))

; split_min(t) = (m,t') & t != <> -> m in set_tree(t) & set_tree(t) = {m} U set_tree(t')
(assert-not (par (a b) (forall ((t (ptree a b)) (m a) (t' (ptree a b))) (=> (and (= (split_minp a b t) (Pair a (ptree a b) m t')) (distinct t (LeafP a b)))
  (and (in_set_ptree a b m t) (forall ((x a)) (= (in_set_ptree a b x t) (or (= x m) (in_set_ptree a b x t')))))))))
