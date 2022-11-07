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
(declare-fun C_runs (par (a) ((list a)) nat))
(declare-fun C_asc (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (C_asc a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (C_asc a x (Cons a y ys))
  (s (ite (not (less a y x)) (C_asc a y ys) (C_runs a (Cons a y ys))))))))
(declare-fun C_desc (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (C_desc a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (C_desc a x (Cons a y ys))
  (s (ite (less a y x) (C_desc a y ys) (C_runs a (Cons a y ys))))))))
(assert (par (a) (= (C_runs a (Nil a)) zero)))
(assert (par (a) (forall ((x a)) (= (C_runs a (Cons a x (Nil a))) zero))))
(assert (par (a) (forall ((x a) (y a) (xs (list a))) (= (C_runs a (Cons a x (Cons a y xs)))
  (s (ite (less a y x) (C_desc a y xs) (C_asc a y xs)))))))

; C_runs(xs) <= |xs| - 1
(assert (par (a) (forall ((xs (list a))) (leq nat (C_runs a xs) (s_0 (len a xs))))))
