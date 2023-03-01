; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun minus (nat nat) nat)
(assert (forall ((n nat)) (= (minus zero n) zero) ))
(assert (forall ((n nat)) (= (minus n zero) n) ))
(assert (forall ((n nat) (m nat)) (= (minus (s n) (s m)) (minus n m)) ))
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
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun merge_skew (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((t (tree a))) (= (merge_skew a (Leaf a) t) t))))
(assert (par (a) (forall ((t (tree a))) (= (merge_skew a t (Leaf a)) t))))
(assert (par (a) (forall ((l1 (tree a)) (a1 a) (r1 (tree a)) (l2 (tree a)) (a2 a) (r2 (tree a))) (= (merge_skew a (Node a l1 a1 r1) (Node a l2 a2 r2))
  (ite (leq a a1 a2) (Node a (merge_skew a (Node a l2 a2 r2) r1) a1 l1) (Node a (merge_skew a (Node a l1 a1 r1) r2) a2 l2))))))
(declare-fun rh (par (a) ((tree a) (tree a)) nat))
(assert (par (a) (forall ((l (tree a)) (r (tree a))) (= (rh a l r) (ite (leq nat (size a l) (size a r)) (s zero) zero)))))
(declare-fun psi_skew (par (a) ((tree a)) nat))
(assert (par (a) (= (psi_skew a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (psi_skew a (Node a l x r)) (plus (plus (psi_skew a l) (psi_skew a r)) (rh a l r))))))
(declare-fun lrh (par (a) ((tree a)) nat))
(assert (par (a) (= (lrh a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (lrh a (Node a l x r)) (plus (rh a l r) (lrh a l))))))
(declare-fun rlh (par (a) ((tree a)) nat))
(assert (par (a) (= (rlh a (Leaf a)) zero)))
; TODO this might be different than what was meant in the book because of the minus
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (rlh a (Node a l x r)) (plus (minus (s zero) (rh a l r)) (rlh a l))))))
(declare-fun T_merge_skew (par (a) ((tree a) (tree a)) nat))
(assert (par (a) (forall ((t (tree a))) (= (T_merge_skew a (Leaf a) t) (s zero)))))
(assert (par (a) (forall ((t (tree a))) (= (T_merge_skew a t (Leaf a)) (s zero)))))
(assert (par (a) (forall ((l1 (tree a)) (a1 a) (r1 (tree a)) (l2 (tree a)) (a2 a) (r2 (tree a))) (= (T_merge_skew a (Node a l1 a1 r1) (Node a l2 a2 r2))
  (s (ite (leq a a1 a2) (T_merge_skew a (Node a l2 a2 r2) r1) (T_merge_skew a (Node a l1 a1 r1) r2)))))))

; T_merge t1 t2 + psi (merge t1 t2) - psi t1 - psi t2 <= lrh (merge t1 t2) + rlh t1 + rlh t2 + 1
(assert-not (par (a) (forall ((t1 (tree a)) (t2 (tree a))) (leq nat (minus (minus (plus (T_merge_skew a t1 t2) (psi_skew a (merge_skew a t1 t2))) (psi_skew a t1)) (psi_skew a t2))
  (s (plus (plus (lrh a (merge_skew a t1 t2)) (rlh a t1)) (rlh a t2)))))))
