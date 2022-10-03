(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun sorted_s (par (a) ((list a)) Bool))
(assert (par (a) (sorted_s a (Nil a))))
(assert (par (a) (forall ((x a)) (sorted_s a (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (zs (list a))) (= (sorted_s a (Cons a x (Cons a y zs))) (and (less a x y) (sorted_s a (Cons a y zs)))))))

; sorted(x # xs) -> sorted(xs)
(assert-not (par (a) (forall ((x a) (xs (list a))) (=> (sorted_s a (Cons a x xs)) (sorted_s a xs)))))
