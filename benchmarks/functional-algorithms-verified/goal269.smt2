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
(declare-fun take (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (take a zero xs) (Nil a)))))
(assert (par (a) (forall ((n nat)) (= (take a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (take a (s n) (Cons a x xs)) (Cons a x (take a n xs))))))
(declare-fun drop (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (drop a zero xs) xs))))
(assert (par (a) (forall ((n nat)) (= (drop a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (drop a (s n) (Cons a x xs)) (drop a n xs)))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun splice (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (splice a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (splice a (Cons a x xs) ys)
  (Cons a x (splice a ys xs))))))
(declare-fun list_of (par (a) ((tree a)) (list a)))
(assert (par (a) (= (list_of a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (list_of a (Node a l x r))
  (Cons a x (splice a (list_of a l) (list_of a r)))))))
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
    (let ((ts (brauns a (s k) (zs a)))) (nodes a (ts a) (ys a) (drop (tree a) (pow2 k) (ts a))))))))))
(declare-fun brauns1 (par (a) ((list a)) (tree a)))
(assert (par (a) (forall ((xs (list a))) (= (brauns1 a xs)
  (ite (= xs (Nil a)) (Leaf a) (nth (tree a) (brauns a zero xs) zero))))))

; braun(brauns1(xs)) & list(brauns1(xs)) = xs
(assert-not (par (a) (forall ((xs (list a))) (and (braun a (brauns1 a xs)) (= (list_of a (brauns1 a xs)) xs)))))