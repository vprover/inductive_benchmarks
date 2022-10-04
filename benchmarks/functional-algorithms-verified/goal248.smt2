; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun merge_braun (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((r (tree a))) (= (merge_braun a (Leaf a) r) r))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (rr (tree a))) (= (merge_braun a (Node a l x r) rr)
  (Node a rr x (merge_braun a l r))))))
(declare-fun del_lo (par (a) ((tree a)) (tree a)))
(assert (par (a) (= (del_lo a (Leaf a)) (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_lo a (Node a l x r)) (merge_braun a l r)))))

; braun(t) -> braun(del_lo(t))
(assert-not (par (a) (forall ((t (tree a))) (=> (braun a t) (braun a (del_lo a t))))))
