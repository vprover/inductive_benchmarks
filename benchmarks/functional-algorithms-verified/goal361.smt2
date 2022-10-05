; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
; TODO there are multiple undefined branches in splay which we cover with this uninterpreted function
(declare-const splay_undefined (par (a) (tree a)))
(declare-fun splay_max (par (a) ((tree a)) (tree a)))
(assert (par (a) (= (splay_max a (Leaf a)) (Leaf a))))
(assert (par (a) (forall ((A (tree a)) (x a)) (= (splay_max a (Node a A x (Leaf a))) (Node a A x (Leaf a))))))
(assert (par (a) (forall ((A (tree a)) (x a) (B' (tree a)) (y a) (CD (tree a))) (= (splay_max a (Node a A x (Node a B' y CD)))
  (ite (= CD (Leaf a)) (Node a (Node a A x B') y (Leaf a)) (match (splay_max a CD)
    (((Node a C z D) (Node a (Node a (Node a A x B') y C) z D))
     (_ (splay_undefined a)))))))))

; |splay_max t| = |t|
(assert-not (par (a) (forall ((t (tree a))) (= (size a (splay_max a t)) (size a t)))))
