; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun T_insort (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (T_insort a x (Nil a)) (s zero)))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (T_insort a x (Cons a y ys)) (s (ite (leq a x y) zero (T_insort a x ys)))))))

; T_insort(x,xs) <= |xs| + 1
(assert-not (par (a) (forall ((x a) (xs (list a))) (leq nat (T_insort a x xs) (s (len a xs))))))
