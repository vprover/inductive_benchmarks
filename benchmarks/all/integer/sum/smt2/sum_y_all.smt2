(set-logic UFNIA)

(declare-fun sumY (Int Int) Int)
(assert (forall ((x Int)) (= (sumY x x) x)))
(assert (forall ((x Int) (y Int)) (=> (< x y) (= (sumY x y) (+ y (sumY x (- y 1)))))))

(assert (not (forall ((x Int) (y Int)) (=> (<= x y) (= (* 2 (sumY x y)) (- (* y (+ y 1)) (* x (- x 1))))))))

(check-sat)
