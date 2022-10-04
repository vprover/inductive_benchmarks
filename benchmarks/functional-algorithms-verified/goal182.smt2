; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-const LeafP (par (a b) (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(define-sort tree_ht (a) (ptree a nat))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun fib (nat) nat)
(assert (= (fib zero) zero))
(assert (= (fib (s zero)) (s zero)))
(assert (forall ((n nat)) (= (fib (s (s n))) (plus (fib (s n)) (fib n)))))
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun size1 (par (a) ((tree a)) nat))
(assert (par (a) (= (size1 a (Leaf a)) (s zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size1 a (Node a l x r)) (plus (size1 a l) (size1 a r))))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max nat (h a l) (h a r)))))))
(declare-fun avl (par (a) ((tree_ht a)) Bool))
(assert (par (a) (avl a (LeafP a nat))))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (avl a (NodeP a nat l x n r))
  (let ((hl (h (pair a nat) l)) (hr (h (pair a nat) r))) (and (or (= hl hr) (= (s hl) hr) (= hl (s hr))) (= n (s (max nat hl hr))) (avl a l) (avl a r)))))))

; avl(t) -> fib(h(t) + 2) <= |t|_1
(assert-not (par (a) (forall ((t (tree_ht a))) (=> (avl a t) (leq nat (fib (plus (h (pair a nat) t) (s (s zero)))) (size1 (pair a nat) t))))))
