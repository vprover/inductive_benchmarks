; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun insert_braun (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (insert_braun a x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (insert_braun a x (Node a l y r))
  (ite (less a x y) (Node a (insert_braun a y r) x l) (Node a (insert_braun a x r) y l))))))

; |insert x t| = |t| + 1
(assert-not (par (a) (forall ((x a) (t (tree a))) (= (size a (insert_braun a x t)) (s (size a t))))))
