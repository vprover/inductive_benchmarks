; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T (T_0 (tree23 a))) (TTs (TTs_0 (tree23 a)) (TTs_1 a) (TTs_2 (tree23s a))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun h23 (par (a) ((tree23 a)) nat))
(assert (par (a) (= (h23 a (Leaf23 a)) zero)))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (h23 a (Node2 a l x r))
  (s (max nat (h23 a l) (h23 a r)))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a)))
  (= (h23 a (Node3 a l x m y r)) (s (max nat (h23 a l) (max nat (h23 a m) (h23 a r))))))))
(declare-fun complete23 (par (a) ((tree23 a)) Bool))
(assert (par (a) (complete23 a (Leaf23 a))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (complete23 a (Node2 a l x r))
  (and (= (h23 a l) (h23 a r)) (complete23 a l) (complete23 a r))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a))) (= (complete23 a (Node3 a l x m y r))
  (and (= (h23 a l) (h23 a m)) (= (h23 a m) (h23 a r)) (complete23 a l) (complete23 a m) (complete23 a r))))))
(declare-fun in_trees (par (a) ((tree23 a) (tree23s a)) Bool))
(assert (par (a) (forall ((s (tree23 a)) (t (tree23 a))) (= (in_trees a s (T a t)) (= s t)))))
(assert (par (a) (forall ((s (tree23 a)) (t (tree23 a)) (x a) (ts (tree23s a))) (= (in_trees a s (TTs a t x ts)) (or (= s t) (in_trees a s ts))))))
(declare-fun leaves (par (a) ((list a)) (tree23s a)))
(assert (par (a) (= (leaves a (Nil a)) (T a (Leaf23 a)))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (leaves a (Cons a x xs)) (TTs a (Leaf23 a) x (leaves a xs))))))

; t in trees(leaves(as)) -> complete(t) & h(t) = 0
(assert-not (par (a) (forall ((t (tree23 a)) (xs (list a))) (=> (in_trees a t (leaves a xs)) (and (complete23 a t) (= (h23 a t) zero))))))
