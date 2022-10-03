; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
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
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun div2 (nat) nat)
(assert (= (div2 zero) zero))
(assert (= (div2 (s zero)) zero))
(assert (forall ((n nat)) (= (div2 (s (s n))) (s (div2 n)))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun merge (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (merge a (Nil a) ys) ys))))
(assert (par (a) (forall ((xs (list a))) (= (merge a xs (Nil a)) xs))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (merge a (Cons a x xs) (Cons a y ys))
  (ite (leq a x y) (Cons a x (merge a xs (Cons a y ys))) (Cons a y (merge a (Cons a x xs) ys)))))))
(declare-fun take (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (take a zero xs) (Nil a)))))
(assert (par (a) (forall ((n nat)) (= (take a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (take a (s n) (Cons a x xs)) (Cons a x (take a n xs))))))
(declare-fun drop (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (drop a zero xs) xs))))
(assert (par (a) (forall ((n nat)) (= (drop a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (drop a (s n) (Cons a x xs)) (drop a n xs)))))
(declare-fun msort (par (a) ((list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (msort a xs) (let ((n (len a xs))) (ite (leq nat n (s zero)) xs
  (merge a (msort a (take a (div2 n) xs)) (msort a (drop a (div2 n) xs)))))))))
(declare-fun C_merge (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (C_merge a (Nil a) ys) zero))))
(assert (par (a) (forall ((xs (list a))) (= (C_merge a xs (Nil a)) zero))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (C_merge a (Cons a x xs) (Cons a y ys))
  (s (ite (leq a x y) (C_merge a xs (Cons a y ys)) (C_merge a (Cons a x xs) ys)))))))
(declare-fun C_msort (par (a) ((list a)) nat))
(assert (par (a) (forall ((xs (list a))) (= (C_msort a xs) (let ((n (len a xs))) (let ((ys (take a (div2 n) xs)) (zs (drop a (div2 n) xs)))
  (ite (leq nat n (s zero)) zero (plus (plus (C_msort a (ys a)) (C_msort a (zs a))) (C_merge a (msort a (ys a)) (msort a (zs a)))))))))))

; |xs| = 2^k -> C_msort(xs) <= k * 2^k
(assert-not (par (a) (forall ((xs (list a)) (k nat)) (=> (= (len a xs) (pow (s (s zero)) k)) (leq nat (C_msort a xs) (mult k (pow (s (s zero)) k)))))))
