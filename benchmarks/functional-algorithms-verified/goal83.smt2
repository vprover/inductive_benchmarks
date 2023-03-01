; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
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
(declare-fun min (nat nat) nat)
(assert (forall ((x nat) (y nat)) (= (min x y) (ite (leq nat x y) x y))))
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max nat (h a l) (h a r)))))))
(declare-fun mh (par (a) ((tree a)) nat))
(assert (par (a) (= (mh a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (mh a (Node a l x r)) (s (min (mh a l) (mh a r)))))))
(declare-fun complete (par (a) ((tree a)) Bool))
(assert (par (a) (complete a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (complete a (Node a l x r)) (and (= (h a l) (h a r)) (complete a l) (complete a r))))))

; complete(t) <-> mh(t) = h(t)
(assert-not (par (a) (forall ((t (tree a))) (= (complete a t) (= (mh a t) (h a t))))))
