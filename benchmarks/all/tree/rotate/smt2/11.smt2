(set-logic UFDT)
(declare-datatypes ((nat 0) (list 0) (tree 0))
  (((zero) (s (s0 nat)))
   ((nil) (cons (head nat) (tail list)))
   ((Nil) (node (lc tree) (val nat) (rc tree)))))
(declare-fun app (list list) list)
(assert (forall ((r list)) (= (app nil r) r)))
(assert (forall ((a nat) (l list) (r list)) (= (app (cons a l) r) (cons a (app l r)))))
(declare-fun flatten0 (tree) list)
(assert (= (flatten0 Nil) nil))
(assert (forall ((p tree) (x nat) (q tree)) (= (flatten0 (node p x q)) (app (flatten0 p) (cons x (flatten0 q))))))
(declare-fun size (tree) nat)
(assert (= (size Nil) zero))
(assert (forall ((p tree) (x nat) (q tree)) (= (size (node p x q)) (s (add (size p) (size q))))))
(declare-fun flatten2 (tree list) list)
(assert (forall ((r list)) (= (flatten2 Nil r) r)))
(assert (forall ((p tree) (x nat) (q tree) (r list))
    (= (flatten2 (node p x q) r) (flatten2 p (cons x (flatten2 q r))))))
(declare-fun rotateLeft (tree) tree)
(assert (= (rotateLeft Nil) Nil))
(assert (forall ((p tree) (x nat)) (= (rotateLeft (node p x Nil)) (node p x Nil))))
(assert (forall ((p tree) (x nat) (q tree) (y nat) (r tree))
    (= (rotateLeft (node p x (node q y r))) (rotateLeft (node (node p x q) y r)))))
(declare-fun rotateRight (tree) tree)
(assert (= (rotateRight Nil) Nil))
(assert (forall ((p tree) (x nat)) (= (rotateRight (node Nil x p)) (node Nil x p))))
(assert (forall ((p tree) (x nat) (q tree) (y nat) (r tree))
    (= (rotateRight (node (node p x q) y r)) (rotateRight (node p x (node q y r))))))
(declare-fun mirror (tree tree) Bool)
(assert (forall ((t tree)) (= (mirror Nil t) (= t Nil))))
(assert (forall ((p tree) (x nat) (q tree)) (not (mirror (node p x q) Nil))))
(assert (forall ((p1 tree) (x1 nat) (q1 tree) (p2 tree) (x2 nat) (q2 tree))
    (= (mirror (node p1 x1 q1) (node p2 x2 q2)) (and (= x1 x2) (mirror p1 q2) (mirror q1 p2)))))
(assert (not (forall ((x tree))
  (= (rotateRight (rotateLeft x)) x)
)))
(check-sat)
