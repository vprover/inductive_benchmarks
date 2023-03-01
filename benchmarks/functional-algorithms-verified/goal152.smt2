; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype upD (par (a) ((TD (TD_0 (tree23 a))) (UF (UF_0 (tree23 a))))))
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
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
(declare-fun h23 (par (a) ((tree23 a)) nat))
(assert (par (a) (= (h23 a (Leaf23 a)) zero)))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (h23 a (Node2 a l x r))
  (s (max nat (h23 a l) (h23 a r)))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a)))
  (= (h23 a (Node3 a l x m y r)) (s (max nat (h23 a l) (max nat (h23 a m) (h23 a r))))))))
(declare-fun complete23 (par (a) ((tree23 a)) Bool))
(assert (par (a) (complete23 a (Leaf23 a))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (complete23 a (Node2 a l x r))
  (and (= (h23 a l) (h23 a r)) (complete23 a l) (complete23 a r))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a))) (= (complete23 a (Node3 a l x m y r))
  (and (= (h23 a l) (h23 a m)) (= (h23 a m) (h23 a r)) (complete23 a l) (complete23 a m) (complete23 a r))))))
(declare-fun treeD (par (a) ((upD a)) (tree23 a)))
(assert (par (a) (forall ((t (tree23 a))) (= (treeD a (TD a t)) t))))
(assert (par (a) (forall ((t (tree23 a))) (= (treeD a (UF a t)) t))))
(declare-fun node21 (par (a) ((upD a) a (tree23 a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (node21 a (TD a t1) x t2) (TD a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node21 a (UF a t1) x (Node2 a t2 y t3))
  (UF a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node21 a (UF a t1) x (Node3 a t2 y t3 z t4)) (TD a (Node2 a (Node2 a t1 x t2) y (Node2 a t3 z t4)))))))
(declare-fun node22 (par (a) ((tree23 a) a (upD a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (node22 a t1 x (TD a t2)) (TD a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node22 a (Node2 a t1 x t2) y (UF a t3))
  (UF a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node22 a (Node3 a t1 x t2 y t3) z (UF a t4)) (TD a (Node2 a (Node2 a t1 x t2) y (Node2 a t3 z t4)))))))
(declare-fun node31 (par (a) ((upD a) a (tree23 a) a (tree23 a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node31 a (TD a t1) x t2 y t3)
  (TD a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node31 a (UF a t1) x (Node2 a t2 y t3) z t4) (TD a (Node2 a (Node3 a t1 x t2 y t3) z t4))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)) (u a) (t5 (tree23 a)))
  (= (node31 a (UF a t1) x (Node3 a t2 y t3 z t4) u t5) (TD a (Node3 a (Node2 a t1 x t2) y (Node2 a t3 z t4) u t5))))))
(declare-fun node32 (par (a) ((tree23 a) a (upD a) a (tree23 a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node32 a t1 x (TD a t2) y t3)
  (TD a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node32 a t1 x (UF a t2) y (Node2 a t3 z t4)) (TD a (Node2 a t1 x (Node3 a t2 y t3 z t4)))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)) (u a) (t5 (tree23 a)))
  (= (node32 a t1 x (UF a t2) y (Node3 a t3 z t4 u t5)) (TD a (Node3 a t1 x (Node2 a t2 y t3) z (Node2 a t4 u t5)))))))
(declare-fun node33 (par (a) ((tree23 a) a (tree23 a) a (upD a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node33 a t1 x t2 y (TD a t3))
  (TD a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node33 a t1 x (Node2 a t2 y t3) z (UF a t4)) (TD a (Node2 a t1 x (Node3 a t2 y t3 z t4)))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)) (u a) (t5 (tree23 a)))
  (= (node33 a t1 x (Node3 a t2 y t3 z t4) u (UF a t5)) (TD a (Node3 a t1 x (Node2 a t2 y t3) z (Node2 a t4 u t5)))))))
(declare-fun split_min23 (par (a) ((tree23 a)) (pair a (upD a))))
(assert (par (a) (forall ((x a)) (= (split_min23 a (Node2 a (Leaf23 a) x (Leaf23 a))) (Pair a (upD a) x (UF a (Leaf23 a)))))))
(assert (par (a) (forall ((x a) (y a)) (= (split_min23 a (Node3 a (Leaf23 a) x (Leaf23 a) y (Leaf23 a)))
  (Pair a (upD a) x (TD a (Node2 a (Leaf23 a) y (Leaf23 a))))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (=> (and (distinct l (Leaf23 a)) (distinct r (Leaf23 a)))
  (= (split_min23 a (Node2 a l x r))
    (let ((xl (split_min23 a l))) (Pair a (upD a) (Pair_0 a (upD a) xl) (node21 a (Pair_1 a (upD a) xl) x r))))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a))) (=> (and (distinct l (Leaf23 a)) (distinct m (Leaf23 a)) (distinct r (Leaf23 a)))
  (= (split_min23 a (Node3 a l x m y r))
    (let ((xl (split_min23 a l))) (Pair a (upD a) (Pair_0 a (upD a) xl) (node31 a (Pair_1 a (upD a) xl) x m y r))))))))
(declare-fun del (par (a) (a (tree23 a)) (upD a)))
(assert (par (a) (forall ((x a)) (= (del a x (Leaf23 a)) (TD a (Leaf23 a))))))
(assert (par (a) (forall ((x a) (y a)) (= (del a x (Node2 a (Leaf23 a) y (Leaf23 a))) (ite (= x y) (UF a (Leaf23 a)) (TD a (Node2 a (Leaf23 a) y (Leaf23 a))))))))
(assert (par (a) (forall ((x a) (y a) (z a)) (= (del a x (Node3 a (Leaf23 a) y (Leaf23 a) z (Leaf23 a)))
  (TD a (ite (= x y) (Node2 a (Leaf23 a) z (Leaf23 a)) (ite (= x z) (Node2 a (Leaf23 a) y (Leaf23 a)) (Node3 a (Leaf23 a) y (Leaf23 a) z (Leaf23 a)))))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (r (tree23 a))) (=> (and (distinct l (Leaf23 a)) (distinct r (Leaf23 a))) (= (del a x (Node2 a l y r))
  (match (cmp a x y) ((LT (node21 a (del a x l) y r))
                      (EQ (let ((ar (split_min23 a r))) (node22 a l (Pair_0 a (upD a) ar) (Pair_1 a (upD a) ar))))
                      (GT (node22 a l y (del a x r))))))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (m (tree23 a)) (z a) (r (tree23 a))) (=> (and (distinct l (Leaf23 a)) (distinct m (Leaf23 a)) (distinct r (Leaf23 a)))
  (= (del a x (Node3 a l y m z r))
    (match (cmp a x y) ((LT (node31 a (del a x l) y m z r))
                        (EQ (let ((am (split_min23 a m))) (node32 a l (Pair_0 a (upD a) am) (Pair_1 a (upD a) am) z r)))
                        (GT (match (cmp a x z) ((LT (node32 a l y (del a x m) z r))
                                                (EQ (let ((br (split_min23 a r))) (node33 a l y m (Pair_0 a (upD a) br) (Pair_1 a (upD a) br))))
                                                (GT (node33 a l y m z (del a x r)))))))))))))
(declare-fun delete23 (par (a) (a (tree23 a)) (tree23 a)))
(assert (par (a) (forall ((x a) (t (tree23 a))) (= (delete23 a x t) (treeD a (del a x t))))))

; complete(t) -> complete(delete(x,t))
(assert-not (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (complete23 a (delete23 a x t))))))
