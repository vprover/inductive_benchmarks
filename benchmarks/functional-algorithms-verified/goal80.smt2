; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun pow2 (nat) nat)
(assert (forall ((x nat)) (= (pow2 x) (pow (s (s zero)) x))))
(declare-fun min (nat nat) nat)
(assert (forall ((x nat) (y nat)) (= (min x y) (ite (leq nat x y) x y))))
(declare-fun size1 (par (a) ((tree a)) nat))
(assert (par (a) (= (size1 a (Leaf a)) (s zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size1 a (Node a l x r)) (plus (size1 a l) (size1 a r))))))
(declare-fun mh (par (a) ((tree a)) nat))
(assert (par (a) (= (mh a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (mh a (Node a l x r)) (s (min (mh a l) (mh a r)))))))

; 2^mh(t) <= |t|_1
(assert-not (par (a) (forall ((t (tree a))) (leq nat (pow2 (mh a t)) (size1 a t)))))
