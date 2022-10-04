; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(declare-fun div2 (nat) nat)
(assert (= (div2 zero) zero))
(assert (= (div2 (s zero)) zero))
(assert (forall ((n nat)) (= (div2 (s (s n))) (s (div2 n)))))
(declare-fun replicate (par (a) (nat a) (list a)))
(assert (par (a) (forall ((x a)) (= (replicate a zero x) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a)) (= (replicate a (s n) x) (Cons a x (replicate a n x))))))
(declare-fun odd (nat) Bool)
(assert (not (odd zero)))
(assert (forall ((x nat)) (= (odd (s x)) (not (odd x)))))
(declare-fun splice (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (splice a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (splice a (Cons a x xs) ys)
  (Cons a x (splice a ys xs))))))
(declare-fun list_of (par (a) ((tree a)) (list a)))
(assert (par (a) (= (list_of a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (list_of a (Node a l x r))
  (Cons a x (splice a (list_of a l) (list_of a r)))))))
(declare-fun braun2_of (par (a) (a nat) (pair (tree a) (tree a))))
(assert (par (a) (forall ((x a) (n nat)) (= (braun2_of a x n)
  (ite (= n zero) (Pair (tree a) (tree a) (Leaf a) (Node a (Leaf a) x (Leaf a)))
    (let ((st (braun2_of a x (div2 (s_0 n))))) (ite (odd n)
      (Pair (tree a) (tree a) (Node a (Pair_0 (tree a) (tree a) (st a)) x (Pair_0 (tree a) (tree a) (st a)))
                              (Node a (Pair_1 (tree a) (tree a) (st a)) x (Pair_0 (tree a) (tree a) (st a))))
      (Pair (tree a) (tree a) (Node a (Pair_1 (tree a) (tree a) (st a)) x (Pair_0 (tree a) (tree a) (st a)))
                              (Node a (Pair_1 (tree a) (tree a) (st a)) x (Pair_1 (tree a) (tree a) (st a)))))))))))

; braun2_of(x,n) = (s,t) -> list(s) = replicate(n,x) & list(t) = replicate(n + 1, x)
(assert-not (par (a) (forall ((x a) (n nat) (t (tree a)) (t' (tree a))) (=> (= (braun2_of a x n) (Pair (tree a) (tree a) t t'))
  (and (= (list_of a t) (replicate a n x)) (= (list_of a t') (replicate a (s n) x)))))))
