(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-const LeafP (par (a b) (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(define-sort ivl (a) (pair a a))
(define-sort itree (a) (ptree (ivl a) a))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-fun in_set_ptree (par (a b) (a (ptree a b)) Bool))
(assert (par (a b) (forall ((x a)) (not (in_set_ptree a b x (LeafP a b))))))
(assert (par (a b) (forall ((x a) (l (ptree a b)) (y a) (z b) (r (ptree a b))) (= (in_set_ptree a b x (NodeP a b l y z r)) (or (= x y) (in_set_ptree a b x l) (in_set_ptree a b x r))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (less a x y) (and (leq a x y) (distinct x y))))))
(assert (par (a) (forall ((x a)) (leq a x x))))
(assert (par (a) (forall ((x a) (y a) (z a)) (=> (and (leq a x y) (leq a y z)) (leq a x z)))))
(assert (par (a) (forall ((x a) (y a)) (=> (and (leq a x y) (leq a y x)) (= x y)))))
(assert (par (a) (forall ((x a) (y a)) (or (leq a x y) (leq a y x)))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun sorted_s (par (a) ((list a)) Bool))
(assert (par (a) (sorted_s a (Nil a))))
(assert (par (a) (forall ((x a)) (sorted_s a (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (zs (list a))) (= (sorted_s a (Cons a x (Cons a y zs))) (and (less a x y) (sorted_s a (Cons a y zs)))))))
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
(declare-const bot (par (a) a))
(declare-fun low (par (a) ((ivl a)) a))
(assert (par (a) (forall ((x (ivl a))) (= (low a x) (Pair_0 a a x)))))
(declare-fun high (par (a) ((ivl a)) a))
(assert (par (a) (forall ((x (ivl a))) (= (high a x) (Pair_1 a a x)))))
; comparison overrides
(assert (par (a) (forall ((x (ivl a)) (y (ivl a))) (= (less (ivl a) x y) (or (less a (low a x) (low a y))
  (and (= (low a x) (low a y)) (less a (high a x) (high a y))))))))
(assert (par (a) (forall ((x (ivl a)) (y (ivl a))) (= (leq (ivl a) x y) (or (less a (low a x) (low a y))
  (and (= (low a x) (low a y)) (leq a (high a x) (high a y))))))))
(declare-fun max_hi (par (a) ((itree a)) a))
(assert (par (a) (= (max_hi a (LeafP (ivl a) a)) (bot a))))
(assert (par (a) (forall ((l (itree a)) (x (ivl a)) (m a) (r (itree a))) (= (max_hi a (NodeP (ivl a) a l x m r)) m))))
(declare-fun max3 (par (a) ((ivl a) a a) a))
(assert (par (a) (forall ((x (ivl a)) (y a) (z a)) (= (max3 a x y z) (max a (high a x) (max a y z))))))
(declare-fun node_ivl (par (a) ((itree a) (ivl a) (itree a)) (itree a)))
(assert (par (a) (forall ((l (itree a)) (x (ivl a)) (r (itree a))) (= (node_ivl a l x r)
  (NodeP (ivl a) a l x (max3 a x (max_hi a l) (max_hi a r)) r)))))
(declare-fun inv_max_hi (par (a) ((itree a)) Bool))
(assert (par (a) (inv_max_hi a (LeafP (ivl a) a))))
(assert (par (a) (forall ((l (itree a)) (x (ivl a)) (m a) (r (itree a))) (= (inv_max_hi a (NodeP (ivl a) a l x m r))
  (and (= m (max3 a x (max_hi a l) (max_hi a r))) (inv_max_hi a l) (inv_max_hi a r))))))
(declare-fun inorderp (par (a b) ((ptree a b)) (list a)))
(assert (par (a b) (= (inorderp a b (LeafP a b)) (Nil a))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (inorderp a b (NodeP a b l x y r))
  (append a (inorderp a b l) (append a (Cons a x (Nil a)) (inorderp a b r)))))))
(declare-fun insert_ivl (par (a) ((ivl a) (itree a)) (itree a)))
(assert (par (a) (forall ((x (ivl a))) (= (insert_ivl a x (LeafP (ivl a) a)) (NodeP (ivl a) a (LeafP (ivl a) a) x (high a x) (LeafP (ivl a) a))))))
(assert (par (a) (forall ((x (ivl a)) (l (itree a)) (y (ivl a)) (z a) (r (itree a))) (= (insert_ivl a x (NodeP (ivl a) a l y z r))
  (match (cmp (ivl a) x y) ((LT (node_ivl a (insert_ivl a x l) y r))
                            (EQ (NodeP (ivl a) a l y z r))
                            (GT (node_ivl a l y (insert_ivl a x r)))))))))

; inv_max_hi(s) & sorted(inorder(s)) -> set_tree(insert(x,s)) = set_tree(s) U {x}
(assert-not (par (a) (forall ((x (ivl a)) (s (itree a))) (=> (and (inv_max_hi a s) (sorted_s (ivl a) (inorderp (ivl a) a s))) (forall ((y (ivl a))) (= (in_set_ptree (ivl a) a y (insert_ivl a x s)) (or (in_set_ptree (ivl a) a y s) (= x y))))))))
