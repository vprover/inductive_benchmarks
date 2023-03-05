(declare-datatypes ((Lst 0)(Nat 0)) (((cons (head Nat) (tail Lst)) (nil))
((succ (pred Nat)) (zero))
))
(declare-fun count (Nat Lst) Nat)
(assert (forall ((x Nat)) (= (count x nil) zero) ))
(assert (forall ((x Nat) (y Nat) (z Lst)) (= (count x (cons y z)) (ite (= x y) (succ (count x z)) (count x z))) ))
(declare-fun append (Lst Lst) Lst)
(assert (forall ((x Lst)) (= (append nil x) x) ))
(assert (forall ((x Nat) (y Lst) (z Lst)) (= (append (cons x y) z) (cons x (append y z))) ))
(declare-fun rotate (Nat Lst) Lst)
(assert (forall ((x Lst)) (= (rotate zero x) x) ))
(assert (forall ((n Nat)) (= (rotate (succ n) nil) nil) ))
(assert (forall ((n Nat) (y Nat) (x Lst)) (= (rotate (succ n) (cons y x)) (rotate n (append x (cons y nil)))) ))
(assert (not (forall ((x Nat) (n Nat) (xs Lst)) (= (count x (rotate n xs)) (count x xs)) )))
(check-sat)
(exit)
