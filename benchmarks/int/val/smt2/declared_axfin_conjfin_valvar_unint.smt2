(set-logic UFLIA)

(declare-fun f (Int) Int)
(declare-fun b1 () Int)
(declare-fun b2 () Int)

(assert (forall ((x Int)) (=> (and (>= x b1) (< x b2)) (= (f x) (f (+ x 1))))))

(assert (not (forall ((x Int) (y Int)) (=> (and (>= x b1) (<= x b2) (>= y b1) (<= y b2)) (= (f x) (f y))))))

(check-sat)
