; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-const LeafP (par (a b) (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype color ((Red) (Black)))
(define-sort rbt (a) (ptree a color))
(declare-fun less (par (a) (a a) Bool))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
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
(declare-fun baliR (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)) (r (rbt a)))
  (= (baliR a t1 x r) (ite (or (= r (R a t2 y (R a t3 z t4))) (= r (R a (R a t2 y t3) z t4)))
    (R a (B a t1 x t2) y (B a t3 z t4)) (B a t1 x r))))))
(declare-fun insRB (par (a) (a (rbt a)) (rbt a)))
(assert (par (a) (forall ((x a)) (= (insRB a x (LeafP a color)) (R a (LeafP a color) x (LeafP a color))))))
(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (r (rbt a))) (= (insRB a x (B a l y r))
  (match (cmp a x y) ((LT (baliL a (insRB a x l) y r))
                      (EQ (B a l y r))
                      (GT (baliR a l y (insRB a x r)))))))))
(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (r (rbt a))) (= (insRB a x (R a l y r))
  (match (cmp a x y) ((LT (R a (insRB a x l) y r))
                      (EQ (R a l y r))
                      (GT (R a l y (insRB a x r)))))))))
(declare-fun invc2 (par (a) ((rbt a)) Bool))
(assert (par (a) (forall ((t (rbt a))) (= (invc2 a t) (invc a (paint a Black t))))))

; invc(t) & invh(t) -> invc2(ins(x,t)) & (color(t) = Black -> invc(ins(x,t))) & invh(ins(x,t)) & bh(ins(x,t)) = bh(t)
(assert-not (par (a) (forall ((x a) (t (rbt a))) (=> (and (invc a t) (invc a t)) (and (invc2 a (insRB a x t)) (=> (= (color_of a t) Black) (and (invc a (insRB a x t)) (invh a (insRB a x t)) (= (bh a (insRB a x t)) (bh a t)))))))))
