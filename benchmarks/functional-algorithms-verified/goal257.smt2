; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun take_nths (par (a) (nat nat (list a)) (list a)))
(assert (par (a) (forall ((i nat) (k nat)) (= (take_nths a i k (Nil a)) (Nil a)))))
(assert (par (a) (forall ((i nat) (k nat) (x a) (xs (list a))) (= (take_nths a i k (Cons a x xs))
  (ite (= i zero) (Cons a x (take_nths a (s_0 (pow (s (s zero)) k)) k xs)) (take_nths a (s_0 i) k xs))))))

; take_nths(0,0,xs) = xs
(assert-not (par (a) (forall ((xs (list a))) (= (take_nths a zero zero xs) xs))))
