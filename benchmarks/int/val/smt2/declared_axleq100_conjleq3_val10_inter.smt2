(set-logic UFLIA)

(declare-fun f (Int) Int)

(assert (forall ((x Int)) (=> (<= x 100) (= (f x) (f (- x 1))))))

(assert (not (forall ((x Int)) (=> (<= x 3) (= (f x) (f 10))))))

(check-sat)
