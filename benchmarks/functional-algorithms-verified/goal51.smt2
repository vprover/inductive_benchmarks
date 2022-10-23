(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(define-sort lists (a) (list (list a)))
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun sorted (par (a) ((list a)) Bool))
(assert (par (a) (sorted a (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (sorted a (Cons a x xs)) (and (forall ((y a)) (=> (in_set a y xs) (leq a x y))) (sorted a xs))))))
(declare-fun Ball_sorted (par (a) ((lists a)) Bool))
(assert (par (a) (Ball_sorted a (Nil (list a)))))
(assert (par (a) (forall ((xs (list a)) (xss (lists a))) (= (Ball_sorted a (Cons (list a) xs xss)) (and (sorted a xs) (Ball_sorted a xss))))))
(declare-fun runs (par (a) ((list a)) (lists a)))
(assert (par (a) (= (runs a (Nil a)) (Nil (list a)))))
(assert (par (a) (forall ((x a)) (= (runs a (Cons a x (Nil a))) (Cons (list a) (Cons a x (Nil a)) (Nil (list a)))))))
;(assert (forall ((a nat) (b nat) (xs (list nat))) (= (runs (Cons nat a (Cons nat b xs)))
;  (ite (< b a) (desc b (Cons nat a (Nil nat)) xs) (asc b ((# a) xs))))))
;(declare-fun asc (nat (=> (list nat) (list nat)) (list nat)) (lists nat))
;(assert (forall ((a nat) (xs (list nat))) (= (asc a xs (Nil nat)) (Cons (list nat) xs (Cons (list nat) (Cons nat a (Nil nat)) (Nil (list nat)))))))
;(assert (forall ((a nat) (xs (list nat)) (b nat) (ys (list nat))) (= (asc a xs (Cons nat b ys))
;  (ite (not (< b a)) (asc b (xs . (#) a) ys) (Cons (list nat) (xs (Cons nat a (Nil nat))) (runs (Cons nat b ys)))))))
(declare-fun desc (par (a) (a (list a) (list a)) (lists a)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (desc a x xs (Nil a)) (Cons (list a) (Cons a x xs) (Nil (list a)))))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (desc a x xs (Cons a y ys))
  (ite (less a y x) (desc a y (Cons a x xs) ys) (Cons (list a) (Cons a x xs) (runs a (Cons a y ys))))))))

; Ball(set(runs(xs)),sorted)
(assert-not (par (a) (forall ((xs (list a))) (Ball_sorted a (runs a xs)))))