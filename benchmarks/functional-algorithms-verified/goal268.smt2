; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
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
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun pow2 (nat) nat)
(assert (forall ((x nat)) (= (pow2 x) (pow (s (s zero)) x))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun nth (par (a) ((list a) nat) a))
(assert (par (a) (forall ((x a) (xs (list a)) (n nat)) (= (nth a (Cons a x xs) n) (match n
  ((zero x)
   ((s k) (nth a xs k))))))))
; extensionality
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (= xs ys) (and (= (len a xs) (len a ys))
  (forall ((i nat)) (=> (less nat i (len a xs)) (= (nth a xs i) (nth a ys i)))))))))
(declare-fun hd (par (a) ((list a)) a))
(assert (par (a) (forall ((x a) (xs (list a))) (= (hd a (Cons a x xs)) x))))
(declare-fun take (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (take a zero xs) (Nil a)))))
(assert (par (a) (forall ((n nat)) (= (take a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (take a (s n) (Cons a x xs)) (Cons a x (take a n xs))))))
(declare-fun drop (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (drop a zero xs) xs))))
(assert (par (a) (forall ((n nat)) (= (drop a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (drop a (s n) (Cons a x xs)) (drop a n xs)))))
(declare-fun min (nat nat) nat)
(assert (forall ((x nat) (y nat)) (= (min x y) (ite (leq nat x y) x y))))
(declare-fun take_nths (par (a) (nat nat (list a)) (list a)))
(assert (par (a) (forall ((i nat) (k nat)) (= (take_nths a i k (Nil a)) (Nil a)))))
(assert (par (a) (forall ((i nat) (k nat) (x a) (xs (list a))) (= (take_nths a i k (Cons a x xs))
  (ite (= i zero) (Cons a x (take_nths a (s_0 (pow2 k)) k xs)) (take_nths a (s_0 i) k xs))))))
(declare-fun braun_list (par (a) ((tree a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a))) (= (braun_list a (Leaf a) xs) (= xs (Nil a))))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (xs (list a))) (= (braun_list a (Node a l x r) xs)
  (and (distinct xs (Nil a)) (= x (hd a xs)) (braun_list a l (take_nths a (s zero) (s zero) xs))
    (braun_list a r (take_nths a (s (s zero)) (s zero) xs)))))))
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
(declare-fun brauns (par (a) (nat (list a)) (list (tree a))))
(assert (par (a) (forall ((k nat) (xs (list a))) (= (brauns a k xs)
  (ite (= xs (Nil a)) (Nil (tree a)) (let ((ys (take a (pow2 k) xs)) (zs (drop a (pow2 k) xs)))
    (let ((ts (brauns a (s k) zs))) (nodes a ts ys (drop (tree a) (pow2 k) ts)))))))))

; i < min(|xs|,2^k) -> braun_list(brauns(k,xs) ! i, take_nths(i,k,xs))
(assert-not (par (a) (forall ((i nat) (k nat) (xs (list a))) (=> (less nat i (min (len a xs) (pow2 k)))
  (braun_list a (nth (tree a) (brauns a k xs) i) (take_nths a i k xs))))))
