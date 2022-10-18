(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype heap (par (a) ((Empty) (Hp (Hp_0 a) (Hp_1 (list (heap a)))))))
(declare-fun in_heap (par (a) (a (heap a)) Bool))
(declare-fun in_heap_inner (par (a) (a (list (heap a))) Bool))
(assert (par (a) (forall ((x a)) (not (in_heap_inner a x (Nil (heap a)))))))
(assert (par (a) (forall ((x a) (h (heap a)) (hs (list (heap a)))) (= (in_heap_inner a x (Cons (heap a) h hs))
  (or (in_heap a x h) (in_heap_inner a x hs))))))
(assert (par (a) (forall ((x a)) (not (in_heap a x (Empty a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list (heap a)))) (= (in_heap a x (Hp a y ys)) (or (= x y) (in_heap_inner a x ys))))))
(declare-fun get_min_heap (par (a) ((heap a)) a))
(assert (par (a) (forall ((x a) (hs (list (heap a)))) (= (get_min_heap a (Hp a x hs)) x))))

; h != Empty -> get_min h in mset_heap h
(assert-not (par (a) (forall ((h (heap a))) (=> (distinct h (Empty a)) (in_heap a (get_min_heap a h) h)))))
