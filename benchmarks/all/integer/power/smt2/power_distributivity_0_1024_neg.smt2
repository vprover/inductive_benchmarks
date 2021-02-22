(set-logic UFNIA)

(declare-fun pow (Int Int) Int)
(assert (forall ((x Int)) (= (pow x 0) 1)))
(assert (forall ((x Int) (e Int)) (=> (<= 1 e) (= (pow x e) (* x (pow x (- e 1)))))))

(assert (not (forall ((x Int) (y Int) (e Int)) (=> (and (<= x 0) (<= y 0) (>= e 1024)) (= (pow (* x y) e) (* (pow x e) (pow y e)))))))

(check-sat)
