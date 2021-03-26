(set-logic UFNIA)

(declare-fun pow (Int Int) Int)
(assert (forall ((x Int)) (= (pow x 1) x)))
(assert (forall ((x Int) (e Int)) (=> (<= 2 e) (= (pow x e) (* x (pow x (- e 1)))))))

(assert (not (forall ((x Int) (y Int) (e Int)) (=> (and (<= x 0) (<= y 0) (>= e 17)) (= (pow (* x y) e) (* (pow x e) (pow y e)))))))

(check-sat)
