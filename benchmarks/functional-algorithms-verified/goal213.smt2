(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-const LeafP (par (a b) (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype triple (par (a b c) ((Triple (Triple_0 a) (Triple_1 b) (Triple_2 c)))))
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
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
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
(declare-fun splitp (par (a b) ((ptree a b) a) (triple (ptree a b) Bool (ptree a b))))
(assert (par (a b) (forall ((x a)) (= (splitp a b (LeafP a b) x) (Triple (ptree a b) Bool (ptree a b) (LeafP a b) false (LeafP a b))))))
(assert (par (a b) (forall ((l (ptree a b)) (y a) (z b) (r (ptree a b)) (x a)) (= (splitp a b (NodeP a b l y z r) x)
  (match (cmp a x y) ((LT (let ((t (splitp a b l x))) (Triple (ptree a b) Bool (ptree a b) (Triple_0 (ptree a b) Bool (ptree a b) (t a b)) (Triple_1 (ptree a b) Bool (ptree a b) (t a b))
                        (joinp a b (Triple_2 (ptree a b) Bool (ptree a b) (t a b)) y r))))
                      (EQ (Triple (ptree a b) Bool (ptree a b) l true r))
                      (GT (let ((t (splitp a b r x))) (Triple (ptree a b) Bool (ptree a b) (joinp a b l y (Triple_0 (ptree a b) Bool (ptree a b) (t a b)))
                        (Triple_1 (ptree a b) Bool (ptree a b) (t a b)) (Triple_2 (ptree a b) Bool (ptree a b) (t a b)))))))))))
(declare-fun union (par (a b) ((ptree a b) (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((t (ptree a b))) (= (union a b (LeafP a b) t) t))))
(assert (par (a b) (forall ((t (ptree a b))) (= (union a b t (LeafP a b)) t))))
(assert (par (a b) (forall ((l1 (ptree a b)) (x a) (y b) (r1 (ptree a b)) (t (ptree a b))) (=> (distinct t (LeafP a b)) (= (union a b (NodeP a b l1 x y r1) t)
  (let ((t' (splitp a b t x))) (joinp a b (union a b l1 (Triple_0 (ptree a b) Bool (ptree a b) (t' a b))) x (union a b r1 (Triple_2 (ptree a b) Bool (ptree a b) (t' a b))))))))))

; inv(t1) & inv(t2) -> inv(union(t1,t2))
(assert-not (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (invp a b t1) (invp a b t2)) (invp a b (union a b t1 t2))))))
