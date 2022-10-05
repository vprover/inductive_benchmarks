(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-fun less (par (a) (a a) Bool))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun inorder (par (a) ((tree a)) (list a)))
(assert (par (a) (= (inorder a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (inorder a (Node a l x r)) (append a (inorder a l) (append a (Cons a x (Nil a)) (inorder a r)))))))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
; TODO there are multiple undefined branches in splay which we cover with this uninterpreted function
(declare-const splay_undefined (par (a) (tree a)))
(declare-fun splay (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a) (AB (tree a)) (b a) (CD (tree a))) (= (splay a x (Node a AB b CD))
  (match (cmp a x b) ((LT (match AB (((Leaf a) (Node a AB b CD))
                                     ((Node a A y B') (match (cmp a x y)
                                        ((LT (ite (= A (Leaf a)) (Node a A y (Node a B' b CD))
                                            (match (splay a x A) (((Node a A1 y' A2) (Node a A1 y' (Node a A2 y (Node a B' b CD))))
                                                                  (_ (splay_undefined a))))))
                                         (EQ (Node a A y (Node a B' b CD)))
                                         (GT (ite (= B' (Leaf a)) (Node a A y (Node a B' b CD))
                                            (match (splay a x B') (((Node a B1 b' B2) (Node a (Node a A y B1) b' (Node a B2 b CD)))
                                                                  (_ (splay_undefined a))))))))))))
                      (EQ (Node a AB b CD))
                      (GT (match CD (((Leaf a) (Node a AB b CD))
                                     ((Node a C c D) (match (cmp a x c)
                                        ((LT (ite (= C (Leaf a)) (Node a (Node a AB b C) c D)
                                            (match (splay a x C) (((Node a C1 c' C2) (Node a (Node a AB b C1) c' (Node a C2 c D)))
                                                                  (_ (splay_undefined a))))))
                                         (EQ (Node a (Node a AB b C) c D))
                                         (GT (ite (= D (Leaf a)) (Node a (Node a AB b C) c D)
                                            (match (splay a x D) (((Node a D1 d D2) (Node a (Node a (Node a AB b C) c D1) d D2))
                                                                  (_ (splay_undefined a))))))))))))))))))

; inorder (splay x t) = inorder t
(assert-not (par (a) (forall ((t (tree a)) (x a)) (= (inorder a (splay a x t)) (inorder a t)))))
