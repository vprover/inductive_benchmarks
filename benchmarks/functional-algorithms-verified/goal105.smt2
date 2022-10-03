(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun inorder (par (a) ((tree a)) (list a)))
(assert (par (a) (= (inorder a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (inorder a (Node a l x r)) (append a (inorder a l) (append a (Cons a x (Nil a)) (inorder a r)))))))
(declare-fun join (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((t (tree a))) (= (join a t (Leaf a)) t))))
(assert (par (a) (forall ((t (tree a))) (= (join a (Leaf a) t) t))))
(assert (par (a) (forall ((t1 (tree a)) (x a) (t2 (tree a)) (t3 (tree a)) (y a) (t4 (tree a))) (= (join a (Node a t1 x t2) (Node a t3 y t4))
  (match (join a t2 t3) (((Leaf a) (Node a t1 x (Node a (Leaf a) y t4))) ((Node a u2 z u3) (Node a (Node a t1 x u2) z (Node a u3 y t4)))))))))

; inorder(join(l,r)) = inorder(l) @ inorder(r)
(assert-not (par (a) (forall ((l (tree a)) (r (tree a))) (= (inorder a (join a l r)) (append a (inorder a l) (inorder a r))))))
