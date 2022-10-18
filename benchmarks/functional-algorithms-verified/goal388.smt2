(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype heap (par (a) ((Empty) (Hp (Hp_0 a) (Hp_1 (list (heap a)))))))
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun less (par (a) (a a) Bool))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
(declare-fun in_heap (par (a) (a (heap a)) Bool))
(declare-fun in_heap_inner (par (a) (a (list (heap a))) Bool))
(assert (par (a) (forall ((x a)) (not (in_heap_inner a x (Nil (heap a)))))))
(assert (par (a) (forall ((x a) (h (heap a)) (hs (list (heap a)))) (= (in_heap_inner a x (Cons (heap a) h hs))
  (or (in_heap a x h) (in_heap_inner a x hs))))))
(assert (par (a) (forall ((x a)) (not (in_heap a x (Empty a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list (heap a)))) (= (in_heap a x (Hp a y ys)) (or (= x y) (in_heap_inner a x ys))))))
(declare-fun pheap (par (a) ((heap a)) Bool))
(assert (par (a) (pheap a (Empty a))))
(assert (par (a) (forall ((x a) (hs (list (heap a)))) (= (pheap a (Hp a x hs)) (forall ((h (heap a))) (=> (in_set (heap a) h hs)
  (and (forall ((y a)) (=> (in_heap a y h) (leq a x y))) (pheap a h))))))))
(declare-fun merge_heap (par (a) ((heap a) (heap a)) (heap a)))
(assert (par (a) (forall ((h (heap a))) (= (merge_heap a h (Empty a)) h))))
(assert (par (a) (forall ((h (heap a))) (= (merge_heap a (Empty a) h) h))))
(assert (par (a) (forall ((x a) (hsx (list (heap a))) (y a) (hsy (list (heap a)))) (= (merge_heap a (Hp a x hsx) (Hp a y hsy))
  (ite (less a x y) (Hp a x (Cons (heap a) (Hp a y hsy) hsx)) (Hp a y (Cons (heap a) (Hp a x hsx) hsy)))))))
(declare-fun merge_pairs (par (a) ((list (heap a))) (heap a)))
(assert (par (a) (= (merge_pairs a (Nil (heap a))) (Empty a))))
(assert (par (a) (forall ((h (heap a))) (= (merge_pairs a (Cons (heap a) h (Nil (heap a)))) h))))
(assert (par (a) (forall ((h1 (heap a)) (h2 (heap a)) (hs (list (heap a)))) (= (merge_pairs a (Cons (heap a) h1 (Cons (heap a) h2 hs)))
  (merge_heap a (merge_heap a h1 h2) (merge_pairs a hs))))))
(declare-fun del_min_heap (par (a) ((heap a)) (heap a)))
(assert (par (a) (= (del_min_heap a (Empty a)) (Empty a))))
(assert (par (a) (forall ((x a) (hs (list (heap a)))) (= (del_min_heap a (Hp a x hs)) (merge_pairs a hs)))))

; pheap h -> pheap (del_min h)
(assert-not (par (a) (forall ((h (heap a))) (=> (pheap a h) (pheap a (del_min_heap a h))))))
