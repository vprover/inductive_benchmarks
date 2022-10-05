(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
; TODO there are multiple undefined branches in splay which we cover with this uninterpreted function
(declare-const splay_undefined (par (a) (tree a)))
(declare-fun splay_max (par (a) ((tree a)) (tree a)))
(assert (par (a) (= (splay_max a (Leaf a)) (Leaf a))))
(assert (par (a) (forall ((A (tree a)) (x a)) (= (splay_max a (Node a A x (Leaf a))) (Node a A x (Leaf a))))))
(assert (par (a) (forall ((A (tree a)) (x a) (B' (tree a)) (y a) (CD (tree a))) (= (splay_max a (Node a A x (Node a B' y CD)))
  (ite (= CD (Leaf a)) (Node a (Node a A x B') y (Leaf a)) (match (splay_max a CD)
    (((Node a C z D) (Node a (Node a (Node a A x B') y C) z D))
     (_ (splay_undefined a)))))))))

; splay_max t = <> <-> t = <>
(assert-not (par (a) (forall ((t (tree a))) (= (= (splay_max a t) (Leaf a)) (= t (Leaf a))))))
