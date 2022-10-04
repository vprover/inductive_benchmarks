; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))
(declare-fun div2 (nat) nat)
(assert (= (div2 zero) zero))
(assert (= (div2 (s zero)) zero))
(assert (forall ((n nat)) (= (div2 (s (s n))) (s (div2 n)))))
(declare-fun even (nat) Bool)
(assert (even zero))
(assert (forall ((x nat)) (= (even (s x)) (not (even x)))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun diff_braun (par (a) ((tree a) nat) nat))
(assert (par (a) (forall ((n nat)) (= (diff_braun a (Leaf a) n) zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (n nat)) (= (diff_braun a (Node a l x r) n)
  (ite (= n zero) (s zero) (ite (even n) (diff_braun a r (s_0 (div2 n))) (diff_braun a l (div2 n))))))))
(declare-fun size_fast (par (a) ((tree a)) nat))
(assert (par (a) (= (size_fast a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size_fast a (Node a l x r))
  (let ((n (size_fast a r))) (s (plus (mult (s (s zero)) n) (diff_braun a l n))))))))

; braun(t) -> size_fast(t) = |t|
(assert-not (par (a) (forall ((t (tree a))) (=> (braun a t) (= (size_fast a t) (size a t))))))
