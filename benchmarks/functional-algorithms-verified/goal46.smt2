; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))
(define-sort lists (a) (list (list a)))
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
(declare-fun map_list_lists (par (a) ((list a)) (lists a)))
(assert (par (a) (= (map_list_lists a (Nil a)) (Nil (list a)))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (map_list_lists a (Cons a x xs)) (Cons (list a) (Cons a x (Nil a)) (map_list_lists a xs))))))
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun pow2 (nat) nat)
(assert (forall ((x nat)) (= (pow2 x) (pow (s (s zero)) x))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun merge (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (merge a (Nil a) ys) ys))))
(assert (par (a) (forall ((xs (list a))) (= (merge a xs (Nil a)) xs))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (merge a (Cons a x xs) (Cons a y ys))
  (ite (leq a x y) (Cons a x (merge a xs (Cons a y ys))) (Cons a y (merge a (Cons a x xs) ys)))))))
(declare-fun C_merge (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (C_merge a (Nil a) ys) zero))))
(assert (par (a) (forall ((xs (list a))) (= (C_merge a xs (Nil a)) zero))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (C_merge a (Cons a x xs) (Cons a y ys))
  (s (ite (leq a x y) (C_merge a xs (Cons a y ys)) (C_merge a (Cons a x xs) ys)))))))
(declare-fun merge_adj (par (a) ((lists a)) (lists a)))
(assert (par (a) (= (merge_adj a (Nil (list a))) (Nil (list a)))))
(assert (par (a) (forall ((xs (list a))) (= (merge_adj a (Cons (list a) xs (Nil (list a)))) (Cons (list a) xs (Nil (list a)))))))
(assert (par (a) (forall ((xs (list a)) (ys (list a)) (zss (lists a))) (= (merge_adj a (Cons (list a) xs (Cons (list a) ys zss)))
  (Cons (list a) (merge a xs ys) (merge_adj a zss))))))
(declare-fun C_merge_adj (par (a) ((lists a)) nat))
(assert (par (a) (= (C_merge_adj a (Nil (list a))) zero)))
(assert (par (a) (forall ((xs (list a))) (= (C_merge_adj a (Cons (list a) xs (Nil (list a)))) zero))))
(assert (par (a) (forall ((xs (list a)) (ys (list a)) (zss (lists a))) (= (C_merge_adj a (Cons (list a) xs (Cons (list a) ys zss)))
  (plus (C_merge a xs ys) (C_merge_adj a zss))))))
(declare-fun C_merge_all (par (a) ((lists a)) nat))
(assert (par (a) (= (C_merge_all a (Nil (list a))) zero)))
(assert (par (a) (forall ((xs (list a))) (= (C_merge_all a (Cons (list a) xs (Nil (list a)))) zero))))
(assert (par (a) (forall ((xs (list a)) (xss (lists a))) (=> (and (distinct xss (Cons (list a) xs (Nil (list a)))) (distinct xss (Nil (list a))))
  (= (C_merge_all a xss) (plus (C_merge_adj a xss) (C_merge_all a (merge_adj a xss))))))))
(declare-fun C_msort_bu (par (a) ((list a)) nat))
(assert (par (a) (forall ((xs (list a))) (= (C_msort_bu a xs) (C_merge_all a (map_list_lists a xs))))))

; |xs| = 2^k -> C_msort_bu(xs) <= k * 2^k
(assert-not (par (a) (forall ((xs (list a)) (k nat)) (=> (= (len a xs) (pow2 k)) (leq nat (C_msort_bu a xs) (mult k (pow2 k)))))))
