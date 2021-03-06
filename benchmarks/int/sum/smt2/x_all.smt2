(set-logic UFNIA)

(declare-fun sumX (Int Int) Int)
(assert (forall ((x Int)) (= (sumX x x) x)))
(assert (forall ((x Int) (y Int)) (=> (< x y) (= (sumX x y) (+ x (sumX (+ x 1) y))))))

(assert (not (forall ((x Int) (y Int)) (=> (<= x y) (= (* 2 (sumX x y)) (- (* y (+ y 1)) (* x (- x 1))))))))

(check-sat)
