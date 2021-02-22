(set-logic UFLIA)

(declare-fun f (Int) Int)

(assert (= (f (- 1)) 0))
(assert (forall ((x Int)) (=> (> x (- 1)) (= (f x) (f (- x 1))))))
(assert (forall ((x Int)) (=> (< x (- 1)) (= (f x) (f (+ x 1))))))
(assert (not (forall ((x Int)) (= (f x) (f 3)))))

(check-sat)
