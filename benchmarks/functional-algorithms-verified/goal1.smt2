; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun T_itrev (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (T_itrev a (Nil a) ys) (s zero)))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (T_itrev a (Cons a x xs) ys) (s (T_itrev a xs (Cons a x ys)))))))

; T_itrev(xs,ys) = |xs|+1
(assert-not (par (a) (forall ((xs (list a)) (ys (list a))) (= (T_itrev a xs ys) (s (len a xs))))))
