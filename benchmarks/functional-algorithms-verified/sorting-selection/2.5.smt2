(set-logic UFDT)
(declare-datatypes ((nat 0) (lst 0)) (((zero) (s (s0 nat))) ((nil) (cons (cons0 nat) (cons1 lst)))))

(declare-fun leq (nat nat) Bool)
(assert (forall ((x nat)) (leq x x)))
(assert (forall ((x nat) (y nat) (z nat)) (=> (and (leq x y) (leq y z)) (leq x z))))
(assert (forall ((x nat) (y nat)) (=> (and (leq x y) (leq y x)) (= x y))))
(assert (forall ((x nat) (y nat)) (or (leq x y) (leq y x))))

(declare-fun len (lst) Int)
(assert (= (len nil) 0))
(assert (forall ((x nat) (y lst)) (= (len (cons x y)) (+ (len y) 1)) ))

(declare-fun sorted (lst) Bool)
(assert (= (sorted nil) true))
(assert (forall ((x nat)) (= (sorted (cons x nil)) true) ))
(assert (forall ((x nat) (z nat) (y lst)) (= (sorted (cons x (cons z y))) (and (sorted (cons z y)) (leq x z))) ))

(declare-fun insort (nat lst) lst)
(assert (forall ((i nat)) (= (insort i nil) (cons i nil)) ))
(assert (forall ((i nat) (x nat) (y lst)) (= (insort i (cons x y)) (ite (leq i x) (cons i (cons x y)) (cons x (insort i y)))) ))
(declare-fun isort (lst) lst)
(assert (= (isort nil) nil))
(assert (forall ((x nat) (y lst)) (= (isort (cons x y)) (insort x (isort y))) ))

(declare-fun T_insort (nat lst) Int)
(assert (forall ((i nat)) (= (T_insort i nil) 1) ))
(assert (forall ((i nat) (x nat) (y lst)) (= (T_insort i (cons x y)) (+ (ite (leq i x) 0 (T_insort i y)) 1)) ))
(declare-fun T_isort (lst) Int)
(assert (= (T_isort nil) 1))
(assert (forall ((x nat) (y lst)) (= (T_isort (cons x y)) (+ (T_isort y) (T_insort x (isort y)) 1)) ))

(assert (not (forall ((xs lst)) (sorted (isort xs)) )))
(check-sat)