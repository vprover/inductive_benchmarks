(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun rev (par (a) ((list a)) (list a)))
(assert (par (a) (= (rev a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (rev a (Cons a x xs)) (append a (rev a xs) (Cons a x (Nil a)))))))
(declare-fun itrev (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (itrev a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (itrev a (Cons a x xs) ys) (itrev a xs (Cons a x ys))))))

; itrev(xs,ys) = rev(xs) @ ys
(assert-not (par (a) (forall ((xs (list a)) (ys (list a))) (= (itrev a xs ys) (append a (rev a xs) ys)))))
