; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun count (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (count a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (count a x (Cons a y ys)) (ite (= x y) (s (count a x ys)) (count a x ys))))))
(declare-fun same_mset (par (a) ((list a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (same_mset a xs ys) (forall ((x a)) (= (count a x xs) (count a x ys)))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun filter_less (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (filter_less a x (Nil a)) (Nil a)))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (filter_less a x (Cons a y ys)) (ite (less a y x) (Cons a y (filter_less a x ys)) (filter_less a x ys))))))
(declare-fun filter_ge (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (filter_ge a x (Nil a)) (Nil a)))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (filter_ge a x (Cons a y ys)) (ite (not (less a y x)) (Cons a y (filter_ge a x ys)) (filter_ge a x ys))))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun quicksort (par (a) ((list a)) (list a)))
(assert (par (a) (= (quicksort a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (quicksort a (Cons a x xs))
  (append a (quicksort a (filter_less a x xs)) (append a (Cons a x (Nil a)) (quicksort a (filter_ge a x xs))))))))

; mset(quicksort(xs)) = mset(xs)
(assert-not (par (a) (forall ((xs (list a))) (same_mset a (quicksort a xs) xs))))
