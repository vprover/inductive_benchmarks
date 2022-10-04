; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun nth (par (a) ((list a) nat) a))
(assert (par (a) (forall ((x a) (xs (list a)) (n nat)) (= (nth a (Cons a x xs) n) (match n
  ((zero x)
   ((s k) (nth a xs k))))))))
; extensionality
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (= xs ys) (and (= (len a xs) (len a ys))
  (forall ((i nat)) (=> (less nat i (len a xs)) (= (nth a xs i) (nth a ys i)))))))))
(declare-fun nodes (par (a) ((list (tree a)) (list a) (list (tree a))) (list (tree a))))
(assert (par (a) (forall ((ls (list (tree a))) (xs (list a)) (rs (list (tree a)))) (= (nodes a ls xs rs)
  (match xs (((Nil a) (Nil (tree a)))
             ((Cons a x xs0) (match ls
                (((Nil (tree a)) (match rs
                   (((Nil (tree a)) (Cons (tree a) (Node a (Leaf a) x (Leaf a)) (nodes a (Nil (tree a)) xs0 (Nil (tree a)))))
                    ((Cons (tree a) r rs0) (Cons (tree a) (Node a (Leaf a) x r) (nodes a (Nil (tree a)) xs0 rs0))))))
                 ((Cons (tree a) l ls0) (match rs
                   (((Nil (tree a)) (Cons (tree a) (Node a l x (Leaf a)) (nodes a ls0 xs0 (Nil (tree a)))))
                    ((Cons (tree a) r rs0) (Cons (tree a) (Node a l x r) (nodes a ls0 xs0 rs0)))))))))))))))

; i < |xs| -> nodes(ls,xs,rs) ! i = <if i < |ls| then ls ! i else <>, xs ! i, if i < |rs| then rs ! i else <>>
(assert-not (par (a) (forall ((i nat) (ls (list (tree a))) (xs (list a)) (rs (list (tree a)))) (=> (less nat i (len a xs))
  (= (nth (tree a) (nodes a ls xs rs) i) (Node a (ite (less nat i (len (tree a) ls)) (nth (tree a) ls i) (Leaf a)) (nth a xs i) (ite (less nat i (len (tree a) rs)) (nth (tree a) rs i) (Leaf a))))))))
