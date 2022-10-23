; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun count (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (count a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (count a x (Cons a y ys)) (ite (= x y) (s (count a x ys)) (count a x ys))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun insort (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (insort a x (Nil a)) (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (insort a x (Cons a y ys)) (ite (leq a x y) (Cons a x (Cons a y ys)) (Cons a y (insort a x ys)))))))

; mset(insort(x,xs)) = {{x}} + mset(xs)
(assert-not (par (a) (forall ((x a) (xs (list a)) (y a)) (= (count a y (insort a x xs)) (ite (= x y) (s (count a y xs)) (count a y xs))))))