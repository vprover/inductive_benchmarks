(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun inorder (par (a) ((tree a)) (list a)))
(assert (par (a) (= (inorder a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (inorder a (Node a l x r)) (append a (inorder a l) (append a (Cons a x (Nil a)) (inorder a r)))))))
(declare-fun inorder2 (par (a) ((tree a) (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (inorder2 a (Leaf a) xs) xs))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (xs (list a))) (= (inorder2 a (Node a l x r) xs) (inorder2 a l (Cons a x (inorder2 a r xs)))))))

; inorder2(t,xs) = inorder(t) @ xs
(assert-not (par (a) (forall ((t (tree a)) (xs (list a))) (= (inorder2 a t xs) (append a (inorder a t) xs)))))
