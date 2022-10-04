; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun nodes (par (a) ((list (tree a)) (list a) (list (tree a))) (list (tree a))))
(assert (par (a) (forall ((ls (list (tree a))) (xs (list a)) (rs (list (tree a)))) (= (nodes a ls xs rs)
  (match xs (((Nil a) (Nil (tree a)))
             ((Cons a x xs0) (match ls
                (((Nil (tree a)) (match rs
                   (((Nil (tree a)) (Cons (tree a) (Node a (Leaf a) x (Leaf a)) (nodes a (Nil (tree a)) xs0 (Nil (tree a)))))
                    ((Cons (tree a) r rs0) (Cons (tree a) (Node a (Leaf a) x r) (nodes a (Nil (tree a)) xs0 rs0))))))
                 ((Cons (tree a) l ls0) (match rs
                   (((Nil (tree a)) (Cons (tree a) (Node a l x (Leaf a)) (nodes a ls0 xs0 (Nil (tree a)))))
                    ((Cons (tree a) r rs0) (Cons (tree a) (Node a l x r) (nodes a ls0 xs0 rs0)))))))))))))))

; |nodes(ls,xs,rs)| = |xs|
(assert-not (par (a) (forall ((ls (list (tree a))) (xs (list a)) (rs (list (tree a)))) (= (len (tree a) (nodes a ls xs rs)) (len a xs)))))
