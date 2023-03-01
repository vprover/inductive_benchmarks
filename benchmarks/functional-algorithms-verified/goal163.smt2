; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T23 (T23_0 (tree23 a))) (TTs23 (TTs23_0 (tree23 a)) (TTs23_1 a) (TTs23_2 (tree23s a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (less a x y) (and (leq a x y) (distinct x y))))))
(assert (par (a) (forall ((x a)) (leq a x x))))
(assert (par (a) (forall ((x a) (y a) (z a)) (=> (and (leq a x y) (leq a y z)) (leq a x z)))))
(assert (par (a) (forall ((x a) (y a)) (=> (and (leq a x y) (leq a y x)) (= x y)))))
(assert (par (a) (forall ((x a) (y a)) (or (leq a x y) (leq a y x)))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun join_adj23 (par (a) ((tree23s a)) (tree23s a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (join_adj23 a (TTs23 a t1 x (T23 a t2))) (T23 a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (join_adj23 a (TTs23 a t1 x (TTs23 a t2 y (T23 a t3))))
  (T23 a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (ts (tree23s a))) (= (join_adj23 a (TTs23 a t1 x (TTs23 a t2 y (TTs23 a t3 z ts))))
  (TTs23 a (Node2 a t1 x t2) y (join_adj23 a (TTs23 a t3 z ts)))))))
(declare-fun leaves23 (par (a) ((list a)) (tree23s a)))
(assert (par (a) (= (leaves23 a (Nil a)) (T23 a (Leaf23 a)))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (leaves23 a (Cons a x xs)) (TTs23 a (Leaf23 a) x (leaves23 a xs))))))
(declare-fun T_join_adj (par (a) ((tree23s a)) nat))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (T_join_adj a (TTs23 a t1 x (T23 a t2))) (s zero)))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (T_join_adj a (TTs23 a t1 x (TTs23 a t2 y (T23 a t3)))) (s zero)))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (ts (tree23s a)))
  (= (T_join_adj a (TTs23 a t1 x (TTs23 a t2 y (TTs23 a t3 z ts)))) (s (T_join_adj a ts))))))
(declare-fun T_join_all (par (a) ((tree23s a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (T_join_all a (T23 a t)) (s zero)))))
(assert (par (a) (forall ((x a) (t (tree23 a)) (ts (tree23s a))) (= (T_join_all a (TTs23 a t x ts))
  (s (plus (T_join_adj a (TTs23 a t x ts)) (T_join_all a (join_adj23 a (TTs23 a t x ts)))))))))
(declare-fun T_leaves (par (a) ((list a)) nat))
(assert (par (a) (= (T_leaves a (Nil a)) (s zero))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (T_leaves a (Cons a x xs)) (s (T_leaves a xs))))))
(declare-fun T_tree23_of_list (par (a) ((list a)) nat))
(assert (par (a) (forall ((xs (list a))) (= (T_tree23_of_list a xs) (s (plus (T_leaves a xs) (T_join_all a (leaves23 a xs))))))))

; T_tree23_of_list(as) <= 3 * |as| + 4
(assert-not (par (a) (forall ((xs (list a))) (leq nat (T_tree23_of_list a xs) (plus (mult (s (s (s zero))) (len a xs)) (s (s (s (s zero)))))))))
