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
(define-sort tree_ht (a) (ptree a nat))
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
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max nat (h a l) (h a r)))))))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
(declare-fun ht (par (a) ((tree_ht a)) nat))
(assert (par (a) (= (ht a (LeafP a nat)) zero)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (ht a (NodeP a nat l x n r)) n))))
(declare-fun node (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (r (tree_ht a))) (= (node a l x r) (NodeP a nat l x (s (max nat(ht a l) (ht a r))) r)))))
(declare-fun avl (par (a) ((tree_ht a)) Bool))
(assert (par (a) (avl a (LeafP a nat))))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (avl a (NodeP a nat l x n r))
  (let ((hl (h (pair a nat) l)) (hr (h (pair a nat) r))) (and (or (= hl hr) (= (s hl) hr) (= hl (s hr))) (= n (s (max nat hl hr))) (avl a l) (avl a r)))))))
(declare-fun balL (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((XY (tree_ht a)) (z a) (Z (tree_ht a))) (= (balL a XY z Z) (ite (= (ht a XY) (s (s (ht a Z))))
  (match XY (((Node (pair a nat) X x Y) (ite (leq nat (ht a Y) (ht a X)) (node a X (Pair_0 a nat x) (node a Y z Z))
                (match Y (((Node (pair a nat) Y1 y Y2) (node a (node a X (Pair_0 a nat x) Y1) (Pair_0 a nat y) (node a Y2 z Z)))
                          ((Leaf (pair a nat)) (node a XY z Z))))))
             ((Leaf (pair a nat)) (node a XY z Z)))) (node a XY z Z))))))
(declare-fun balR (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((X (tree_ht a)) (x a) (YZ (tree_ht a))) (= (balR a X x YZ) (ite (= (ht a YZ) (s (s (ht a X))))
  (match YZ (((Node (pair a nat) Y y Z) (ite (leq nat (ht a Y) (ht a Z)) (node a (node a X x Y) (Pair_0 a nat y) Z)
                (match Y (((Node (pair a nat) Y1 z Y2) (node a (node a X x Y1) (Pair_0 a nat z) (node a Y2 (Pair_0 a nat y) Z)))
                          (_ (node a X x YZ))))))
             (_ (node a X x YZ)))) (node a X x YZ))))))
(declare-fun split_max (par (a) ((tree_ht a)) (pair (tree_ht a) a)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (split_max a (NodeP a nat l x n r))
  (ite (= r (LeafP a nat)) (Pair (tree_ht a) a l x) (let ((rx (split_max a r))) (Pair (tree_ht a) a (balL a l x (Pair_0 (tree_ht a) a rx)) (Pair_1 (tree_ht a) a rx))))))))
(declare-fun deleteAVL (par (a) (a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((x a)) (= (deleteAVL a x (LeafP a nat)) (LeafP a nat)))))
(assert (par (a) (forall ((x a) (l (tree_ht a)) (y a) (n nat) (r (tree_ht a))) (= (deleteAVL a x (NodeP a nat l y n r))
  (match (cmp a x y) ((LT (balR a (deleteAVL a x l) y r))
                      (EQ (ite (= l (LeafP a nat)) r (let ((ly (split_max a l))) (balR a (Pair_0 (tree_ht a) a ly) (Pair_1 (tree_ht a) a ly) r))))
                      (GT (balL a l y (deleteAVL a x r)))))))))

; avl(t) & t' = delete(x,t) -> avl(t') & h(t) in { h(t'), h(t') + 1 }
(assert-not (par (a) (forall ((x a) (t (tree_ht a)) (t' (tree_ht a))) (=> (and (avl a t) (= t' (deleteAVL a x t))) (and (avl a t') (or (= (h (pair a nat) t) (h (pair a nat) t')) (= (h (pair a nat) t) (s (h (pair a nat) t')))))))))
