; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T23 (T23_0 (tree23 a))) (TTs23 (TTs23_0 (tree23 a)) (TTs23_1 a) (TTs23_2 (tree23s a))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun len23s (par (a) ((tree23s a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (len23s a (T23 a t)) (s zero)))))
(assert (par (a) (forall ((t (tree23 a)) (x a) (ts (tree23s a))) (= (len23s a (TTs23 a t x ts)) (s (len23s a ts))))))
(declare-fun join_adj23 (par (a) ((tree23s a)) (tree23s a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (join_adj23 a (TTs23 a t1 x (T23 a t2))) (T23 a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (join_adj23 a (TTs23 a t1 x (TTs23 a t2 y (T23 a t3))))
  (T23 a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (ts (tree23s a))) (= (join_adj23 a (TTs23 a t1 x (TTs23 a t2 y (TTs23 a t3 z ts))))
  (TTs23 a (Node2 a t1 x t2) y (join_adj23 a (TTs23 a t3 z ts)))))))
(declare-fun not_T (par (a) ((tree23s a)) Bool))
(assert (par (a) (forall ((ts (tree23s a))) (= (not_T a ts) (forall ((t (tree23 a))) (distinct ts (T23 a t)))))))

; not_T(ts) -> len(join_adj(ts)) < len(ts)
(assert-not (par (a) (forall ((ts (tree23s a))) (=> (not_T a ts) (less nat (len23s a (join_adj23 a ts)) (len23s a ts))))))
