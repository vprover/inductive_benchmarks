; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun pow2 (nat) nat)
(assert (forall ((x nat)) (= (pow2 x) (pow (s (s zero)) x))))
(declare-fun hd (par (a) ((list a)) a))
(assert (par (a) (forall ((x a) (xs (list a))) (= (hd a (Cons a x xs)) x))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun splice (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (splice a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (splice a (Cons a x xs) ys)
  (Cons a x (splice a ys xs))))))
(declare-fun list_of (par (a) ((tree a)) (list a)))
(assert (par (a) (= (list_of a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (list_of a (Node a l x r))
  (Cons a x (splice a (list_of a l) (list_of a r)))))))
(declare-fun take_nths (par (a) (nat nat (list a)) (list a)))
(assert (par (a) (forall ((i nat) (k nat)) (= (take_nths a i k (Nil a)) (Nil a)))))
(assert (par (a) (forall ((i nat) (k nat) (x a) (xs (list a))) (= (take_nths a i k (Cons a x xs))
  (ite (= i zero) (Cons a x (take_nths a (s_0 (pow2 k)) k xs)) (take_nths a (s_0 i) k xs))))))
(declare-fun braun_list (par (a) ((tree a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a))) (= (braun_list a (Leaf a) xs) (= xs (Nil a))))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (xs (list a))) (= (braun_list a (Node a l x r) xs)
  (and (distinct xs (Nil a)) (= x (hd a xs)) (braun_list a l (take_nths a (s zero) (s zero) xs))
    (braun_list a r (take_nths a (s (s zero)) (s zero) xs)))))))

; braun_list(t,xs) <-> braun(t) & xs = list(t)
(assert-not (par (a) (forall ((t (tree a)) (xs (list a))) (= (braun_list a t xs) (and (braun a t) (= xs (list_of a t)))))))
