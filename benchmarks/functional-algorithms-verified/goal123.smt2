(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun sorted_s (par (a) ((list a)) Bool))
(assert (par (a) (sorted_s a (Nil a))))
(assert (par (a) (forall ((x a)) (sorted_s a (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (zs (list a))) (= (sorted_s a (Cons a x (Cons a y zs))) (and (less a x y) (sorted_s a (Cons a y zs)))))))
(declare-fun del_list (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (del_list a x (Nil a)) (Nil a)))))
(assert (par (a) (forall ((x a) (y a) (xs (list a))) (= (del_list a x (Cons a y xs))
  (ite (= x y) xs (Cons a y (del_list a x xs)))))))

; sorted(xs) -> set(del_list(x,xs)) = set(xs) - {x}
(assert-not (par (a) (forall ((xs (list a)) (x a)) (=> (sorted_s a xs) (forall ((y a)) (= (in_set a y (del_list a x xs)) (and (in_set a y xs) (distinct x y))))))))
