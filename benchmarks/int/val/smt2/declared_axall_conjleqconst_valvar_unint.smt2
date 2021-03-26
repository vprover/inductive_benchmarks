(set-logic UFLIA)

(declare-fun f (Int) Int)
(declare-fun b () Int)

(assert (forall ((x Int)) (= (f x) (f (- x 1)))))

(assert (not (forall ((x Int) (y Int)) (=> (and (<= x b) (<= y b)) (= (f x) (f y))))))

(check-sat)
