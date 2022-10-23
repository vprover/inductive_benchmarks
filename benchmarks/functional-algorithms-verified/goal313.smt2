; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun del_left (par (a) ((tree a)) (pair a (tree a))))
(assert (par (a) (forall ((x a) (r (tree a))) (= (del_left a (Node a (Leaf a) x r)) (Pair a (tree a) x r)))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_left a (Node a l x r))
  (let ((yl (del_left a l))) (Pair a (tree a) (Pair_0 a (tree a) (yl a)) (Node a r x (Pair_1 a (tree a) (yl a)))))))))

; del_left t = (x,t') & t != <> -> |t| = |t'| + 1
(assert-not (par (a) (forall ((x a) (t (tree a)) (t' (tree a))) (=> (and (= (del_left a t) (Pair a (tree a) x t')) (distinct t (Leaf a))) (= (size a t) (s (size a t')))))))