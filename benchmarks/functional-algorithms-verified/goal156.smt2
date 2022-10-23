(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T23 (T23_0 (tree23 a))) (TTs23 (TTs23_0 (tree23 a)) (TTs23_1 a) (TTs23_2 (tree23s a))))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun inorder23 (par (a) ((tree23 a)) (list a)))
(assert (par (a) (= (inorder23 a (Leaf23 a)) (Nil a))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (inorder23 a (Node2 a t1 x t2))
  (append a (inorder23 a t1) (append a (Cons a x (Nil a)) (inorder23 a t2)))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (inorder23 a (Node3 a t1 x t2 y t3))
  (append a (inorder23 a t1) (append a (Cons a x (Nil a)) (append a (inorder23 a t2) (append a (Cons a y (Nil a)) (inorder23 a t3)))))))))
(declare-fun inorder23s (par (a) ((tree23s a)) (list a)))
(assert (par (a) (forall ((t (tree23 a))) (= (inorder23s a (T23 a t)) (inorder23 a t)))))
(assert (par (a) (forall ((t (tree23 a)) (x a) (ts (tree23s a))) (= (inorder23s a (TTs23 a t x ts)) (append a (inorder23 a t) (Cons a x (inorder23s a ts)))))))
(declare-fun join_adj23 (par (a) ((tree23s a)) (tree23s a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (join_adj23 a (TTs23 a t1 x (T23 a t2))) (T23 a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (join_adj23 a (TTs23 a t1 x (TTs23 a t2 y (T23 a t3))))
  (T23 a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (ts (tree23s a))) (= (join_adj23 a (TTs23 a t1 x (TTs23 a t2 y (TTs23 a t3 z ts))))
  (TTs23 a (Node2 a t1 x t2) y (join_adj23 a (TTs23 a t3 z ts)))))))
(declare-fun join_all23 (par (a) ((tree23s a)) (tree23 a)))
(assert (par (a) (forall ((t (tree23 a))) (= (join_all23 a (T23 a t)) t))))
(assert (par (a) (forall ((x a) (t (tree23 a)) (ts (tree23s a))) (= (join_all23 a (TTs23 a t x ts)) (join_all23 a (join_adj23 a (TTs23 a t x ts)))))))

; inorder(join_all(ts)) = inorder2(ts)
(assert-not (par (a) (forall ((ts (tree23s a))) (= (inorder23 a (join_all23 a ts)) (inorder23s a ts)))))
