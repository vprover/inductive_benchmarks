; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T (T_0 (tree23 a))) (TTs (TTs_0 (tree23 a)) (TTs_1 a) (TTs_2 (tree23s a))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun div2 (nat) nat)
(assert (= (div2 zero) zero))
(assert (= (div2 (s zero)) zero))
(assert (forall ((n nat)) (= (div2 (s (s n))) (s (div2 n)))))
(declare-fun len23s (par (a) ((tree23s a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (len23s a (T a t)) (s zero)))))
(assert (par (a) (forall ((t (tree23 a)) (x a) (ts (tree23s a))) (= (len23s a (TTs a t x ts)) (s (len23s a ts))))))
(declare-fun not_T (par (a) ((tree23s a)) Bool))
(assert (par (a) (forall ((ts (tree23s a))) (= (not_T a ts) (forall ((t (tree23 a))) (distinct ts (T a t)))))))
(declare-fun T_join_adj (par (a) ((tree23s a)) nat))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (T_join_adj a (TTs a t1 x (T a t2))) (s zero)))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (T_join_adj a (TTs a t1 x (TTs a t2 y (T a t3)))) (s zero)))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (ts (tree23s a)))
  (= (T_join_adj a (TTs a t1 x (TTs a t2 y (TTs a t3 z ts)))) (s (T_join_adj a ts))))))

; not_T(ts) -> T_join_adj(ts) <= len(ts) div 2
(assert-not (par (a) (forall ((ts (tree23s a))) (=> (not_T a ts) (leq nat (T_join_adj a ts) (div2 (len23s a ts)))))))
