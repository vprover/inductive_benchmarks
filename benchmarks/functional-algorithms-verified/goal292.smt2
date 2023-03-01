; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype treeh (par (a) ((LeafH (LeafH_0 nat) (LeafH_1 a)) (NodeH (NodeH_0 nat) (NodeH_1 (treeh a)) (NodeH_2 (treeh a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
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
(declare-fun cachedWeight (par (a) ((treeh a)) nat))
(assert (par (a) (forall ((w nat) (x a)) (= (cachedWeight a (LeafH a w x)) w))))
(assert (par (a) (forall ((w nat) (l (treeh a)) (r (treeh a))) (= (cachedWeight a (NodeH a w l r)) w))))
(declare-fun uniteTrees (par (a) ((treeh a) (treeh a)) (treeh a)))
(assert (par (a) (forall ((t1 (treeh a)) (t2 (treeh a))) (= (uniteTrees a t1 t2)
  (NodeH a (plus (cachedWeight a t1) (cachedWeight a t2)) t1 t2)))))
(declare-fun insortTree (par (a) ((treeh a) (list (treeh a))) (list (treeh a))))
(assert (par (a) (forall ((u (treeh a))) (= (insortTree a u (Nil (treeh a))) (Cons (treeh a) u (Nil (treeh a)))))))
(assert (par (a) (forall ((u (treeh a)) (t (treeh a)) (ts (list (treeh a)))) (= (insortTree a u (Cons (treeh a) t ts))
  (ite (leq nat (cachedWeight a u) (cachedWeight a t)) (Cons (treeh a) u (Cons (treeh a) t ts))
    (Cons (treeh a) t (insortTree a u ts)))))))
(declare-fun huffman (par (a) ((list (treeh a))) (treeh a)))
(assert (par (a) (forall ((t (treeh a))) (= (huffman a (Cons (treeh a) t (Nil (treeh a)))) t))))
(assert (par (a) (forall ((t1 (treeh a)) (t2 (treeh a)) (ts (list (treeh a)))) (= (huffman a (Cons (treeh a) t1 (Cons (treeh a) t2 ts)))
  (huffman a (insortTree a (uniteTrees a t1 t2) ts))))))
(declare-fun in_alphabet (par (a) (a (treeh a)) Bool))
(assert (par (a) (forall ((w nat) (x a) (y a)) (= (in_alphabet a x (LeafH a w y)) (= x y)))))
(assert (par (a) (forall ((w nat) (x a) (t1 (treeh a)) (t2 (treeh a))) (= (in_alphabet a x (NodeH a w t1 t2))
  (or (in_alphabet a x t1) (in_alphabet a x t2))))))
(declare-fun consistent (par (a) ((treeh a)) Bool))
(assert (par (a) (forall ((w nat) (x a)) (consistent a (LeafH a w x)))))
; TODO the distinct here is not appropriate for empty intersection
;(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a))) (= (consistent a (NodeH a w t1 t2))
;  (and (forall ((x a)) (distinct (in_alphabet a x t1) (in_alphabet a x t2))) (consistent a t1) (consistent a t2))))))
(declare-fun consistent_F (par (a) ((list (treeh a))) Bool))
(assert (par (a) (consistent_F a (Nil (treeh a)))))
(assert (par (a) (forall ((t (treeh a)) (ts (list (treeh a)))) (= (consistent_F a (Cons (treeh a) t ts))
  (and (consistent a t) (consistent_F a ts))))))
(declare-fun height (par (a) ((treeh a)) nat))
(assert (par (a) (forall ((w nat) (x a)) (= (height a (LeafH a w x)) zero))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a))) (= (height a (NodeH a w t1 t2))
  (s (max nat (height a t1) (height a t2)))))))
(declare-fun height_F (par (a) ((list (treeh a))) nat))
(assert (par (a) (= (height_F a (Nil (treeh a))) zero)))
(assert (par (a) (forall ((t (treeh a)) (ts (list (treeh a)))) (= (height_F a (Cons (treeh a) t ts))
  (max nat (height a t) (height_F a ts))))))
(declare-fun freq (par (a) ((treeh a) a) nat))
(assert (par (a) (forall ((w nat) (x a) (y a)) (= (freq a (LeafH a w x) y) (ite (= x y) w zero)))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a)) (x a)) (= (freq a (NodeH a w t1 t2) x)
  (plus (freq a t1 x) (freq a t2 x))))))
(declare-fun weight (par (a) ((treeh a)) nat))
(assert (par (a) (forall ((w nat) (x a)) (= (weight a (LeafH a w x)) w))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a))) (= (weight a (NodeH a w t1 t2))
  (plus (weight a t1) (weight a t2))))))
(declare-fun cost (par (a) ((treeh a)) nat))
(assert (par (a) (forall ((w nat) (x a)) (= (cost a (LeafH a w x)) zero))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a))) (= (cost a (NodeH a w t1 t2))
  (plus (plus (weight a t1) (cost a t1)) (plus (weight a t2) (cost a t2)))))))
(declare-fun optimum (par (a) ((treeh a)) Bool))
(assert (par (a) (forall ((t (treeh a))) (= (optimum a t) (forall ((u (treeh a))) (=> (consistent a u)
  (=> (forall ((x a)) (= (in_alphabet a x t) (in_alphabet a x u))) (=> (forall ((y a)) (= (freq a u y) (freq a t y)))
    (leq nat (cost a t) (cost a u))))))))))
; TODO this definition is not fixed, so we can use the other variant with the inner forall in the recursive case
(declare-fun sortedByWeight (par (a) ((list (treeh a))) Bool))
(assert (par (a) (sortedByWeight a (Nil (treeh a)))))
(assert (par (a) (forall ((t (treeh a))) (sortedByWeight a (Cons (treeh a) t (Nil (treeh a)))))))
(assert (par (a) (forall ((t1 (treeh a)) (t2 (treeh a)) (ts (list (treeh a)))) (= (sortedByWeight a (Cons (treeh a) t1 (Cons (treeh a) t2 ts)))
  (and (leq nat (weight a t1) (weight a t2)) (sortedByWeight a (Cons (treeh a) t2 ts)))))))

; consistent_F ts & height_F ts = 0 & sortedByWeight ts & ts != [] -> optimum (huffman ts)
(assert-not (par (a) (forall ((ts (list (treeh a)))) (=> (and (consistent_F a ts) (= (height_F a ts) zero) (sortedByWeight a ts) (distinct ts (Nil (treeh a))))
  (optimum a (huffman a ts))))))
