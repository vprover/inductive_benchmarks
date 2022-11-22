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
(declare-fun baliR (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)))
  (= (baliR a t1 x t2) (let ((eb (B a t1 x t2)))
    (match t2
      (((Node (pair a color) l p r) (match (Pair_1 a color p)
        ((Red (match r ; t2 is (R ...)
          (((Node (pair a color) rl rp rr) (match (Pair_1 a color rp)
            ((Red (R a (B a t1 x l) (Pair_0 a color p) (B a rl (Pair_0 a color rp) rr))) ; t2 is (R ... (R ...))
             (_ (match l ; t2 is (R ... (B ...))
                (((Node (pair a color) ll lp lr) (match (Pair_1 a color lp)
                  ((Red (R a (B a t1 x ll) (Pair_0 a color lp) (B a lr (Pair_0 a color p) r))) ; t2 is (R (R ...) . (B ...))
                   (_ eb)))) ; t2 is (R (B ...) . (B ...))
                 (_ eb))))))) ; t2 is (R Leaf . (B ...))
           (_ (match l ; t2 is (R ... Leaf)
              (((Node (pair a color) ll lp lr) (match (Pair_1 a color lp)
                  ((Red (R a (B a t1 x ll) (Pair_0 a color lp) (B a lr (Pair_0 a color p) r))) ; t2 is (R (R ...) . Leaf)
                   (_ eb)))) ; t2 is (R (B ...) . Leaf)
               (_ eb))))))) ; t2 is (R Leaf . Leaf)
           (_ eb)))) ; t2 is (B ...)
       (_ eb)))))))) ; t2 is Leaf
(declare-fun invc2 (par (a) ((rbt a)) Bool))
(assert (par (a) (forall ((t (rbt a))) (= (invc2 a t) (invc a (paint a Black t))))))

; invh(l) & invh(r) & invc(l) & invc2(r) & bh(l) = bh(r) -> invc(baliR(l,a,r)) & invh(baliR(l,a,r)) & bh(baliR(l,a,r)) = bh(l) + 1
(assert-not (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (=> (and (invh a l) (invh a r) (invc a l) (invc2 a r) (= (bh a l) (bh a r))) (and (invc a (baliR a l x r)) (invh a (baliR a l x r)) (= (bh a (baliR a l x r)) (s (bh a l))))))))
