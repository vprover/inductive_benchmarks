; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype unit ((Unit)))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
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
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun size1 (par (a) ((tree a)) nat))
(assert (par (a) (= (size1 a (Leaf a)) (s zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size1 a (Node a l x r)) (plus (size1 a l) (size1 a r))))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max nat (h a l) (h a r)))))))
(declare-fun fibt (nat) (tree unit))
(assert (= (fibt zero) (Leaf unit)))
(assert (= (fibt (s zero)) (Node unit (Leaf unit) Unit (Leaf unit))))
(assert (forall ((n nat)) (= (fibt (s (s n))) (Node unit (fibt (s n)) Unit (fibt n)))))

; avl(t) -> |fibt(h(t))|_1 <= |t|_1
(assert-not (par (a) (forall ((t (tree a))) (leq nat (size1 unit (fibt (h a t))) (size1 a t)))))
