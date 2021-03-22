(set-info :smt-lib-version 2.6)
(set-logic UFDT)
(set-info :category "crafted")
(declare-datatypes ((nat 0) (lst 0)) (((s (s0 nat)) (zero)) ((nil) (cons (cons0 nat) (cons1 lst)))))
(declare-fun add (nat nat) nat)
(declare-fun mul (nat nat) nat)
(declare-fun app (lst lst) lst)
(declare-fun len (lst) nat)
(declare-fun outOfBounds (nat) nat)
(declare-fun get (lst nat) nat)
(declare-fun cnt (lst nat) nat)
(declare-fun rev (lst) lst)
(declare-fun leq (nat nat) Bool)
(declare-fun less (nat nat) Bool)
(declare-fun pref (lst lst) Bool)
(assert (forall ((x nat)) (= (add zero x) x)))
(assert (forall ((x nat) (y nat)) (= (add (s x) y) (s (add x y)))))
(assert (forall ((y nat)) (= (mul zero y) zero)))
(assert (forall ((x nat) (y nat)) (= (mul (s x) y) (add y (mul x y)))))
(assert (forall ((x nat)) (= (leq zero x) true)))
(assert (forall ((x nat)) (= (leq (s x) zero) false)))
(assert (forall ((x nat) (y nat)) (= (leq (s x) (s y)) (leq x y))))
(assert (forall ((x nat) (y nat)) (= (less x y) (leq (s x) y))))
(assert (forall ((r lst)) (= (app nil r) r)))
(assert (forall ((a nat) (l lst) (r lst)) (= (app (cons a l) r) (cons a (app l r)))))
(assert (forall ((x lst)) (pref nil x)))
(assert (forall ((a nat) (x lst)) (not (pref (cons a x) nil))))
(assert (forall ((a nat) (b nat) (x lst) (y lst)) (= (pref (cons a x) (cons b y)) (and (= a b) (pref x y)))))
(assert (forall ((zero nat)) (= (len nil) zero)))
(assert (forall ((e nat) (l lst)) (= (len (cons e l)) (s (len l)))))
(assert (forall ((tail lst) (x nat)) (= (get (cons x tail) zero) x)))
(assert (forall ((i nat) (tail lst) (x nat)) (= (get (cons x tail) (s i)) (get tail i))))
(assert (forall ((i nat)) (= (get nil i) (outOfBounds i))))
(assert (forall ((x nat)) (= (cnt nil x) zero)))
(assert (forall ((e nat) (tail lst) (x nat)) (=> (not (= e x)) (= (cnt (cons e tail) x) (cnt tail e)))))
(assert (forall ((e nat) (tail lst)) (= (cnt (cons e tail) e) (s (cnt tail e)))))
(assert (forall ((x nat) (xs lst)) (= (rev (cons x xs)) (app (rev xs) (cons x nil)))))
(assert (= (rev nil) nil))
(assert (not (forall ((x lst) (y lst)) (=> (and (pref x y) (not (= (len x) (len y)))) (exists ((e nat)) (pref (cons e x) y))))))
(check-sat)
