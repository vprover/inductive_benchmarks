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
(declare-datatype bal ((Lh) (Bal) (Rh)))
(define-sort tree_bal (a) (ptree a bal))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun max (par (a) (a a) a))
(assert (par (a) (forall ((x a) (y a)) (= (max a x y) (ite (leq a x y) y x)))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max nat (h a l) (h a r)))))))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
(declare-fun avl_bal (par (a) ((tree_bal a)) Bool))
(assert (par (a) (avl_bal a (LeafP a bal))))
(assert (par (a) (forall ((l (tree_bal a)) (x a) (b bal) (r (tree_bal a))) (= (avl_bal a (NodeP a bal l x b r))
  (and (match b ((Lh (= (h (pair a bal) l) (s (h (pair a bal) r))))
                 (Bal (= (h (pair a bal) l) (h (pair a bal) r)))
                 (Rh (= (s (h (pair a bal) l)) (h (pair a bal) r)))))
    (avl_bal a l) (avl_bal a r))))))
(declare-fun is_bal (par (a) ((tree_bal a)) Bool))
(assert (par (a) (forall ((l (tree_bal a)) (x a) (b bal) (r (tree_bal a))) (= (is_bal a (NodeP a bal l x b r)) (= b Bal)))))
(declare-fun incr (par (a b) ((tree_bal a) (tree_bal b)) Bool))
(assert (par (a b) (forall ((t (tree_bal a)) (t' (tree_bal b))) (= (incr a b t t')
  (or (= t (LeafP a bal)) (and (is_bal a t) (not (is_bal b t'))))))))
(declare-fun rot2 (par (a) ((tree_bal a) a (tree_bal a) a (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((A (tree_bal a)) (x a) (B1 (tree_bal a)) (y a) (b bal) (B2 (tree_bal a)) (z a) (C (tree_bal a)))
  (= (rot2 a A x (NodeP a bal B1 y b B2) z C) (let ((b1 (ite (= b Rh) Lh Bal)) (b2 (ite (= b Lh) Rh Bal)))
    (NodeP a bal (NodeP a bal A x b1 B1) y Bal (NodeP a bal B2 z b2 C)))))))
(declare-fun balL_bal (par (a) ((tree_bal a) a bal (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((X (tree_bal a)) (x a) (b bal) (Y (tree_bal a)) (y a) (Z (tree_bal a)))
  (= (balL_bal a (NodeP a bal X x b Y) y Lh Z) (match b
    ((Lh (NodeP a bal X x Bal (NodeP a bal Y y Bal Z)))
     (Bal (NodeP a bal X x Rh (NodeP a bal Y y Lh Z)))
     (Rh (rot2 a X x Y y Z))))))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Bal C) (NodeP a bal AB c Lh C)))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Rh C) (NodeP a bal AB c Bal C)))))
(declare-fun balR_bal (par (a) ((tree_bal a) a bal (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((X (tree_bal a)) (x a) (b bal) (Y (tree_bal a)) (y a) (Z (tree_bal a)))
  (= (balR_bal a X x Rh (NodeP a bal Y y b Z)) (match b
    ((Lh (rot2 a X x Y y Z))
     (Bal (NodeP a bal (NodeP a bal X x Rh Y) y Lh Z))
     (Rh (NodeP a bal (NodeP a bal X x Bal Y) y Bal Z))))))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Bal C) (NodeP a bal AB c Lh C)))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Rh C) (NodeP a bal AB c Bal C)))))
(declare-fun insert_bal (par (a) (a (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((x a)) (= (insert_bal a x (LeafP a bal)) (NodeP a bal (LeafP a bal) x Bal (LeafP a bal))))))
(assert (par (a) (forall ((x a) (l (tree_bal a)) (y a) (b bal) (r (tree_bal a))) (= (insert_bal a x (NodeP a bal l y b r))
  (match (cmp a x y) ((LT (let ((l' (insert_bal a x l))) (ite (incr a a l l') (balL_bal a l' y b r) (NodeP a bal l' y b r))))
                      (EQ (NodeP a bal l y b r))
                      (GT (let ((r' (insert_bal a x r))) (ite (incr a a r r') (balR_bal a l y b r') (NodeP a bal l y b r'))))))))))

; avl(t) & t' = insert(x,t) -> avl(t') & h(t') = h(t) + if incr(t,t') then 1 else 0
(assert-not (par (a) (forall ((x a) (t (tree_bal a)) (t' (tree_bal a))) (=> (and (avl_bal a t) (= t' (insert_bal a x t)))
  (and (avl_bal a t') (= (h (pair a bal) t') (ite (incr a a t t') (s (h (pair a bal) t)) (h (pair a bal) t))))))))
