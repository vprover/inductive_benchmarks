; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype upI (par (a) ((TI (TI_0 (tree23 a))) (OF (OF_0 (tree23 a)) (OF_1 a) (OF_2 (tree23 a))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
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
(declare-fun treeI (par (a) ((upI a)) (tree23 a)))
(assert (par (a) (forall ((t (tree23 a))) (= (treeI a (TI a t)) t))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (treeI a (OF a l x r)) (Node2 a l x r)))))
(declare-fun ins (par (a) (a (tree23 a)) (upI a)))
(assert (par (a) (forall ((x a)) (= (ins a x (Leaf23 a)) (OF a (Leaf23 a) x (Leaf23 a))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (r (tree23 a))) (= (ins a x (Node2 a l y r))
  (match (cmp a x y) ((LT (match (ins a x l) (((TI a ll) (TI a (Node2 a ll y r)))
                                              ((OF a l1 z l2) (TI a (Node3 a l1 z l2 y r))))))
                      (EQ (TI a (Node2 a l y r)))
                      (GT (match (ins a x r) (((TI a rr) (TI a (Node2 a l y rr)))
                                              ((OF a r1 z r2) (TI a (Node3 a l y r1 z r2))))))))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (m (tree23 a)) (z a) (r (tree23 a))) (= (ins a x (Node3 a l y m z r))
  (match (cmp a x y) ((LT (match (ins a x l) (((TI a ll) (TI a (Node3 a ll y m z r)))
                                              ((OF a l1 u l2) (OF a (Node2 a l1 u l2) y (Node2 a m z r))))))
                      (EQ (TI a (Node3 a l y m z r)))
                      (GT (match (cmp a x z) ((LT (match (ins a x m) (((TI a mm) (TI a (Node3 a l y mm z r)))
                                                                      ((OF a m1 u m2) (OF a (Node2 a l y m1) u (Node2 a m2 z r))))))
                                              (EQ (TI a (Node3 a l y m z r)))
                                              (GT (match (ins a x r) (((TI a rr) (TI a (Node3 a l y m z rr)))
                                                                      ((OF a r1 u r2) (OF a (Node2 a l y m) z (Node2 a r1 u r2)))))))))))))))
(declare-fun hI (par (a) ((upI a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (hI a (TI a t)) (h23 a t)))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (hI a (OF a l x r)) (h23 a l)))))

; complete(t) -> complete(treeI(ins(a,t))) & hI(ins(a,t)) = h(t)
(assert-not (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (and (complete23 a (treeI a (ins a x t))) (= (hI a (ins a x t)) (h23 a t)))))))
