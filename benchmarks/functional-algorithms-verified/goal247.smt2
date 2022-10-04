; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
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
(declare-fun splice (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (splice a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (splice a (Cons a x xs) ys)
  (Cons a x (splice a ys xs))))))
(declare-fun list_of (par (a) ((tree a)) (list a)))
(assert (par (a) (= (list_of a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (list_of a (Node a l x r))
  (Cons a x (splice a (list_of a l) (list_of a r)))))))
(declare-fun merge_braun (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((r (tree a))) (= (merge_braun a (Leaf a) r) r))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (rr (tree a))) (= (merge_braun a (Node a l x r) rr)
  (Node a rr x (merge_braun a l r))))))

; braun(<l,x,r>) -> list(merge(l,r)) = splice(list(l),list(r))
(assert-not (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (braun a (Node a l x r)) (= (list_of a (merge_braun a l r)) (splice a (list_of a l) (list_of a r)))))))
