(set-logic UFLIA)

(declare-fun f (Int) Int)
(declare-fun b () Int)

(assert (forall ((x Int)) (=> (and (>= x 1) (< x b)) (= (f x) (f (+ x 1))))))

(assert (not (forall ((x Int)) (=> (and (>= x 1) (<= x b)) (= (f x) (f 1))))))

(check-sat)
