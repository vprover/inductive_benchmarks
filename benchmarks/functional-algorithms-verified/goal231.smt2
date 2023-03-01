; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
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
(declare-fun in_range (nat nat nat) Bool)
(assert (forall ((x nat) (y nat) (z nat)) (= (in_range x y z) (and (leq nat y x) (leq nat x z)))))
(declare-fun div2 (nat) nat)
(assert (= (div2 zero) zero))
(assert (= (div2 (s zero)) zero))
(assert (forall ((n nat)) (= (div2 (s (s n))) (s (div2 n)))))
(declare-fun even (nat) Bool)
(assert (even zero))
(assert (forall ((x nat)) (= (even (s x)) (not (even x)))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun update1 (par (a) (nat a (tree a)) (tree a)))
(assert (par (a) (forall ((n nat) (x a)) (= (update1 a n x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((n nat) (x a) (l (tree a)) (y a) (r (tree a))) (= (update1 a n x (Node a l y r))
  (ite (= n (s zero)) (Node a l x r) (ite (even n) (Node a (update1 a (div2 n) x l) y r)
    (Node a l y (update1 a (div2 n) x r))))))))

; braun(t) & n in {1..|t|} -> |update1(n,x,t)| = |t|
(assert-not (par (a) (forall ((n nat) (t (tree a)) (x a)) (=> (and (braun a t) (in_range n (s zero) (size a t))) (= (size a (update1 a n x t)) (size a t))))))
