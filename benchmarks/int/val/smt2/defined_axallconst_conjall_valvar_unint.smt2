(set-logic UFLIA)

(declare-fun f (Int) Int)
(declare-fun b () Int)

(assert (= (f b) 0))
(assert (forall ((x Int)) (=> (> x b) (= (f x) (f (- x 1))))))
(assert (forall ((x Int)) (=> (< x b) (= (f x) (f (+ x 1))))))
(assert (not (forall ((x Int) (y Int)) (= (f x) (f y)))))

(check-sat)
