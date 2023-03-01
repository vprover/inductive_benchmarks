; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(define-sort lists (a) (list (list a)))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (less a x y) (and (leq a x y) (distinct x y))))))
(assert (par (a) (forall ((x a)) (leq a x x))))
(assert (par (a) (forall ((x a) (y a) (z a)) (=> (and (leq a x y) (leq a y z)) (leq a x z)))))
(assert (par (a) (forall ((x a) (y a)) (=> (and (leq a x y) (leq a y x)) (= x y)))))
(assert (par (a) (forall ((x a) (y a)) (or (leq a x y) (leq a y x)))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
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

; |runs(xs)| <= |xs|
(assert-not (par (a) (forall ((xs (list a))) (leq nat (len (list a) (runs a xs)) (len a xs)))))
