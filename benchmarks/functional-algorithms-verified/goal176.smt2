; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-const LeafP (par (a b) (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(declare-datatype color ((Red) (Black)))
(define-sort rbt (a) (ptree a color))
(declare-fun R (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (R a l x r) (NodeP a color l x Red r)))))
(declare-fun B (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (B a l x r) (NodeP a color l x Black r)))))
(declare-fun color_of (par (a) ((rbt a)) color))
(assert (par (a) (= (color_of a (LeafP a color)) Black)))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (color_of a (NodeP a color l x c r)) c))))
(declare-fun paint (par (a) (color (rbt a)) (rbt a)))
(assert (par (a) (forall ((c color)) (= (paint a c (LeafP a color)) (LeafP a color)))))
(assert (par (a) (forall ((c color) (l (rbt a)) (x a) (d color) (r (rbt a))) (= (paint a c (NodeP a color l x d r)) (NodeP a color l x c r)))))
(declare-fun invc (par (a) ((rbt a)) Bool))
(assert (par (a) (invc a (LeafP a color))))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (invc a (NodeP a color l x c r))
  (and (=> (= c Red) (and (= (color_of a l) Black) (= (color_of a r) Black))) (invc a l) (invc a r))))))
(declare-fun bh (par (a) ((rbt a)) nat))
(assert (par (a) (= (bh a (LeafP a color)) zero)))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (bh a (NodeP a color l x c r))
  (ite (= c Black) (s (bh a l)) (bh a l))))))
(declare-fun invh (par (a) ((rbt a)) Bool))
(assert (par (a) (invh a (LeafP a color))))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (invh a (NodeP a color l x c r))
  (and (= (bh a l) (bh a r)) (invh a l) (invh a r))))))
(declare-fun baliL (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
  (= (baliL a l z t4) (ite (or (= l (R a (R a t1 x t2) y t3)) (= l (R a t1 x (R a t2 y t3))))
    (R a (B a t1 x t2) y (B a t3 z t4)) (B a l z t4))))))
(declare-fun invc2 (par (a) ((rbt a)) Bool))
(assert (par (a) (forall ((t (rbt a))) (= (invc2 a t) (invc a (paint a Black t))))))
(declare-fun baldR (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a)) (r1 (rbt a)) (r2 (rbt a)) (l1 (rbt a)) (l2 (rbt a)) (l3 (rbt a)) (l4 (rbt a)) (l5 (rbt a)) (xr a) (xl1 a) (xl2 a) (xl3 a))
  (= (baldR a l x r) (ite (= r (R a r1 xr r2)) (R a l x (B a r1 xr r2))
    (ite (= l (B a l1 xl1 l2)) (baliL a (R a l1 xl1 l2) x r) (ite (= l (R a l3 xl2 (B a l4 xl3 l5)))
      (R a (baliL a (paint a Red l3) xl2 l4) xl3 (B a l5 x r)) (R a l x r))))))))

; invh(l) & invh(r) & bh(l) = bh(r) + 1 & invc(l) & invc2(r) & t' = baldR(l,a,r) -> invh(t') & bh(t') = bh(l) & invc2(t') & (color(l) = Black -> invc(t'))
(assert-not (par (a) (forall ((l (rbt a)) (x a) (r (rbt a)) (t' (rbt a))) (=> (and (invh a l) (invh a r) (= (bh a l) (s (bh a r))) (invc a l) (invc2 a r) (= t' (baldR a l x r)))
  (and (invh a t') (= (bh a t') (bh a l)) (invc2 a t') (=> (= (color_of a l) Black) (invc a t')))))))