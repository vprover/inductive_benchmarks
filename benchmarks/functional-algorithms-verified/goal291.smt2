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
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
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
(declare-fun in_alphabet_F (par (a) (a (list (treeh a))) Bool))
(assert (par (a) (forall ((x a)) (not (in_alphabet_F a x (Nil (treeh a)))))))
(assert (par (a) (forall ((x a) (t (treeh a)) (ts (list (treeh a)))) (= (in_alphabet_F a x (Cons (treeh a) t ts))
  (or (in_alphabet a x t) (in_alphabet_F a x ts))))))
(declare-fun consistent (par (a) ((treeh a)) Bool))
(assert (par (a) (forall ((w nat) (x a)) (consistent a (LeafH a w x)))))
; TODO the distinct here is not appropriate for empty intersection
;(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a))) (= (consistent a (NodeH a w t1 t2))
;  (and (forall ((x a)) (distinct (in_alphabet a x t1) (in_alphabet a x t2))) (consistent a t1) (consistent a t2))))))
(declare-fun consistent_F (par (a) ((list (treeh a))) Bool))
(assert (par (a) (consistent_F a (Nil (treeh a)))))
(assert (par (a) (forall ((t (treeh a)) (ts (list (treeh a)))) (= (consistent_F a (Cons (treeh a) t ts))
  (and (consistent a t) (consistent_F a ts))))))
(declare-fun freq (par (a) ((treeh a) a) nat))
(assert (par (a) (forall ((w nat) (x a) (y a)) (= (freq a (LeafH a w x) y) (ite (= x y) w zero)))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a)) (x a)) (= (freq a (NodeH a w t1 t2) x)
  (plus (freq a t1 x) (freq a t2 x))))))
(declare-fun freq_F (par (a) ((list (treeh a)) a) nat))
(assert (par (a) (forall ((x a)) (= (freq_F a (Nil (treeh a)) x) zero))))
(assert (par (a) (forall ((t (treeh a)) (ts (list (treeh a))) (x a)) (= (freq_F a (Cons (treeh a) t ts) x)
  (plus (freq a t x) (freq_F a ts x))))))
(declare-fun splitLeaf (par (a) ((treeh a) nat a nat a) (treeh a)))
(assert (par (a) (forall ((wx nat) (x a) (wy nat) (y a) (wz nat) (z a)) (= (splitLeaf a (LeafH a wx x) wy y wz z)
  (ite (= x y) (NodeH a wx (LeafH a wx x) (LeafH a wz z)) (LeafH a wx x))))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a)) (wx nat) (x a) (wy nat) (y a))
  (= (splitLeaf a (NodeH a w t1 t2) wx x wy y) (NodeH a w (splitLeaf a t1 wx x wy y) (splitLeaf a t2 wx x wy y))))))
; TODO define this
(declare-fun splitLeaf_F (par (a) ((list (treeh a)) nat a nat a) (list (treeh a))))

; consistent_F ts & ts != [] & a in alphabet_F ts & freq_F ts a = wa + wb -> splitLeaf (huffman ts) wa a wb b = huffman (splitLeaf_F ts wa a wb b)
(assert-not (par (a) (forall ((ts (list (treeh a))) (x a) (y a) (wx nat) (wy nat))
  (=> (and (consistent_F a ts) (distinct ts (Nil (treeh a))) (in_alphabet_F a x ts) (= (freq_F a ts x) (plus wx wy)))
    (= (splitLeaf a (huffman a ts) wx x wy y) (huffman a (splitLeaf_F a ts wx x wy y)))))))
