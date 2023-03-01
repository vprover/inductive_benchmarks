; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(define-sort lists (a) (list (list a)))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun count (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (count a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (count a x (Cons a y ys)) (ite (= x y) (s (count a x ys)) (count a x ys))))))
(declare-fun counts (par (a) (a (lists a)) nat))
(assert (par (a) (forall ((x a)) (= (counts a x (Nil (list a))) zero))))
(assert (par (a) (forall ((x a) (ys (list a)) (yss (lists a))) (= (counts a x (Cons (list a) ys yss)) (plus (count a x ys) (counts a x yss))))))
(declare-fun same_mset_mset (par (a) ((lists a) (lists a)) Bool))
(assert (par (a) (forall ((xss (lists a)) (yss (lists a))) (= (same_mset_mset a xss yss) (forall ((x a)) (= (counts a x xss) (counts a x yss)))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (less a x y) (and (leq a x y) (distinct x y))))))
(assert (par (a) (forall ((x a)) (leq a x x))))
(assert (par (a) (forall ((x a) (y a) (z a)) (=> (and (leq a x y) (leq a y z)) (leq a x z)))))
(assert (par (a) (forall ((x a) (y a)) (=> (and (leq a x y) (leq a y x)) (= x y)))))
(assert (par (a) (forall ((x a) (y a)) (or (leq a x y) (leq a y x)))))
(declare-fun merge (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (merge a (Nil a) ys) ys))))
(assert (par (a) (forall ((xs (list a))) (= (merge a xs (Nil a)) xs))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (merge a (Cons a x xs) (Cons a y ys))
  (ite (leq a x y) (Cons a x (merge a xs (Cons a y ys))) (Cons a y (merge a (Cons a x xs) ys)))))))
(declare-fun merge_adj (par (a) ((lists a)) (lists a)))
(assert (par (a) (= (merge_adj a (Nil (list a))) (Nil (list a)))))
(assert (par (a) (forall ((xs (list a))) (= (merge_adj a (Cons (list a) xs (Nil (list a)))) (Cons (list a) xs (Nil (list a)))))))
(assert (par (a) (forall ((xs (list a)) (ys (list a)) (zss (lists a))) (= (merge_adj a (Cons (list a) xs (Cons (list a) ys zss)))
  (Cons (list a) (merge a xs ys) (merge_adj a zss))))))

; mset_mset (merge_adj(xss)) = mset_mset(xss)
(assert-not (par (a) (forall ((xss (lists a))) (same_mset_mset a (merge_adj a xss) xss))))
