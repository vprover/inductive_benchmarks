; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
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
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun C_merge (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (C_merge a (Nil a) ys) zero))))
(assert (par (a) (forall ((xs (list a))) (= (C_merge a xs (Nil a)) zero))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (C_merge a (Cons a x xs) (Cons a y ys))
  (s (ite (leq a x y) (C_merge a xs (Cons a y ys)) (C_merge a (Cons a x xs) ys)))))))
(declare-fun C_merge_adj (par (a) ((lists a)) nat))
(assert (par (a) (= (C_merge_adj a (Nil (list a))) zero)))
(assert (par (a) (forall ((xs (list a))) (= (C_merge_adj a (Cons (list a) xs (Nil (list a)))) zero))))
(assert (par (a) (forall ((xs (list a)) (ys (list a)) (zss (lists a))) (= (C_merge_adj a (Cons (list a) xs (Cons (list a) ys zss)))
  (plus (C_merge a xs ys) (C_merge_adj a zss))))))
(declare-fun concat (par (a) ((lists a)) (list a)))
(assert (par (a) (= (concat a (Nil (list a))) (Nil a))))
(assert (par (a) (forall ((xs (list a)) (xss (lists a))) (= (concat a (Cons (list a) xs xss)) (append a xs (concat a xss))))))

; C_merge_adj(xss) <= |concat(xss)|
(assert-not (par (a) (forall ((xss (lists a))) (leq nat (C_merge_adj a xss) (len a (concat a xss))))))
