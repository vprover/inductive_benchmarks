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
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun size1 (par (a) ((tree a)) nat))
(assert (par (a) (= (size1 a (Leaf a)) (s zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size1 a (Node a l x r)) (plus (size1 a l) (size1 a r))))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max nat (h a l) (h a r)))))))
(declare-fun complete (par (a) ((tree a)) Bool))
(assert (par (a) (complete a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (complete a (Node a l x r)) (and (= (h a l) (h a r)) (complete a l) (complete a r))))))

; complete(t) -> |t|_1 = 2^h(t)
(assert-not (par (a) (forall ((t (tree a))) (=> (complete a t) (= (size1 a t) (pow (s (s zero)) (h a t)))))))
