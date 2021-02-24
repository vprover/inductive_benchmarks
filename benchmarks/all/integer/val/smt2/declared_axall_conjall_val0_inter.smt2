(set-logic UFLIA)

(declare-fun f (Int) Int)

(assert (forall ((x Int)) (= (f x) (f (+ x 1)))))

(assert (not (forall ((x Int)) (= (f x) (f 0)))))

(check-sat)
