(set-logic UFLIA)

(declare-fun f (Int) Int)
(declare-fun b () Int)

(assert (forall ((x Int)) (=> (>= x b) (= (f x) 0))))
(assert (forall ((x Int)) (=> (< x b) (= (f x) (f (+ x 1))))))
(assert (not (forall ((x Int)) (=> (<= x b) (= (f x) (f b))))))

(check-sat)
