; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (less a x y) (and (leq a x y) (distinct x y))))))
(assert (par (a) (forall ((x a)) (leq a x x))))
(assert (par (a) (forall ((x a) (y a) (z a)) (=> (and (leq a x y) (leq a y z)) (leq a x z)))))
(assert (par (a) (forall ((x a) (y a)) (=> (and (leq a x y) (leq a y x)) (= x y)))))
(assert (par (a) (forall ((x a) (y a)) (or (leq a x y) (leq a y x)))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun insort (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (insort a x (Nil a)) (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (insort a x (Cons a y ys)) (ite (leq a x y) (Cons a x (Cons a y ys)) (Cons a y (insort a x ys)))))))

; |insort(x,xs)| = |xs| + 1
(assert-not (par (a) (forall ((x a) (xs (list a))) (= (len a (insort a x xs)) (s (len a xs))))))
