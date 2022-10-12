(set-logic UFDT)
(declare-datatypes ((lst 0) (nat 0)) (((nil) (cons (cons0 nat) (cons1 lst))) ((zero) (s (s0 nat)))))
(declare-fun app (lst lst) lst)
(declare-fun pref (lst lst) Bool)
(assert (forall ((r lst)) (= (app nil r) r)))
(assert (forall ((a nat) (l lst) (r lst)) (= (app (cons a l) r) (cons a (app l r)))))
(assert (forall ((x lst)) (pref nil x)))
(assert (forall ((a nat) (x lst)) (not (pref (cons a x) nil))))
(assert (forall ((a nat) (b nat) (x lst) (y lst)) (= (pref (cons a x) (cons b y)) (and (= a b) (pref x y)))))
(assert (not (forall ((v0 lst)) (pref (app v0 v0) (app (app v0 (app (app v0 v0) (app v0 v0))) v0)))))
(check-sat)
