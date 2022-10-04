; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype treeh (par (a) ((LeafH (LeafH_0 nat) (LeafH_1 a)) (NodeH (NodeH_0 nat) (NodeH_1 (treeh a)) (NodeH_2 (treeh a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun in_alphabet (par (a) (a (treeh a)) Bool))
(assert (par (a) (forall ((w nat) (x a) (y a)) (= (in_alphabet a x (LeafH a w y)) (= x y)))))
(assert (par (a) (forall ((w nat) (x a) (t1 (treeh a)) (t2 (treeh a))) (= (in_alphabet a x (NodeH a w t1 t2))
  (or (in_alphabet a x t1) (in_alphabet a x t2))))))
(declare-fun consistent (par (a) ((treeh a)) Bool))
(assert (par (a) (forall ((w nat) (x a)) (consistent a (LeafH a w x)))))
; TODO the distinct here is not appropriate for empty intersection
;(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a))) (= (consistent a (NodeH a w t1 t2))
;  (and (forall ((x a)) (distinct (in_alphabet a x t1) (in_alphabet a x t2))) (consistent a t1) (consistent a t2))))))
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
(declare-fun splitLeaf (par (a) ((treeh a) nat a nat a) (treeh a)))
(assert (par (a) (forall ((wx nat) (x a) (wy nat) (y a) (wz nat) (z a)) (= (splitLeaf a (LeafH a wx x) wy y wz z)
  (ite (= x y) (NodeH a wx (LeafH a wx x) (LeafH a wz z)) (LeafH a wx x))))))
(assert (par (a) (forall ((w nat) (t1 (treeh a)) (t2 (treeh a)) (wx nat) (x a) (wy nat) (y a))
  (= (splitLeaf a (NodeH a w t1 t2) wx x wy y) (NodeH a w (splitLeaf a t1 wx x wy y) (splitLeaf a t2 wx x wy y))))))

; consistent(t) & a in alphabet(t) & freq(t,a) = wa + wb -> cost(splitLeaf(t,wa,a,wb,b)) = cost(t) + wa + wb
(assert-not (par (a) (forall ((t (treeh a)) (x a) (wx nat) (y a) (wy nat)) (=> (and (consistent a t) (in_alphabet a x t) (= (freq a t x) (plus wx wy)))
  (= (cost a (splitLeaf a t wx x wy y)) (plus (plus (cost a t) wx) wy))))))
