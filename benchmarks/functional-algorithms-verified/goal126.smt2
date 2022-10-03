(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-fun less (par (a) (a a) Bool))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun sorted_s (par (a) ((list a)) Bool))
(assert (par (a) (sorted_s a (Nil a))))
(assert (par (a) (forall ((x a)) (sorted_s a (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (zs (list a))) (= (sorted_s a (Cons a x (Cons a y zs))) (and (less a x y) (sorted_s a (Cons a y zs)))))))
(declare-fun inorder (par (a) ((tree a)) (list a)))
(assert (par (a) (= (inorder a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (inorder a (Node a l x r)) (append a (inorder a l) (append a (Cons a x (Nil a)) (inorder a r)))))))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
(declare-fun split_min (par (a) ((tree a)) (pair a (tree a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (split_min a (Node a l x r))
  (ite (= l (Leaf a)) (Pair a (tree a) x r) (let ((xl (split_min a l))) (Pair a (tree a) (Pair_0 a (tree a) (xl a)) (Node a (Pair_1 a (tree a) (xl a)) x r))))))))
(declare-fun delete (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (delete a x (Leaf a)) (Leaf a)))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (delete a x (Node a l y r))
  (match (cmp a x y) ((LT (Node a (delete a x l) y r))
                      (EQ (ite (= r (Leaf a)) l (let ((ar (split_min a r))) (Node a l (Pair_0 a (tree a) (ar a)) (Pair_1 a (tree a) (ar a))))))
                      (GT (Node a l y (delete a x r)))))))))

; sorted(inorder(t)) -> sorted(inorder(delete(x,t)))
(assert-not (par (a) (forall ((x a) (t (tree a))) (=> (sorted_s a (inorder a t)) (sorted_s a (inorder a (delete a x t)))))))
