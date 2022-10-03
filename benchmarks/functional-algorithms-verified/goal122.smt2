(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun ins_list (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (ins_list a x (Nil a)) (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (xs (list a))) (= (ins_list a x (Cons a y xs))
  (ite (less a x y) (Cons a x (Cons a y xs)) (ite (= x y) (Cons a y xs) (Cons a y (ins_list a x xs))))))))

; set(ins_list(x,xs)) = set(xs) U {x}
(assert-not (par (a) (forall ((xs (list a)) (x a) (y a)) (= (in_set a y (ins_list a x xs)) (or (in_set a y xs) (= x y))))))
