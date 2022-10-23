(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun sorted (par (a) ((list a)) Bool))
(assert (par (a) (sorted a (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (sorted a (Cons a x xs)) (and (forall ((y a)) (=> (in_set a y xs) (leq a x y))) (sorted a xs))))))
(declare-fun merge (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (merge a (Nil a) ys) ys))))
(assert (par (a) (forall ((xs (list a))) (= (merge a xs (Nil a)) xs))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (merge a (Cons a x xs) (Cons a y ys))
  (ite (leq a x y) (Cons a x (merge a xs (Cons a y ys))) (Cons a y (merge a (Cons a x xs) ys)))))))

; sorted(merge(xs,ys)) = (sorted(xs) & sorted(ys))
(assert-not (par (a) (forall ((xs (list a)) (ys (list a))) (= (sorted a (merge a xs ys)) (and (sorted a xs) (sorted a ys))))))