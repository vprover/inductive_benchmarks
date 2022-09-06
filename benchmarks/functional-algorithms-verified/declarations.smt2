; TODO try replacing this with int
(declare-datatype nat ((zero) (s (s_0 nat))))

(declare-fun plus (nat nat) nat)
(assert (forall ((x nat)) (= (plus zero x) x)))
(assert (forall ((x nat) (y nat)) (= (plus (s x) y) (s (plus x y)))))
(declare-fun mult (nat nat) nat)
(assert (forall ((x nat)) (= (mult zero x) zero)))
(assert (forall ((x nat) (y nat)) (= (mult (s x) y) (plus (mult x y) y))))

(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
(define-sort lists (a) (list (list a)))
(declare-datatype option (par (a) ((None) (Some (Some_0 a)))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort ptree (a b) (tree (pair a b)))
(declare-fun LeafP (par (a b) () (ptree a b)))
(assert (par (a b) (= (LeafP a b) (Leaf (pair a b)))))
(declare-fun NodeP (par (a b) ((ptree a b) a b (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (NodeP a b l x y r) (Node (pair a b) l (Pair a b x y) r)))))
(define-sort itree (a) (ptree a nat))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype upI (par (a) ((TI (TI_0 (tree23 a))) (OF (OF_0 (tree23 a)) (OF_1 a) (OF_2 (tree23 a))))))
(declare-datatype upD (par (a) ((TD (TD_0 (tree23 a))) (UF (UF_0 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T (T_0 (tree23 a))) (TTs (TTs_0 (tree23 a)) (TTs_1 a) (TTs_2 (tree23s a))))))
(declare-datatype color ((Red) (Black)))
(declare-datatype unit ((Unit)))
(declare-datatype bal ((Lh) (Bal) (Rh)))
(define-sort tree_bal (a) (ptree a bal))
;(declare-datatype tree4 ((Leaf4) (Lh (Lh_0 tree4) (Lh_1 nat) (Lh_2 tree4)) (Bal (Bal_0 tree4) (Bal_1 nat) (Bal_2 tree4)) (Rh (Rh_0 tree4) (Rh_1 nat) (Rh_2 tree4))))
;(declare-datatype trie ((Nd Bool ('a -> 'a trie option))))
(declare-datatype trie ((Lf) (Nd (Nd_0 Bool) (Nd_1 trie) (Nd_2 trie))))
(declare-datatype trieP ((LfP) (NdP (NdP_0 (list Bool)) (NdP_1 Bool) (NdP_2 trieP) (NdP_3 trieP))))
;(declare-datatype rbt (par (a) ((LeafRB) (NodeRB (NodeR_0 (rbt a)) (NodeR_1 (pair a color)) (NodeR_2 (rbt a))))))
(define-sort rbt (a) (ptree a color))
(define-sort tree_ht (a) (ptree a nat))
(declare-datatype triple (par (a b c) ((Triple (Triple_0 a) (Triple_1 b) (Triple_2 c)))))
(define-sort lheap (a) (ptree a nat))

; auxiliary functions for sets and multisets -- remove these once a higher-order setting is used
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-fun in_set_ptree (par (a b) (a (ptree a b)) Bool))
(assert (par (a b) (forall ((x a)) (not (in_set_ptree a b x (LeafP a b))))))
(assert (par (a b) (forall ((x a) (l (ptree a b)) (y a) (z b) (r (ptree a b))) (= (in_set_ptree a b x (NodeP a b l y z r)) (or (= x y) (in_set_ptree a b x l) (in_set_ptree a b x r))))))
(declare-fun count (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (count a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (count a x (Cons a y ys)) (ite (= x y) (s (count a x ys)) (count a x ys))))))
(declare-fun same_set (par (a) ((list a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (same_set a xs ys) (forall ((x a)) (= (in_set a x xs) (in_set a x ys)))))))
(declare-fun same_mset (par (a) ((list a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (same_mset a xs ys) (forall ((x a)) (= (count a x xs) (count a x ys)))))))
(declare-fun count_ptree (par (a b) (a (ptree a b)) nat))
(assert (par (a b) (forall ((x a)) (= (count_ptree a b x (LeafP a b)) zero))))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((x a) (l (ptree a b)) (y a) (z b) (r (ptree a b))) (= (count_ptree a b x (NodeP a b l y z r))
;  (let ((lc (count_ptree a b x l)) (rc (count_ptree a b x r))) (ite (= x y) (s (plus lc rc)) (plus lc rc)))))))

; filter and map functions -- remove these once a higher-order setting is used
(declare-fun less (par (a) (a a) Bool))
(assert (forall ((x nat)) (not (less nat x zero))))
(assert (forall ((x nat)) (less nat zero (s x))))
(assert (forall ((x nat) (y nat)) (= (less nat (s x) (s y)) (less nat x y))))
(declare-fun leq (par (a) (a a) Bool))
(assert (par (a) (forall ((x a) (y a)) (= (leq a x y) (or (= x y) (less a x y))))))
; TODO remove this once int is used everywhere
;(assert (forall ((x nat)) (leq nat zero x)))
;(assert (forall ((x nat)) (not (leq nat (s x) zero))))
;(assert (forall ((x nat) (y nat)) (= (leq nat (s x) (s y)) (leq nat x y))))
(declare-fun filter_less (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (filter_less a x (Nil a)) (Nil a)))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (filter_less a x (Cons a y ys)) (ite (less a y x) (Cons a y (filter_less a x ys)) (filter_less a x ys))))))
(declare-fun filter_ge (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (filter_ge a x (Nil a)) (Nil a)))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (filter_ge a x (Cons a y ys)) (ite (not (less a y x)) (Cons a y (filter_ge a x ys)) (filter_ge a x ys))))))
(declare-fun map_list_lists (par (a) ((list a)) (lists a)))
(assert (par (a) (= (map_list_lists a (Nil a)) (Nil (list a)))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (map_list_lists a (Cons a x xs)) (Cons (list a) (Cons a x (Nil a)) (map_list_lists a xs))))))

; functions
(declare-fun pow (nat nat) nat)
(assert (forall ((x nat)) (= (pow x zero) (s zero))))
(assert (forall ((x nat) (e nat)) (= (pow x (s e)) (mult x (pow x e)))))
(declare-fun fib (nat) nat)
(assert (= (fib zero) zero))
(assert (= (fib (s zero)) (s zero)))
(assert (forall ((n nat)) (= (fib (s (s n))) (plus (fib (s n)) (fib n)))))
(declare-fun in_range (nat nat nat) Bool)
(assert (forall ((x nat) (y nat) (z nat)) (= (in_range x y z) (and (leq nat y x) (leq nat x z)))))
(declare-fun div2 (nat) nat)
(assert (= (div2 zero) zero))
(assert (= (div2 (s zero)) zero))
(assert (forall ((n nat)) (= (div2 (s (s n))) (s (div2 n)))))
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
(declare-fun rev (par (a) ((list a)) (list a)))
(assert (par (a) (= (rev a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (rev a (Cons a x xs)) (append a (rev a xs) (Cons a x (Nil a)))))))
(declare-fun itrev (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (itrev a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (itrev a (Cons a x xs) ys) (itrev a xs (Cons a x ys))))))
(declare-fun nth (par (a) ((list a) nat) a))
(assert (par (a) (forall ((x a) (xs (list a)) (n nat)) (= (nth a (Cons a x xs) n) (match n
  ((zero x)
   ((s k) (nth a xs k))))))))
(declare-fun upd (par (a) ((list a) nat a) (list a)))
(assert (par (a) (forall ((n nat) (x a)) (= (upd a (Nil a) n x) (Nil a)))))
(assert (par (a) (forall ((x a) (xs (list a)) (n nat) (y a)) (= (upd a (Cons a x xs) n y) (match n
  ((zero (Cons a y xs))
   ((s j) (Cons a x (upd a xs j y)))))))))
; extensionality
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (= xs ys) (and (= (len a xs) (len a ys))
  (forall ((i nat)) (=> (less nat i (len a xs)) (= (nth a xs i) (nth a ys i)))))))))
(declare-fun butlast (par (a) ((list a)) (list a)))
(assert (par (a) (= (butlast a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (butlast a (Cons a x xs))
  (ite (= xs (Nil a)) (Nil a) (Cons a x (butlast a xs)))))))
(declare-fun hd (par (a) ((list a)) a))
(assert (par (a) (forall ((x a) (xs (list a))) (= (hd a (Cons a x xs)) x))))
(declare-fun tl (par (a) ((list a)) (list a)))
(assert (par (a) (= (tl a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (tl a (Cons a x xs)) xs))))
(declare-fun replicate (par (a) (nat a) (list a)))
(assert (par (a) (forall ((x a)) (= (replicate a zero x) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a)) (= (replicate a (s n) x) (Cons a x (replicate a n x))))))
(declare-fun T_append (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (T_append a (Nil a) ys) (s zero)))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (T_append a (Cons a x xs) ys) (s (T_append a xs ys))))))
(declare-fun T_rev (par (a) ((list a)) nat))
(assert (par (a) (= (T_rev a (Nil a)) (s zero))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (T_rev a (Cons a x xs)) (s (plus (T_rev a xs) (T_append a (rev a xs) (Cons a x (Nil a)))))))))
(declare-fun T_itrev (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (T_itrev a (Nil a) ys) (s zero)))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (T_itrev a (Cons a x xs) ys) (s (T_itrev a xs (Cons a x ys)))))))
(declare-fun sorted (par (a) ((list a)) Bool))
(assert (par (a) (sorted a (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (sorted a (Cons a x xs)) (and (forall ((y a)) (=> (in_set a y xs) (leq a x y))) (sorted a xs))))))
(declare-fun insort (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (insort a x (Nil a)) (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (insort a x (Cons a y ys)) (ite (leq a x y) (Cons a x (Cons a y ys)) (Cons a y (insort a x ys)))))))
(declare-fun isort (par (a) ((list a)) (list a)))
(assert (par (a) (= (isort a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (isort a (Cons a x xs)) (insort a x (isort a xs))))))
(declare-fun T_insort (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (T_insort a x (Nil a)) (s zero)))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (T_insort a x (Cons a y ys)) (s (ite (leq a x y) zero (T_insort a x ys)))))))
(declare-fun T_isort (par (a) ((list a)) nat))
(assert (par (a) (= (T_isort a (Nil a)) (s zero))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (T_isort a (Cons a x xs)) (s (plus (T_isort a xs) (T_insort a x (isort a xs))))))))
(declare-fun quicksort (par (a) ((list a)) (list a)))
(assert (par (a) (= (quicksort a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (quicksort a (Cons a x xs))
  (append a (quicksort a (filter_less a x xs)) (append a (Cons a x (Nil a)) (quicksort a (filter_ge a x xs))))))))
(declare-fun quicksort2 (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (quicksort2 a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (quicksort2 a (Cons a x xs) ys)
  (quicksort2 a (filter_less a x xs) (Cons a x (quicksort2 a (filter_ge a x xs) ys)))))))
;(declare-fun partition3 (nat (list nat)) tuple((list nat),(list nat),(list nat)))
;(declare-fun quicksort3 ((list nat)) (list nat))
(declare-fun T_quicksort (par (a) ((list a)) nat))
(assert (par (a) (= (T_quicksort a (Nil a)) (s zero))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (T_quicksort a (Cons a x xs))
  (s (plus (T_quicksort a (filter_less a x xs)) (plus (T_quicksort a (filter_ge a x xs)) (mult (s (s zero)) (len a xs)))))))))
(declare-fun merge (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (merge a (Nil a) ys) ys))))
(assert (par (a) (forall ((xs (list a))) (= (merge a xs (Nil a)) xs))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (merge a (Cons a x xs) (Cons a y ys))
  (ite (leq a x y) (Cons a x (merge a xs (Cons a y ys))) (Cons a y (merge a (Cons a x xs) ys)))))))
(declare-fun take (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (take a zero xs) (Nil a)))))
(assert (par (a) (forall ((n nat)) (= (take a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (take a (s n) (Cons a x xs)) (Cons a x (take a n xs))))))
(declare-fun drop (par (a) (nat (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (drop a zero xs) xs))))
(assert (par (a) (forall ((n nat)) (= (drop a n (Nil a)) (Nil a)))))
(assert (par (a) (forall ((n nat) (x a) (xs (list a))) (= (drop a (s n) (Cons a x xs)) (drop a n xs)))))
(declare-fun msort (par (a) ((list a)) (list a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((xs (list a))) (= (msort a xs) (let ((n (len a xs))) (ite (leq nat n (s zero)) xs
;  (merge a (msort a (take a (div2 n) xs)) (msort a (drop a (div2 n) xs)))))))))
(declare-fun C_merge (par (a) ((list a) (list a)) nat))
(assert (par (a) (forall ((ys (list a))) (= (C_merge a (Nil a) ys) zero))))
(assert (par (a) (forall ((xs (list a))) (= (C_merge a xs (Nil a)) zero))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (C_merge a (Cons a x xs) (Cons a y ys))
  (s (ite (leq a x y) (C_merge a xs (Cons a y ys)) (C_merge a (Cons a x xs) ys)))))))
(declare-fun C_msort (par (a) ((list a)) nat))
; TODO this cannot be parsed yet, probably due to the let expression
;(assert (par (a) (forall ((xs (list a))) (= (C_msort a xs) (let ((n (len a xs))) (let ((ys (take a (div n 2) xs)) (zs (drop a (div n 2) xs)))
;  (ite (leq nat n 1) 0 (+ (C_msort a ys) (C_msort a zs) (C_merge a (msort a ys) (msort a zs))))))))))
(declare-fun msort2 (par (a) ((list a)) (list a)))
(declare-fun merge_adj (par (a) ((lists a)) (lists a)))
(assert (par (a) (= (merge_adj a (Nil (list a))) (Nil (list a)))))
(assert (par (a) (forall ((xs (list a))) (= (merge_adj a (Cons (list a) xs (Nil (list a)))) (Cons (list a) xs (Nil (list a)))))))
(assert (par (a) (forall ((xs (list a)) (ys (list a)) (zss (lists a))) (= (merge_adj a (Cons (list a) xs (Cons (list a) ys zss)))
  (Cons (list a) (merge a xs ys) (merge_adj a zss))))))
(declare-fun merge_all (par (a) ((lists a)) (list a)))
(assert (par (a) (= (merge_all a (Nil (list a))) (Nil a))))
(assert (par (a) (forall ((xs (list a))) (= (merge_all a (Cons (list a) xs (Nil (list a)))) xs))))
; TODO not well-defined
;(assert (par (a) (forall ((xss (lists a))) (= (merge_all a xss) (merge_all a (merge_adj a xss))))))
(declare-fun msort_bu (par (a) ((list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (msort_bu a xs) (merge_all a (map_list_lists a xs))))))
(declare-fun C_merge_adj (par (a) ((lists a)) nat))
(assert (par (a) (= (C_merge_adj a (Nil (list a))) zero)))
(assert (par (a) (forall ((xs (list a))) (= (C_merge_adj a (Cons (list a) xs (Nil (list a)))) zero))))
(assert (par (a) (forall ((xs (list a)) (ys (list a)) (zss (lists a))) (= (C_merge_adj a (Cons (list a) xs (Cons (list a) ys zss)))
  (plus (C_merge a xs ys) (C_merge_adj a zss))))))
(declare-fun C_merge_all (par (a) ((lists a)) nat))
(assert (par (a) (= (C_merge_all a (Nil (list a))) zero)))
(assert (par (a) (forall ((xs (list a))) (= (C_merge_all a (Cons (list a) xs (Nil (list a)))) zero))))
; TODO not well-defined
;(assert (par (a) (forall ((xss (lists a))) (= (C_merge_all a xss) (+ (C_merge_adj a xss) (C_merge_all a (merge_adj a xss)))))))
(declare-fun C_msort_bu (par (a) ((list a)) nat))
(assert (par (a) (forall ((xs (list a))) (= (C_msort_bu a xs) (C_merge_all a (map_list_lists a xs))))))
(declare-fun even (nat) Bool)
(assert (even zero))
(assert (forall ((x nat)) (= (even (s x)) (not (even x)))))
;(assert (forall ((n nat)) (= (even n) (= (div n 2) 0))))
(declare-fun odd (nat) Bool)
(assert (not (odd zero)))
(assert (forall ((x nat)) (= (odd (s x)) (not (odd x)))))
;(assert (forall ((n nat)) (= (odd n) (= (div n 2) 1))))
(declare-fun runs (par (a) ((list a)) (lists a)))
(assert (par (a) (= (runs a (Nil a)) (Nil (list a)))))
(assert (par (a) (forall ((x a)) (= (runs a (Cons a x (Nil a))) (Cons (list a) (Cons a x (Nil a)) (Nil (list a)))))))
;(assert (forall ((a nat) (b nat) (xs (list nat))) (= (runs (Cons nat a (Cons nat b xs)))
;  (ite (< b a) (desc b (Cons nat a (Nil nat)) xs) (asc b ((# a) xs))))))
;(declare-fun asc (nat (=> (list nat) (list nat)) (list nat)) (lists nat))
;(assert (forall ((a nat) (xs (list nat))) (= (asc a xs (Nil nat)) (Cons (list nat) xs (Cons (list nat) (Cons nat a (Nil nat)) (Nil (list nat)))))))
;(assert (forall ((a nat) (xs (list nat)) (b nat) (ys (list nat))) (= (asc a xs (Cons nat b ys))
;  (ite (not (< b a)) (asc b (xs . (#) a) ys) (Cons (list nat) (xs (Cons nat a (Nil nat))) (runs (Cons nat b ys)))))))
(declare-fun desc (par (a) (a (list a) (list a)) (lists a)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (desc a x xs (Nil a)) (Cons (list a) (Cons a x xs) (Nil (list a)))))))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (desc a x xs (Cons a y ys))
  (ite (less a y x) (desc a y (Cons a x xs) ys) (Cons (list a) (Cons a x xs) (runs a (Cons a y ys))))))))
(declare-fun nmsort (par (a) ((list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (nmsort a xs) (merge_all a (runs a xs))))))
;(declare-fun Ball (nat (=> nat Bool)) Bool)
(declare-fun C_runs (par (a) ((list a)) nat))
(declare-fun C_asc (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (C_asc a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (C_asc a x (Cons a y ys))
  (s (ite (not (less a y x)) (C_asc a y ys) (C_runs a (Cons a y ys))))))))
(declare-fun C_desc (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (C_desc a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (C_desc a x (Cons a y ys))
  (s (ite (less a y x) (C_desc a y ys) (C_runs a (Cons a y ys))))))))
(assert (par (a) (= (C_runs a (Nil a)) zero)))
(assert (par (a) (forall ((x a)) (= (C_runs a (Cons a x (Nil a))) zero))))
(assert (par (a) (forall ((x a) (y a) (xs (list a))) (= (C_runs a (Cons a x (Cons a y xs)))
  (s (ite (less a y x) (C_desc a y xs) (C_asc a y xs)))))))
(declare-fun C_nmsort (par (a) ((list a)) nat))
(assert (par (a) (forall ((xs (list a))) (= (C_nmsort a xs) (plus (C_runs a xs) (C_merge_all a (runs a xs)))))))
(declare-fun concat (par (a) ((lists a)) (list a)))
(assert (par (a) (= (concat a (Nil (list a))) (Nil a))))
(assert (par (a) (forall ((xs (list a)) (xss (lists a))) (= (concat a (Cons (list a) xs xss)) (append a xs (concat a xss))))))
(declare-fun lg (nat) Real)
(declare-fun ceil (Real) nat)
(declare-fun floor (Real) nat)
;(declare-fun filter ((=> nat nat) (list nat)) (list nat))
;(declare-fun sort_key ((=> nat nat) (list nat)) (list nat))
;(declare-fun insort_key ((=> nat nat) nat (list nat)) (list nat))
;(declare-fun isort_key ((=> nat nat) (list nat)) (list nat))
; already declared
;(declare-fun select (nat (list nat)) nat)
;(declare-fun minus (nat nat) nat)
;(declare-fun select0 ((list nat)) nat)
;(declare-fun select1 ((list nat)) nat)
; already declared
;(declare-fun distinct ((list nat)) Bool)
(declare-fun median (par (a) ((list a)) a))
(declare-fun chop (nat (list nat)) (lists nat))
(declare-fun min (nat nat) nat)
(declare-fun max (nat nat) nat)

(declare-fun inorder (par (a) ((tree a)) (list a)))
(assert (par (a) (= (inorder a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (inorder a (Node a l x r)) (append a (inorder a l) (append a (Cons a x (Nil a)) (inorder a r)))))))
(declare-fun inorder2 (par (a) ((tree a) (list a)) (list a)))
(assert (par (a) (forall ((xs (list a))) (= (inorder2 a (Leaf a) xs) xs))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (xs (list a))) (= (inorder2 a (Node a l x r) xs) (inorder2 a l (Cons a x (inorder2 a r xs)))))))
(declare-fun preorder (par (a) ((tree a)) (list a)))
(assert (par (a) (= (preorder a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (preorder a (Node a l x r)) (Cons a x (append a (preorder a l) (preorder a r)))))))
(declare-fun size (par (a) ((tree a)) nat))
(assert (par (a) (= (size a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size a (Node a l x r)) (s (plus (size a l) (size a r)))))))
(declare-fun size1 (par (a) ((tree a)) nat))
(assert (par (a) (= (size1 a (Leaf a)) (s zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size1 a (Node a l x r)) (plus (size1 a l) (size1 a r))))))
(declare-fun h (par (a) ((tree a)) nat))
(assert (par (a) (= (h a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (h a (Node a l x r)) (s (max (h a l) (h a r)))))))
(declare-fun mh (par (a) ((tree a)) nat))
(assert (par (a) (= (mh a (Leaf a)) zero)))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (mh a (Node a l x r)) (s (min (mh a l) (mh a r)))))))
(declare-fun complete (par (a) ((tree a)) Bool))
(assert (par (a) (complete a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (complete a (Node a l x r)) (and (= (h a l) (h a r)) (complete a l) (complete a r))))))
(declare-fun acomplete (par (a) ((tree a)) Bool))
; TODO minus is missing
;(assert (par (a) (forall ((t (tree a))) (= (acomplete a t) (leq nat (- (h a t) (mh a t)) 1)))))
(declare-fun balance (par (a) (nat (list a)) (pair (tree a) (list a))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((n nat) (xs (list a))) (= (balance a n xs) (ite (= n 0) (Pair (tree a) (list a) (Leaf a) xs)
;  (let ((m (div n 2))) (let ((lys (balance a m xs))) (let ((rzs (balance a (- n (+ 1 m)) (Cons_1 a (Pair_1 (tree a) (list a) lys)))))
;    (Pair (tree a) (list a) (Node a (Pair_0 (tree a) (list a) lys) (Cons_0 a (Pair_1 (tree a) (list a) lys)) (Pair_0 (tree a) (list a) rzs)) (Pair_1 (tree a) (list a) ;rzs))))))))))
(declare-fun bal_list (par (a) (nat (list a)) (tree a)))
(assert (par (a) (forall ((n nat) (xs (list a))) (= (bal_list a n xs) (Pair_0 (tree a) (list a) (balance a n xs))))))
(declare-fun balance_list (par (a) ((list a)) (tree a)))
(assert (par (a) (forall ((xs (list a))) (= (balance_list a xs) (bal_list a (len a xs) xs)))))
(declare-fun bal_tree (par (a) (nat (tree a)) (tree a)))
(assert (par (a) (forall ((n nat) (t (tree a))) (= (bal_tree a n t) (bal_list a n (inorder a t))))))
(declare-fun balance_tree (par (a) ((tree a)) (tree a)))
(assert (par (a) (forall ((t (tree a))) (= (balance_tree a t) (bal_tree a (size a t) t)))))
(declare-fun bst (par (a) ((tree a)) Bool))
(assert (par (a) (bst a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (bst a (Node a l x r))
  (and (forall ((y a)) (=> (in_set_tree a y l) (less a y x))) (forall ((y a)) (=> (in_set_tree a y r) (less a x y))) (bst a l) (bst a r))))))
(declare-fun cmp (par (a) (a a) cmp_val))
(assert (par (a) (forall ((x a) (y a)) (= (cmp a x y) (ite (less a x y) LT (ite (= x y) EQ GT))))))
(declare-fun empty (par (a) () (tree a)))
(assert (par (a) (= (empty a) (Leaf a))))
(declare-fun isin (par (a) ((tree a) a) Bool))
(assert (par (a) (forall ((x a)) (not (isin a (Leaf a) x)))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (isin a (Node a l y r) x)
  (match (cmp a x y) ((LT (isin a l x)) (EQ true) (GT (isin a r x))))))))
(declare-fun insert (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (insert a x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (insert a x (Node a l y r))
  (match (cmp a x y) ((LT (Node a (insert a x l) y r))
                      (EQ (Node a l y r))
                      (GT (Node a l y (insert a x r)))))))))
(declare-fun split_min (par (a) ((tree a)) (pair a (tree a))))
; TODO this cannot be parsed yet
;(assert (par (a b c) (forall ((l (tree c)) (x c) (r (tree c))) (= (split_min c (Node c l x r))
;  (ite (= l (Leaf c)) (Pair c (tree c) x r) (let ((xl (split_min c l))) (Pair c (tree c) (Pair_0 c (tree c) xl) (Node c (Pair_1 c (tree c) xl) x r))))))))
(declare-fun delete (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (delete a x (Leaf a)) (Leaf a)))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (delete a x (Node a l y r))
;  (match (cmp a x y) ((LT (Node a (delete a x l) y r))
;                      (EQ (ite (= r (Leaf a)) l (let ((ar (split_min a r))) (Node a l (Pair_0 a (tree a) ar) (Pair_1 a (tree a) ar)))))
;                      (GT (Node a l y (delete a x r)))))))))
;(check-sat)

(declare-fun join (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((t (tree a))) (= (join a t (Leaf a)) t))))
(assert (par (a) (forall ((t (tree a))) (= (join a (Leaf a) t) t))))
(assert (par (a) (forall ((t1 (tree a)) (x a) (t2 (tree a)) (t3 (tree a)) (y a) (t4 (tree a))) (= (join a (Node a t1 x t2) (Node a t3 y t4))
  (match (join a t2 t3) (((Leaf a) (Node a t1 x (Node a (Leaf a) y t4))) ((Node a u2 z u3) (Node a (Node a t1 x u2) z (Node a u3 y t4)))))))))
(declare-fun delete2 (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (delete2 a x (Leaf a)) (Leaf a)))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (delete2 a x (Node a l y r))
  (match (cmp a x y) ((LT (Node a (delete2 a x l) y r))
                      (EQ (join a l r))
                      (GT (Node a l y (delete2 a x r)))))))))

(declare-fun join0 (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((t (tree a))) (= (join0 a t (Leaf a)) t))))
(assert (par (a) (forall ((t (tree a))) (= (join0 a (Leaf a) t) t))))
(assert (par (a) (forall ((t1 (tree a)) (x a) (t2 (tree a)) (t3 (tree a)) (y a) (t4 (tree a)))
  (= (join0 a (Node a t1 x t2) (Node a t3 y t4)) (Node a t1 x (Node a (join0 a t2 t3) y t4))))))

(declare-fun ins_list (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (ins_list a x (Nil a)) (Cons a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (xs (list a))) (= (ins_list a x (Cons a y xs))
  (ite (less a x y) (Cons a x (Cons a y xs)) (ite (= x y) (Cons a y xs) (Cons a y (ins_list a x xs))))))))
(declare-fun del_list (par (a) (a (list a)) (list a)))
(assert (par (a) (forall ((x a)) (= (del_list a x (Nil a)) (Nil a)))))
(assert (par (a) (forall ((x a) (y a) (xs (list a))) (= (del_list a x (Cons a y xs))
  (ite (= x y) xs (Cons a y (del_list a x xs)))))))

; interval trees
;(declare-fun iisin (itree nat) Bool)
;(assert (forall ((x nat)) (not (iisin ILeaf x))))
;(assert (forall ((l itree) (a nat) (b nat) (r itree) (x nat)) (= (iisin (INode l a b r) x)
;  (match (cmp x a) ((LT (iisin l x)) (EQ true) (GT (iisin r x)))))))

; 2-3 trees
(declare-fun size23 (par (a) ((tree23 a)) nat))
(assert (par (a) (= (size23 a (Leaf23 a)) zero)))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (size23 a (Node2 a l x r))
  (s (plus (size23 a l) (size23 a r)))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a)))
  (= (size23 a (Node3 a l x m y r)) (s (plus (size23 a l) (plus (size23 a m) (size23 a r))))))))
(declare-fun h23 (par (a) ((tree23 a)) nat))
(assert (par (a) (= (h23 a (Leaf23 a)) zero)))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (h23 a (Node2 a l x r))
  (s (max (h23 a l) (h23 a r)))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a)))
  (= (h23 a (Node3 a l x m y r)) (s (max (h23 a l) (max (h23 a m) (h23 a r))))))))
(declare-fun hD (par (a) ((upD a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (hD a (TD a t)) (h23 a t)))))
(assert (par (a) (forall ((t (tree23 a))) (= (hD a (UF a t)) (s (h23 a t))))))
(declare-fun complete23 (par (a) ((tree23 a)) Bool))
(assert (par (a) (complete23 a (Leaf23 a))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (complete23 a (Node2 a l x r))
  (and (= (h23 a l) (h23 a r)) (complete23 a l) (complete23 a r))))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a))) (= (complete23 a (Node3 a l x m y r))
  (and (= (h23 a l) (h23 a m)) (= (h23 a m) (h23 a r)) (complete23 a l) (complete23 a m) (complete23 a r))))))
(declare-fun isin23 (par (a) ((tree23 a) a) Bool))
(assert (par (a) (forall ((x a)) (not (isin23 a (Leaf23 a) x)))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (r (tree23 a))) (= (isin23 a (Node2 a l y r) x)
  (match (cmp a x y) ((LT (isin23 a l x)) (EQ true) (GT (isin23 a r x))))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (m (tree23 a)) (z a) (r (tree23 a))) (= (isin23 a (Node3 a l y m z r) x)
  (match (cmp a x y) ((LT (isin23 a l x)) (EQ true) (GT
  (match (cmp a x z) ((LT (isin23 a m x)) (EQ true) (GT (isin23 a r x)))))))))))

(declare-fun inorder23 (par (a) ((tree23 a)) (list a)))
(assert (par (a) (= (inorder23 a (Leaf23 a)) (Nil a))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (inorder23 a (Node2 a t1 x t2))
  (append a (inorder23 a t1) (append a (Cons a x (Nil a)) (inorder23 a t2)))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (inorder23 a (Node3 a t1 x t2 y t3))
  (append a (inorder23 a t1) (append a (Cons a x (Nil a)) (append a (inorder23 a t2) (append a (Cons a y (Nil a)) (inorder23 a t3)))))))))
(declare-fun treeI (par (a) ((upI a)) (tree23 a)))
(assert (par (a) (forall ((t (tree23 a))) (= (treeI a (TI a t)) t))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (treeI a (OF a l x r)) (Node2 a l x r)))))
(declare-fun treeD (par (a) ((upD a)) (tree23 a)))
(assert (par (a) (forall ((t (tree23 a))) (= (treeD a (TD a t)) t))))
(assert (par (a) (forall ((t (tree23 a))) (= (treeD a (UF a t)) t))))
(declare-fun ins (par (a) (a (tree23 a)) (upI a)))
(assert (par (a) (forall ((x a)) (= (ins a x (Leaf23 a)) (OF a (Leaf23 a) x (Leaf23 a))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (r (tree23 a))) (= (ins a x (Node2 a l y r))
  (match (cmp a x y) ((LT (match (ins a x l) (((TI a ll) (TI a (Node2 a ll y r)))
                                              ((OF a l1 z l2) (TI a (Node3 a l1 z l2 y r))))))
                      (EQ (TI a (Node2 a l y r)))
                      (GT (match (ins a x r) (((TI a rr) (TI a (Node2 a l y rr)))
                                              ((OF a r1 z r2) (TI a (Node3 a l y r1 z r2))))))))))))
(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (m (tree23 a)) (z a) (r (tree23 a))) (= (ins a x (Node3 a l y m z r))
  (match (cmp a x y) ((LT (match (ins a x l) (((TI a ll) (TI a (Node3 a ll y m z r)))
                                              ((OF a l1 u l2) (OF a (Node2 a l1 u l2) y (Node2 a m z r))))))
                      (EQ (TI a (Node3 a l y m z r)))
                      (GT (match (cmp a x z) ((LT (match (ins a x m) (((TI a mm) (TI a (Node3 a l y mm z r)))
                                                                      ((OF a m1 u m2) (OF a (Node2 a l y m1) u (Node2 a m2 z r))))))
                                              (EQ (TI a (Node3 a l y m z r)))
                                              (GT (match (ins a x r) (((TI a rr) (TI a (Node3 a l y m z rr)))
                                                                      ((OF a r1 u r2) (OF a (Node2 a l y m) z (Node2 a r1 u r2)))))))))))))))
(declare-fun insert23 (par (a) (a (tree23 a)) (tree23 a)))
(assert (par (a) (forall ((x a) (t (tree23 a))) (= (insert23 a x t) (treeI a (ins a x t))))))
(declare-fun hI (par (a) ((upI a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (hI a (TI a t)) (h23 a t)))))
(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (hI a (OF a l x r)) (h23 a l)))))
(declare-fun node21 (par (a) ((upD a) a (tree23 a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (node21 a (TD a t1) x t2) (TD a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node21 a (UF a t1) x (Node2 a t2 y t3))
  (UF a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node21 a (UF a t1) x (Node3 a t2 y t3 z t4)) (TD a (Node2 a (Node2 a t1 x t2) y (Node2 a t3 z t4)))))))
(declare-fun node22 (par (a) ((tree23 a) a (upD a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (node22 a t1 x (TD a t2)) (TD a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node22 a (Node2 a t1 x t2) y (UF a t3))
  (UF a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node22 a (Node3 a t1 x t2 y t3) z (UF a t4)) (TD a (Node2 a (Node2 a t1 x t2) y (Node2 a t3 z t4)))))))
(declare-fun node31 (par (a) ((upD a) a (tree23 a) a (tree23 a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node31 a (TD a t1) x t2 y t3)
  (TD a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node31 a (UF a t1) x (Node2 a t2 y t3) z t4) (TD a (Node2 a (Node3 a t1 x t2 y t3) z t4))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)) (u a) (t5 (tree23 a)))
  (= (node31 a (UF a t1) x (Node3 a t2 y t3 z t4) u t5) (TD a (Node3 a (Node2 a t1 x t2) y (Node2 a t3 z t4) u t5))))))
(declare-fun node32 (par (a) ((tree23 a) a (upD a) a (tree23 a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node32 a t1 x (TD a t2) y t3)
  (TD a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node32 a t1 x (UF a t2) y (Node2 a t3 z t4)) (TD a (Node2 a t1 x (Node3 a t2 y t3 z t4)))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)) (u a) (t5 (tree23 a)))
  (= (node32 a t1 x (UF a t2) y (Node3 a t3 z t4 u t5)) (TD a (Node3 a t1 x (Node2 a t2 y t3) z (Node2 a t4 u t5)))))))
(declare-fun node33 (par (a) ((tree23 a) a (tree23 a) a (upD a)) (upD a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (node33 a t1 x t2 y (TD a t3))
  (TD a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)))
  (= (node33 a t1 x (Node2 a t2 y t3) z (UF a t4)) (TD a (Node2 a t1 x (Node3 a t2 y t3 z t4)))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (t4 (tree23 a)) (u a) (t5 (tree23 a)))
  (= (node33 a t1 x (Node3 a t2 y t3 z t4) u (UF a t5)) (TD a (Node3 a t1 x (Node2 a t2 y t3) z (Node2 a t4 u t5)))))))
(declare-fun split_min23 (par (a) ((tree23 a)) (pair a (upD a))))
; TODO not well-defined
;(assert (par (a) (forall ((x a)) (= (split_min23 a (Node2 a (Leaf23 a) x (Leaf23 a))) (Pair a (upD a) x (UF a (Leaf23 a)))))))
;(assert (par (a) (forall ((x a) (y a)) (= (split_min23 a (Node3 a (Leaf23 a) x (Leaf23 a) y (Leaf23 a)))
;  (Pair a (upD a) x (TD a (Node2 a (Leaf23 a) y (Leaf23 a))))))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree23 a)) (x a) (r (tree23 a))) (= (split_min23 a (Node2 a l x r))
;  (let ((xl (split_min23 a l))) (Pair a (upD a) (Pair_0 a (upD a) xl) (node21 (Pair_1 a (upD a) xl) x r)))))))
;(assert (par (a) (forall ((l (tree23 a)) (x a) (m (tree23 a)) (y a) (r (tree23 a))) (= (split_min23 a (Node3 a l x m y r))
;  (let ((xl (split_min23 a l))) (Pair a (upD a) (Pair_0 a (upD a) xl) (node31 (Pair_1 a (upD a) xl) x m y r)))))))
(declare-fun del (par (a) (a (tree23 a)) (upD a)))
; TODO not well-defined
;(assert (par (a) (forall ((x a)) (= (del a x (Leaf23 a)) (TD a (Leaf23 a))))))
;(assert (par (a) (forall ((x a) (y a)) (= (del a x (Node2 a (Leaf23 a) y (Leaf23 a))) (ite (= x y) (UF a (Leaf23 a)) (TD a (Node2 a (Leaf23 a) y (Leaf23 a))))))))
;(assert (par (a) (forall ((x a) (y a) (z a)) (= (del a x (Node3 a (Leaf23 a) y (Leaf23 a) z (Leaf23 a)))
;  (TD a (ite (= x y) (Node2 a (Leaf23 a) z (Leaf23 a)) (ite (= x z) (Node2 a (Leaf23 a) y (Leaf23 a)) (Node3 a (Leaf23 a) y (Leaf23 a) z (Leaf23 a)))))))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (r (tree23 a))) (= (del a x (Node2 a l y r))
;  (match (cmp a x y) ((LT (node21 a (del a x l) y r))
;                      (EQ (let ((ar (split_min23 a r))) (node22 a l (Pair_0 a (upD a) ar) (Pair_1 a (upD a) ar))))
;                      (GT (node22 a l y (del a x r)))))))))
;(assert (par (a) (forall ((x a) (l (tree23 a)) (y a) (m (tree23 a)) (z a) (r (tree23 a))) (= (del a x (Node3 a l y m z r))
;  (match (cmp a x y) ((LT (node31 a (del a x l) y m z r))
;                      (EQ (let ((am (split_min23 m))) (node32 a l (Pair_0 a (upD a) am) (Pair_1 a (upD a) am) z r)))
;                      (GT (match (cmp a x z) ((LT (node32 a l y (del a x m) z r))
;                                              (EQ (let ((br (split_min23 r))) (node33 a l y m (Pair_0 a (upD a) br) (Pair_1 a (upD a) br))))
;                                              (GT (node33 a l y m z (del a x r))))))))))))
(declare-fun delete23 (par (a) (a (tree23 a)) (tree23 a)))
(assert (par (a) (forall ((x a) (t (tree23 a))) (= (delete23 a x t) (treeD a (del a x t))))))

(declare-fun len23s (par (a) ((tree23s a)) nat))
(assert (par (a) (forall ((t (tree23 a))) (= (len23s a (T a t)) (s zero)))))
(assert (par (a) (forall ((t (tree23 a)) (x a) (ts (tree23s a))) (= (len23s a (TTs a t x ts)) (s (len23s a ts))))))
;(declare-fun trees ((tree23s a)) set)
(declare-fun in_trees (par (a) ((tree23 a) (tree23s a)) Bool))
(assert (par (a) (forall ((s (tree23 a)) (t (tree23 a))) (= (in_trees a s (T a t)) (= s t)))))
(assert (par (a) (forall ((s (tree23 a)) (t (tree23 a)) (x a) (ts (tree23s a))) (= (in_trees a s (TTs a t x ts)) (or (= s t) (in_trees a s ts))))))
(declare-fun inorder23s (par (a) ((tree23s a)) (list a)))
(assert (par (a) (forall ((t (tree23 a))) (= (inorder23s a (T a t)) (inorder23 a t)))))
(assert (par (a) (forall ((t (tree23 a)) (x a) (ts (tree23s a))) (= (inorder23s a (TTs a t x ts)) (append a (inorder23 a t) (Cons a x (inorder23s a ts)))))))
(declare-fun join_adj (par (a) ((tree23s a)) (tree23s a)))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a))) (= (join_adj a (TTs a t1 x (T a t2))) (T a (Node2 a t1 x t2))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a))) (= (join_adj a (TTs a t1 x (TTs a t2 y (T a t3))))
  (T a (Node3 a t1 x t2 y t3))))))
(assert (par (a) (forall ((t1 (tree23 a)) (x a) (t2 (tree23 a)) (y a) (t3 (tree23 a)) (z a) (ts (tree23s a))) (= (join_adj a (TTs a t1 x (TTs a t2 y (TTs a t3 z ts))))
  (TTs a (Node2 a t1 x t2) y (join_adj a (TTs a t3 z ts)))))))
(declare-fun join_all (par (a) ((tree23s a)) (tree23 a)))
(assert (par (a) (forall ((t (tree23 a))) (= (join_all a (T a t)) t))))
(assert (par (a) (forall ((ts (tree23s a))) (= (join_all a ts) (join_all a (join_adj a ts))))))
(declare-fun not_T (par (a) ((tree23s a)) Bool))
(assert (par (a) (forall ((ts (tree23s a))) (= (not_T a ts) (forall ((t (tree23 a))) (distinct ts (T a t)))))))
(declare-fun leaves (par (a) ((list a)) (tree23s a)))
(assert (par (a) (= (leaves a (Nil a)) (T a (Leaf23 a)))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (leaves a (Cons a x xs)) (TTs a (Leaf23 a) x (leaves a xs))))))
(declare-fun tree23_of_list (par (a) ((list a)) (tree23 a)))
(assert (par (a) (forall ((xs (list a))) (= (tree23_of_list a xs) (join_all a (leaves a xs))))))

; red-black trees
(declare-fun R (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (R a l x r) (Node (pair a color) l (Pair a color x Red) r)))))
(declare-fun B (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (B a l x r) (Node (pair a color) l (Pair a color x Black) r)))))
(declare-fun color_of (par (a) ((rbt a)) color))
(assert (par (a) (= (color_of a (Leaf (pair a color))) Black)))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (color_of a (Node (pair a color) l (Pair a color x c) r)) c))))
(declare-fun paint (par (a) (color (rbt a)) (rbt a)))
(assert (par (a) (forall ((c color)) (= (paint a c (Leaf (pair a color))) (Leaf (pair a color))))))
(assert (par (a) (forall ((c color) (l (rbt a)) (x a) (d color) (r (rbt a))) (= (paint a c (Node (pair a color) l (Pair a color x d) r)) (Node (pair a color) l (Pair a color x c) r)))))
(declare-fun invc (par (a) ((rbt a)) Bool))
(assert (par (a) (invc a (Leaf (pair a color)))))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (invc a (Node (pair a color) l (Pair a color x c) r))
  (and (=> (= c Red) (and (= (color_of a l) Black) (= (color_of a r) Black))) (invc a l) (invc a r))))))
(declare-fun bh (par (a) ((rbt a)) nat))
(assert (par (a) (= (bh a (Leaf (pair a color))) zero)))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (bh a (Node (pair a color) l (Pair a color x c) r))
  (ite (= c Black) (s (bh a l)) (bh a l))))))
(declare-fun invh (par (a) ((rbt a)) Bool))
(assert (par (a) (invh a (Leaf (pair a color)))))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (invh a (Node (pair a color) l (Pair a color x c) r))
  (and (= (bh a l) (bh a r)) (invh a l) (invh a r))))))
(declare-fun inv_rbt (par (a) ((rbt a)) Bool))
(assert (par (a) (forall ((t (rbt a))) (= (inv_rbt a t) (and (invc a t) (invh a t) (= (color_of a t) Black))))))
(declare-fun baliL (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
  (= (baliL a l z t4) (ite (or (= l (R a (R a t1 x t2) y t3)) (= l (R a t1 x (R a t2 y t3))))
    (R a (B a t1 x t2) y (B a t3 z t4)) (B a l z t4))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
;  (= (baliL a (R a (R a t1 x t2) y t3) z t4) (R a (B a t1 x t2) y (B a t3 z t4))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
;  (= (baliL a (R a t1 x (R a t2 y t3)) z t4) (R a (B a t1 x t2) y (B a t3 z t4))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a))) (= (baliL a t1 x t2) (B a t1 x t2)))))
(declare-fun baliR (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)) (r (rbt a)))
  (= (baliR a t1 x r) (ite (or (= r (R a t2 y (R a t3 z t4))) (= r (R a (R a t2 y t3) z t4)))
    (R a (B a t1 x t2) y (B a t3 z t4)) (B a t1 x r))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
;  (= (baliR a t1 x (R a t2 y (R a t3 z t4))) (R a (B a t1 x t2) y (B a t3 z t4))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
;  (= (baliR a t1 x (R a (R a t2 y t3) z t4)) (R a (B a t1 x t2) y (B a t3 z t4))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a))) (= (baliR a t1 x t2) (B a t1 x t2)))))
(declare-fun insRB (par (a) (a (rbt a)) (rbt a)))
(assert (par (a) (forall ((x a)) (= (insRB a x (Leaf (pair a color))) (R a (Leaf (pair a color)) x (Leaf (pair a color)))))))
(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (r (rbt a))) (= (insRB a x (B a l y r))
  (match (cmp a x y) ((LT (baliL a (insRB a x l) y r))
                      (EQ (B a l y r))
                      (GT (baliR a l y (insRB a x r)))))))))
(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (r (rbt a))) (= (insRB a x (R a l y r))
  (match (cmp a x y) ((LT (R a (insRB a x l) y r))
                      (EQ (R a l y r))
                      (GT (R a l y (insRB a x r)))))))))
(declare-fun insertRB (par (a) (a (rbt a)) (rbt a)))
(assert (par (a) (forall ((x a) (t (rbt a))) (= (insertRB a x t) (paint a Black (insRB a x t))))))
(declare-fun invc2 (par (a) ((rbt a)) Bool))
(assert (par (a) (forall ((t (rbt a))) (= (invc2 a t) (invc a (paint a Black t))))))

(declare-fun baldL (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a)) (l1 (rbt a)) (l2 (rbt a)) (r1 (rbt a)) (r2 (rbt a)) (r3 (rbt a)) (r4 (rbt a)) (r5 (rbt a)) (xl a) (xr1 a) (xr2 a) (xr3 a))
  (= (baldL a l x r) (ite (= l (R a l1 xl l2)) (R a (B a l1 xl l2) x r)
    (ite (= r (B a r1 xr1 r2)) (baliR a l x (R a r1 xr1 r2)) (ite (= r (R a (B a r3 xr2 r4) xr3 r5))
      (R a (B a l x r3) xr2 (baliR a r4 xr3 (paint a Red r5))) (R a l x r))))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)))
;  (= (baldL a (R a t1 x t2) y t3) (R a (B a t1 x t2) y t3)))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)))
;  (= (baldL a t1 x (B a t2 y t3)) (baliR a t1 x (R a t2 y t3))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
;  (= (baldL a t1 x (R a (B a t2 y t3) z t4)) (R a (B a t1 x t2) y (baliR a t3 z (paint a Red t4)))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a))) (= (baldL a t1 x t2) (R a t1 x t2)))))
(declare-fun baldR (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a)) (r1 (rbt a)) (r2 (rbt a)) (l1 (rbt a)) (l2 (rbt a)) (l3 (rbt a)) (l4 (rbt a)) (l5 (rbt a)) (xr a) (xl1 a) (xl2 a) (xl3 a))
  (= (baldR a l x r) (ite (= r (R a r1 xr r2)) (R a l x (B a r1 xr r2))
    (ite (= l (B a l1 xl1 l2)) (baliL a (R a l1 xl1 l2) x r) (ite (= l (R a l3 xl2 (B a l4 xl3 l5)))
      (R a (baliL a (paint a Red l3) xl2 l4) xl3 (B a l5 x r)) (R a l x r))))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)))
;  (= (baldR a t1 x (R a t2 y t3)) (R a t1 x (B a t2 y t3))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)))
;  (= (baldR a (B a t1 x t2) y t3) (baliL a (R a t1 x t2) y t3)))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (y a) (t3 (rbt a)) (z a) (t4 (rbt a)))
;  (= (baldR a (R a t1 x (B a t2 y t3)) z t4) (R a (baliL a (paint a Red t1) x t2) y (B a t3 z t4))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a))) (= (baldR a t1 x t2) (R a t1 x t2)))))
(declare-fun split_minRB (par (a) ((rbt a)) (pair a (rbt a))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (split_minRB a (Node (pair a color) l (Pair a color x c) r))
;  (ite (= l (Leaf (pair a color))) (Pair a (rbt a) x r) (let ((xl (split_minRB a l)))
;    (Pair a (rbt a) (Pair_0 a (rbt a) xl) (ite (= (color_of a l) Black) (baldL a (Pair_1 a (rbt a) xl) x r) (R a (Pair_1 a (rbt a) xl) x r)))))))))
(declare-fun delRB (par (a) (a (rbt a)) (rbt a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (c color) (r (rbt a))) (= (delRB a x (Node (pair a color) l (Pair a color y c) r))
;  (match (cmp a x y) ((LT (let ((ll (delRB a x l))) (ite (and (distinct l (Leaf (pair a color))) (= (color_of a l) Black)) (baldL a ll y r) (R a ll y r))))
;                      (EQ (ite (= r (Leaf (pair a color))) l (let ((ar (split_minRB a r))) (ite (= (color_of a r) Black)
;                        (baldR a l (Pair_0 a (rbt a) ar) (Pair_1 a (rbt a) ar)) (R a l (Pair_0 a (rbt a) ar) (Pair_1 a (rbt a) ar))))))
;                      (GT (let ((rr (delRB a x r))) (ite (and (distinct r (Leaf (pair a color))) (= (color_of a r) Black)) (baldR a l y rr) (R a l y rr))))))))))
(declare-fun deleteRB (par (a) (a (rbt a)) (rbt a)))
(assert (par (a) (forall ((x a) (t (rbt a))) (= (deleteRB a x t) (paint a Black (delRB a x t))))))
;(declare-fun bhs ((rbt a)) set)
(declare-fun joinRB (par (a) ((rbt a) (rbt a)) (rbt a)))
; TODO not well-defined
;(assert (par (a) (forall ((t (rbt a))) (= (joinRB a t (Leaf (pair a color))) t))))
;(assert (par (a) (forall ((t (rbt a))) (= (joinRB a (Leaf (pair a color)) t) t))))
;(assert (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (t3 (rbt a)) (c a) (t4 (rbt a))) (= (joinRB (R t1 a t2) (R t3 c t4))
;  (match (joinRB t2 t3) (((R u2 b u3) (R (R t1 a u2) b (R u3 c t4)))
;                         (t23 (R t1 a (R t23 c t4))))))))
;(assert (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (t3 (rbt a)) (c a) (t4 (rbt a))) (= (joinRB (B t1 a t2) (B t3 c t4))
;  (match (joinRB t2 t3) (((R u2 b u3) (R (B t1 a u2) b (B u3 c t4)))
;                         (t23 (baldL t1 a (R t23 c t4))))))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (t3 (rbt a))) (= (joinRB a t1 (R a t2 x t3)) (R a (joinRB a t1 t2) x t3)))))
;(assert (par (a) (forall ((t1 (rbt a)) (x a) (t2 (rbt a)) (t3 (rbt a))) (= (joinRB a (R a t1 x t2) t3) (R a t1 x (joinRB a t2 t3))))))
(declare-fun delRB2 (par (a) (a (rbt a)) (rbt a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (c color) (r (rbt a))) (= (delRB2 a x (Node (pair a color) l (Pair a color y c) r))
;  (match (cmp a x y) ((LT (let ((ll (delRB2 a x l))) (ite (and (distinct l (Leaf (pair a color))) (= (color_of a l) Black)) (baldL a ll y r) (R a ll y r))))
;                      (EQ (joinRB a l r))
;                      (GT (let ((rr (delRB2 a x r))) (ite (and (distinct r (Leaf (pair a color))) (= (color_of a r) Black)) (baldR a l y rr) (R a l y rr))))))))))
;(declare-fun rbt_of_list (par (a) ((list a)) (rbt a)))

; AVL trees
(declare-fun ht (par (a) ((tree_ht a)) nat))
(assert (par (a) (= (ht a (Leaf (pair a nat))) zero)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (ht a (Node (pair a nat) l (Pair a nat x n) r)) n))))
(declare-fun node (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (r (tree_ht a))) (= (node a l x r) (Node (pair a nat) l (Pair a nat x (s (max (ht a l) (ht a r)))) r)))))
(declare-fun avl (par (a) ((tree_ht a)) Bool))
(assert (par (a) (avl a (Leaf (pair a nat)))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (avl a (Node (pair a nat) l (Pair a nat x n) r))
;  (let ((hl (h (pair a nat) l)) (hr (h (pair a nat) r))) (and (or (= hl hr) (= (s hl) hr) (= hl (s hr))) (= n (s (max hl hr))) (avl a l) (avl a r)))))))
(declare-fun balL (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((XY (tree_ht a)) (z a) (Z (tree_ht a))) (= (balL a XY z Z) (ite (= (ht a XY) (s (s (ht a Z))))
;  (match XY (((Node (pair a nat) X x Y) (ite (leq nat (ht a Y) (ht a X)) (node a X (Pair_0 a nat x) (node a Y z Z))
;                (match Y (((Node (pair a nat) Y1 y Y2) (node a (node a X (Pair_0 a nat x) Y1) (Pair_0 a nat y) (node a Y2 z Z)))
;                          (_ (node a XY z Z))))))
;             (_ (node a XY z Z)))) (node a XY z Z))))))
(declare-fun balR (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((X (tree_ht a)) (x a) (YZ (tree_ht a))) (= (balR a X x YZ) (ite (= (ht a YZ) (s (s (ht a X))))
;  (match YZ (((Node (pair a nat) Y y Z) (ite (leq nat (ht a Y) (ht a Z)) (node a (node a X x Y) (Pair_0 a nat y) Z)
;                (match Y (((Node (pair a nat) Y1 z Y2) (node a (node a X x Y1) (Pair_0 a nat z) (node a Y2 (Pair_0 a nat y) Z)))
;                          (_ (node a X x YZ))))))
;             (_ (node a X x YZ)))) (node a X x YZ))))))
(declare-fun insertAVL (par (a) (a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((x a)) (= (insertAVL a x (Leaf (pair a nat))) (Node (pair a nat) (Leaf (pair a nat)) (Pair a nat x (s zero)) (Leaf (pair a nat)))))))
(assert (par (a) (forall ((x a) (l (tree_ht a)) (y a) (n nat) (r (tree_ht a))) (= (insertAVL a x (Node (pair a nat) l (Pair a nat y n) r))
  (match (cmp a x y) ((LT (balL a (insertAVL a x l) y r))
                      (EQ (Node (pair a nat) l (Pair a nat y n) r))
                      (GT (balR a l y (insertAVL a x r)))))))))
(declare-fun split_max (par (a) ((tree_ht a)) (pair (tree_ht a) a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (split_max a (Node (pair a nat) l (Pair a nat x n) r))
;  (ite (= r (Leaf (pair a nat))) (Pair (tree_ht a) a l x) (let ((rx (split_max a r))) (Pair (tree_ht a) a (balL a l x (Pair_0 (tree_ht a) a rx)) (Pair_1 (tree_ht a) a rx))))))))
(declare-fun deleteAVL (par (a) (a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((x a)) (= (deleteAVL a x (Leaf (pair a nat))) (Leaf (pair a nat))))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (tree_ht a)) (y a) (n nat) (r (tree_ht a))) (= (deleteAVL a x (Node (pair a nat) l (Pair a nat y n) r))
;  (match (cmp a x y) ((LT (balR a (deleteAVL a x l) y r))
;                      (EQ (ite (= l (Leaf (pair a nat))) r (let ((ly (split_max a l))) (balR a (Pair_0 (tree_ht a) a ly) (Pair_1 (tree_ht a) a ly) r))))
;                      (GT (balL a l y (deleteAVL a x r)))))))))
(declare-fun fibt (nat) (tree unit))
(assert (= (fibt zero) (Leaf unit)))
(assert (= (fibt (s zero)) (Node unit (Leaf unit) Unit (Leaf unit))))
(assert (forall ((n nat)) (= (fibt (s (s n))) (Node unit (fibt (s n)) Unit (fibt n)))))
(declare-fun avl0 (par (a) ((tree a)) Bool))
(assert (par (a) (avl0 a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (avl0 a (Node a l x r)) (and (avl0 a l) (avl0 a r)
  (or (= (s (h a l)) (h a r)) (= (h a l) (h a r)) (= (h a l) (s (h a r)))))))))
(declare-fun avl_bal (par (a) ((tree_bal a)) Bool))
(assert (par (a) (avl_bal a (Leaf (pair a bal)))))
(assert (par (a) (forall ((l (tree_bal a)) (x a) (b bal) (r (tree_bal a))) (= (avl_bal a (Node (pair a bal) l (Pair a bal x b) r))
  (and (match b ((Lh (= (h (pair a bal) l) (s (h (pair a bal) r))))
                 (Bal (= (h (pair a bal) l) (h (pair a bal) r)))
                 (Rh (= (s (h (pair a bal) l)) (h (pair a bal) r)))))
    (avl_bal a l) (avl_bal a r))))))
(declare-fun is_bal (par (a) ((tree_bal a)) Bool))
(assert (par (a) (forall ((l (tree_bal a)) (x a) (b bal) (r (tree_bal a))) (= (is_bal a (Node (pair a bal) l (Pair a bal x b) r)) (= b Bal)))))
(declare-fun incr (par (a b) ((tree_bal a) (tree_bal b)) Bool))
(assert (par (a b) (forall ((t (tree_bal a)) (t' (tree_bal b))) (= (incr a b t t')
  (or (= t (Leaf (pair a bal))) (and (is_bal a t) (not (is_bal b t'))))))))
(declare-fun decr (par (a b) ((tree_bal a) (tree_bal b)) Bool))
(assert (par (a b) (forall ((t (tree_bal a)) (t' (tree_bal b))) (= (decr a b t t') (and (distinct t (Leaf (pair a bal)))
  (or (= t' (Leaf (pair b bal))) (and (not (is_bal a t)) (is_bal b t'))))))))
(declare-fun rot2 (par (a) ((tree_bal a) a (tree_bal a) a (tree_bal a)) (tree_bal a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((A (tree_bal a)) (x a) (B1 (tree_bal a)) (y a) (b bal) (B2 (tree_bal a)) (z a) (C (tree_bal a)))
;  (= (rot2 A x (Node (pair a bal) B1 (Pair a bal y b) B2) z C) (let ((b1 (ite (= b Rh) Lh Bal)) (b2 (ite (= b Lh) Rh Bal)))
;    (Node (pair a bal) (Node (pair a bal) A (Pair a bal x b1) B1) (Pair a bal y Bal) (Node (pair a bal) B2 (Pair a bal z b2) C)))))))
(declare-fun balL_bal (par (a) ((tree_bal a) a bal (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((X (tree_bal a)) (x a) (b bal) (Y (tree_bal a)) (y a) (Z (tree_bal a)))
  (= (balL_bal a (Node (pair a bal) X (Pair a bal x b) Y) y Lh Z) (match b
    ((Lh (Node (pair a bal) X (Pair a bal x Bal) (Node (pair a bal) Y (Pair a bal y Bal) Z)))
     (Bal (Node (pair a bal) X (Pair a bal x Rh) (Node (pair a bal) Y (Pair a bal y Lh) Z)))
     (Rh (rot2 a X x Y y Z))))))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Bal C) (Node (pair a bal) AB (Pair a bal c Lh) C)))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Rh C) (Node (pair a bal) AB (Pair a bal c Bal) C)))))
(declare-fun balR_bal (par (a) ((tree_bal a) a bal (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((X (tree_bal a)) (x a) (b bal) (Y (tree_bal a)) (y a) (Z (tree_bal a)))
  (= (balR_bal a X x Rh (Node (pair a bal) Y (Pair a bal y b) Z)) (match b
    ((Lh (rot2 a X x Y y Z))
     (Bal (Node (pair a bal) (Node (pair a bal) X (Pair a bal x Rh) Y) (Pair a bal y Lh) Z))
     (Rh (Node (pair a bal) (Node (pair a bal) X (Pair a bal x Bal) Y) (Pair a bal y Bal) Z))))))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Bal C) (Node (pair a bal) AB (Pair a bal c Lh) C)))))
(assert (par (a) (forall ((AB (tree_bal a)) (c a) (C (tree_bal a))) (= (balL_bal a AB c Rh C) (Node (pair a bal) AB (Pair a bal c Bal) C)))))
(declare-fun insert_bal (par (a) (a (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((x a)) (= (insert_bal a x (Leaf (pair a bal))) (Node (pair a bal) (Leaf (pair a bal)) (Pair a bal x Bal) (Leaf (pair a bal)))))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (tree_bal a)) (y a) (b bal) (r (tree_bal a))) (= (insert_bal a x (Node (pair a bal) l (Pair a bal y b) r))
;  (match (cmp a x y) ((LT (let ((l' (insert_bal a x l))) (ite (incr a a l l') (balL_bal a l' y b r) (Node (pair a bal) l' (Pair a bal y b) r))))
;                      (EQ (Node (pair a bal) l (Pair a bal y b) r))
;                      (GT (let ((r' (insert_bal a x r))) (ite (incr a a r r') (balR_bal a l y b r') (Node (pair a bal) l (Pair a bal y b) r'))))))))))
(declare-fun split_max_bal (par (a) ((tree_bal a)) (pair (tree_bal a) a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree_bal a)) (x a) (b bal) (r (tree_bal a))) (= (split_max_bal a (Node (pair a bal) l (Pair a bal x b) r))
;  (ite (= r (Leaf (pair a bal))) (Pair (tree_bal a) a l x) (let ((rx (split_max_bal a r)))
;    (let ((t (ite (decr a a r (Pair_0 (tree_bal a) a rx)) (balL_bal a l x b (Pair_0 (tree_bal a) a rx))
;      (Node (pair a bal) l (Pair a bal x b) (Pair_0 (tree_bal a) a rx))))) (Pair (tree_bal a) a t (Pair_1 a bal rx)))))))))
(declare-fun delete_bal (par (a) (a (tree_bal a)) (tree_bal a)))
(assert (par (a) (forall ((x a)) (= (delete_bal a x (Leaf (pair a bal))) (Leaf (pair a bal))))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (tree_bal a)) (y a) (b bal) (r (tree_bal a))) (= (delete_bal a x (Node (pair a bal) l (Pair a bal y b) r))
;  (match (cmp a x y) ((LT (let ((l' (delete_bal a x l))) (ite (decr a a l l') (balR_bal a l' y b r) (Node (pair a bal) l' (Pair a bal y b) r))))
;                      (EQ (ite (= l (Leaf (pair a bal))) r (let ((ly (split_max_bal a l))) (ite (decr a a l (Pair_0 (tree_bal a) a ly))
;                        (balR_bal a (Pair_0 (tree_bal a) a ly) (Pair_1 (tree_bal a) a ly) b r)
;                        (Node (pair a bal) (Pair_0 (tree_bal a) a ly) (Pair a bal (Pair_1 (tree_bal a) a ly) b) r)))))
;                      (GT (let ((r' (delete_bal a x r))) (ite (decr a a r r') (balL_bal a l y b r') (Node (pair a bal) l (Pair a bal y b) r'))))))))))
(declare-fun debal (par (a) ((tree_bal a)) (tree_ht a)))
(assert (par (a) (= (debal a (Leaf (pair a bal))) (Leaf (pair a nat)))))
(assert (par (a) (forall ((l (tree_bal a)) (x a) (b bal) (r (tree_bal a))) (= (debal a (Node (pair a bal) l (Pair a bal x b) r))
  (Node (pair a nat) (debal a l) (Pair a nat x (s (max (h (pair a bal) l) (h (pair a bal) r)))) (debal a r))))))
; TODO define this
(declare-fun debal2 (par (a) ((tree_bal a)) (tree_ht a)))

; these are supposed to be uninterpreted and defined by their specification below
(declare-fun joinp (par (a b) ((ptree a b) a (ptree a b)) (ptree a b)))
(declare-fun invp (par (a b) ((ptree a b)) Bool))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (r (ptree a b)) (y a)) (= (in_set_ptree a b y (joinp a b l x r))
  (or (in_set_ptree a b y l) (= x y) (in_set_ptree a b y r))))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b)))
  (=> (bst (pair a b) (NodeP a b l x y r)) (bst (pair a b) (joinp a b l x r))))))
(assert (par (a b) (invp a b (LeafP a b))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (r (ptree a b)))
  (=> (and (invp a b l) (invp a b r)) (invp a b (joinp a b l x r))))))
(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b)))
  (=> (invp a b (NodeP a b l x y r)) (and (invp a b l) (invp a b r))))))

(declare-fun split_minp (par (a b) ((ptree a b)) (pair a (ptree a b))))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((l (ptree a b)) (x a) (y b) (r (ptree a b))) (= (split_minp a b (NodeP a b l x y r))
;  (ite (= l (LeafP a b)) (Pair a (ptree a b) x r) (let ((xl (split_minp a b l))) (Pair a (ptree a b) (Pair_0 a (ptree a b) xl) (joinp a b (Pair_1 a (ptree a b) xl) x r))))))))
(declare-fun join2 (par (a b) ((ptree a b) (ptree a b)) (ptree a b)))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((l (ptree a b)) (r (ptree a b))) (= (join2 a b l r) (ite (= r (LeafP a b))
;  l (let ((mr (split_minp a b r))) (joinp a b l (Pair_0 a (ptree a b) mr) (Pair_1 a (ptree a b) mr))))))))
(declare-fun splitp (par (a b) ((ptree a b) a) (triple (ptree a b) Bool (ptree a b))))
(assert (par (a b) (forall ((x a)) (= (splitp a b (LeafP a b) x) (Triple (ptree a b) Bool (ptree a b) (LeafP a b) false (LeafP a b))))))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((l (ptree a b)) (y a) (z b) (r (ptree a b)) (x a)) (= (splitp a b (NodeP a b l y z r) x)
;  (match (cmp a x y) ((LT (let ((t (splitp a b l x))) (Triple (ptree a b) Bool (ptree a b) (Triple_0 (ptree a b) Bool (ptree a b) t) (Triple_1 (ptree a b) Bool (ptree a b) t) (joinp a b (Triple_2 (ptree a b) Bool (ptree a b) t) y r))))
;                      (EQ (Triple (ptree a b) Bool (ptree a b) l true r))
;                      (GT (let ((t (splitp a b r x))) (Triple (ptree a b) Bool (ptree a b) (joinp a b l y (Triple_0 (ptree a b) Bool (ptree a b) t)) (Triple_1 (ptree a b) Bool (ptree a b) t) (Triple_2 (ptree a b) Bool (ptree a b) t))))))))))
(declare-fun union (par (a b) ((ptree a b) (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((t (ptree a b))) (= (union a b (LeafP a b) t) t))))
(assert (par (a b) (forall ((t (ptree a b))) (= (union a b t (LeafP a b)) t))))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((l1 (ptree a b)) (x a) (y b) (r1 (ptree a b)) (t (ptree a b))) (= (union a b (NodeP a b l1 x y r1) t)
;  (let ((t' (splitp a b t x))) (joinp a b (union a b l1 (Triple_0 (ptree a b) Bool (ptree a b) t')) x (union a b r1 (Triple_2 (ptree a b) Bool (ptree a b) t'))))))))
(declare-fun inter (par (a b) ((ptree a b) (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((t (ptree a b))) (= (inter a b (LeafP a b) t) (LeafP a b)))))
(assert (par (a b) (forall ((t (ptree a b))) (= (inter a b t (LeafP a b)) (LeafP a b)))))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((l1 (ptree a b)) (x a) (y b) (r1 (ptree a b)) (t (ptree a b))) (= (inter a b (NodeP a b l1 x y r1) t)
;  (let ((t' (splitp a b t x))) (let ((l' (inter a b l1 (Triple_0 (ptree a b) Bool (ptree a b) t')))
;    (r' (inter a b r1 (Triple_2 (ptree a b) Bool (ptree a b) t'))))
;      (ite (Triple_1 (ptree a b) Bool (ptree a b) t') (joinp a b l' x r') (join2 a b l' r'))))))))
(declare-fun diff (par (a b) ((ptree a b) (ptree a b)) (ptree a b)))
(assert (par (a b) (forall ((t (ptree a b))) (= (diff a b (LeafP a b) t) (LeafP a b)))))
(assert (par (a b) (forall ((t (ptree a b))) (= (diff a b t (LeafP a b)) t))))
; TODO this cannot be parsed yet
;(assert (par (a b) (forall ((l2 (ptree a b)) (x a) (y b) (r2 (ptree a b)) (t (ptree a b))) (= (diff a b t (NodeP a b l2 x y r2))
;  (let ((t' (splitp a b t x))) (join2 a b (diff a b (Triple_0 (ptree a b) Bool (ptree a b) t') l2) (diff a b (Triple_2 (ptree a b) Bool (ptree a b) t') r2)))))))
(declare-fun joinL (par (a) ((rbt a) a (rbt a)) (rbt a)))
; TODO define this
;(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (joinL a l x r) (ite (leq a (bh a r) (bh a l)) (R a l x r)
;  (match r (())))))))
(declare-fun diff1 (par (a b) ((ptree a b) (ptree a b)) (ptree a b)))
; TODO define this

; Braun trees
(declare-fun braun (par (a) ((tree a)) Bool))
(assert (par (a) (braun a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (braun a (Node a l x r))
  (and (or (= (size a l) (size a r)) (= (size a l) (s (size a r)))) (braun a l) (braun a r))))))
(declare-fun splice (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (splice a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (splice a (Cons a x xs) ys)
  (Cons a x (splice a ys xs))))))
(declare-fun list_of (par (a) ((tree a)) (list a)))
(assert (par (a) (= (list_of a (Leaf a)) (Nil a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (list_of a (Node a l x r))
  (Cons a x (splice a (list_of a l) (list_of a r)))))))
(declare-fun lookup1 (par (a) ((tree a) nat) a))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (n nat)) (= (lookup1 a (Node a l x r) n)
;  (ite (= n (s zero)) x (lookup1 a (ite (even n) l r) (div2 n)))))))
(declare-fun update1 (par (a) (nat a (tree a)) (tree a)))
(assert (par (a) (forall ((n nat) (x a)) (= (update1 a n x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((n nat) (x a) (l (tree a)) (y a) (r (tree a))) (= (update1 a n x (Node a l y r))
  (ite (= n (s zero)) (Node a l x r) (ite (even n) (Node a (update1 a (div2 n) x l) y r)
    (Node a l y (update1 a (div2 n) x r))))))))
(declare-fun adds (par (a) ((list a) nat (tree a)) (tree a)))
(assert (par (a) (forall ((n nat) (t (tree a))) (= (adds a (Nil a) n t) t))))
(assert (par (a) (forall ((x a) (xs (list a)) (n nat) (t (tree a))) (= (adds a (Cons a x xs) n t)
  (adds a xs (s n) (update1 a (s n) x t))))))
(declare-fun del_hi (par (a) (nat (tree a)) (tree a)))
(assert (par (a) (forall ((n nat)) (= (del_hi a n (Leaf a)) (Leaf a)))))
(assert (par (a) (forall ((n nat) (l (tree a)) (x a) (r (tree a))) (= (del_hi a n (Node a l x r))
  (ite (= n (s zero)) (Leaf a) (ite (even n) (Node a (del_hi a (div2 n) l) x r) (Node a l x (del_hi a (div2 n) r))))))))
(declare-fun add_lo (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (add_lo a x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (add_lo a x (Node a l y r))
  (Node a (add_lo a y r) x l)))))
(declare-fun merge_braun (par (a) ((tree a) (tree a)) (tree a)))
(assert (par (a) (forall ((r (tree a))) (= (merge_braun a (Leaf a) r) r))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (rr (tree a))) (= (merge_braun a (Node a l x r) rr)
  (Node a rr x (merge_braun a l r))))))
(declare-fun del_lo (par (a) ((tree a)) (tree a)))
(assert (par (a) (= (del_lo a (Leaf a)) (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_lo a (Node a l x r)) (merge_braun a l r)))))
(declare-fun diff_braun (par (a) ((tree a) nat) nat))
(assert (par (a) (forall ((n nat)) (= (diff_braun a (Leaf a) n) zero))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (n nat)) (= (diff_braun a (Node a l x r) n)
  (ite (= n zero) (s zero) (ite (even n) (diff_braun a r (s_0 (div2 n))) (diff_braun a l (div2 n))))))))
(declare-fun size_fast (par (a) ((tree a)) nat))
(assert (par (a) (= (size_fast a (Leaf a)) zero)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (size_fast a (Node a l x r))
;  (let ((n (size_fast a r))) (s (plus (mult (s (s zero)) n) (diff_braun a l n))))))))
(declare-fun braun2_of (par (a) (a nat) (pair (tree a) (tree a))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (n nat)) (= (braun2_of a x n)
;  (ite (= n zero) (Pair (tree a) (tree a) (Leaf a) (Node a (Leaf a) x (Leaf a)))
;    (let ((st (braun2_of a x (div2 (s_0 n))))) (ite (odd n)
;      (Pair (tree a) (tree a) (Node a (Pair_0 (tree a) (tree a) st) x (Pair_0 (tree a) (tree a) st))
;                              (Node a (Pair_1 (tree a) (tree a) st) x (Pair_0 (tree a) (tree a) st)))
;      (Pair (tree a) (tree a) (Node a (Pair_1 (tree a) (tree a) st) x (Pair_0 (tree a) (tree a) st))
;                              (Node a (Pair_1 (tree a) (tree a) st) x (Pair_1 (tree a) (tree a) st))))))))))
(declare-fun braun_of (par (a) (a nat) (tree a)))
(assert (par (a) (forall ((x a) (n nat)) (= (braun_of a x n) (Pair_0 (tree a) (tree a) (braun2_of a x n))))))
(declare-fun take_nths (par (a) (nat nat (list a)) (list a)))
(assert (par (a) (forall ((i nat) (k nat)) (= (take_nths a i k (Nil a)) (Nil a)))))
(assert (par (a) (forall ((i nat) (k nat) (x a) (xs (list a))) (= (take_nths a i k (Cons a x xs))
  (ite (= i zero) (Cons a x (take_nths a (s_0 (pow (s (s zero)) k)) k xs)) (take_nths a (s_0 i) k xs))))))
(declare-fun braun_list (par (a) ((tree a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a))) (= (braun_list a (Leaf a) xs) (= xs (Nil a))))))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (xs (list a))) (= (braun_list a (Node a l x r) xs)
  (and (distinct xs (Nil a)) (= x (hd a xs)) (braun_list a l (take_nths a (s zero) (s zero) xs))
    (braun_list a r (take_nths a (s (s zero)) (s zero) xs)))))))

; Priority queues
(declare-fun heap (par (a) ((tree a)) Bool))
(assert (par (a) (heap a (Leaf a))))
(assert (par (a) (forall ((l (tree a)) (m a) (r (tree a))) (= (heap a (Node a l m r))
  (and (forall ((x a)) (=> (and (in_set_tree a x l) (in_set_tree a x r)) (leq a m x))) (heap a l) (heap a r))))))
(declare-fun heapp (par (a b) ((ptree a b)) Bool))
(assert (par (a b) (heapp a b (LeafP a b))))
(assert (par (a b) (forall ((l (ptree a b)) (m a) (n b) (r (ptree a b))) (= (heapp a b (NodeP a b l m n r))
  (and (forall ((x a)) (=> (and (in_set_ptree a b x l) (in_set_ptree a b x r)) (leq a m x))) (heapp a b l) (heapp a b r))))))
(declare-fun get_min (par (a) ((tree a)) a))
(assert (par (a) (forall ((l (tree a)) (m a) (r (tree a))) (= (get_min a (Node a l m r)) m))))
(declare-fun get_minp (par (a b) ((ptree a b)) a))
(assert (par (a b) (forall ((l (ptree a b)) (m a) (n b) (r (ptree a b))) (= (get_minp a b (NodeP a b l m n r)) m))))
(declare-fun mht (par (a) ((lheap a)) nat))
(assert (par (a) (= (mht a (LeafP a nat)) zero)))
(assert (par (a) (forall ((l (lheap a)) (m a) (n nat) (r (lheap a))) (= (mht a (NodeP a nat l m n r)) n))))
(declare-fun ltree (par (a) ((lheap a)) Bool))
(assert (par (a) (ltree a (LeafP a nat))))
; TODO in the text mh is used instead of mht here
(assert (par (a) (forall ((l (lheap a)) (m a) (n nat) (r (lheap a))) (= (ltree a (NodeP a nat l m n r))
  (and (leq nat (mht a r) (mht a l)) (= n (s (mht a r))) (ltree a l) (ltree a r))))))
(declare-fun node_lheap (par (a) ((lheap a) a (lheap a)) (lheap a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (lheap a)) (x a) (r (lheap a))) (= (node a l x r)
;  (let ((mhl (mht a l)) (mhr (mht a r))) (ite (leq nat mhr mhl) (NodeP a nat l x (s mhr) r) (NodeP a nat r x (s mhl) l)))))))
(declare-fun merge_lheap (par (a) ((lheap a) (lheap a)) (lheap a)))
(assert (par (a) (forall ((t (lheap a))) (= (merge_lheap a (LeafP a nat) t) t))))
(assert (par (a) (forall ((t (lheap a))) (= (merge_lheap a t (LeafP a nat)) t))))
(assert (par (a) (forall ((l1 (lheap a)) (a1 a) (n1 nat) (r1 (lheap a)) (l2 (lheap a)) (a2 a) (n2 nat) (r2 (lheap a)))
  (= (merge_lheap a (NodeP a nat l1 a1 n1 r1) (NodeP a nat l2 a2 n2 r2))
    (ite (leq a a1 a2) (node_lheap a l1 a1 (merge_lheap a r1 (NodeP a nat l2 a2 n2 r2)))
      (node_lheap a l2 a2 (merge_lheap a (NodeP a nat l1 a1 n1 r1) r2)))))))
(declare-fun insert_lheap (par (a) (a (lheap a)) (lheap a)))
(assert (par (a) (forall ((x a) (t (lheap a))) (= (insert_lheap a x t)
  (merge_lheap a (NodeP a nat (LeafP a nat) x (s zero) (LeafP a nat)) t)))))
(declare-fun del_min_lheap (par (a) ((lheap a)) (lheap a)))
(assert (par (a) (= (del_min_lheap a (LeafP a nat)) (LeafP a nat))))
(assert (par (a) (forall ((l (lheap a)) (x a) (n nat) (r (lheap a))) (= (del_min_lheap a (NodeP a nat l x n r))
  (merge_lheap a l r)))))

(declare-fun insert_braun (par (a) (a (tree a)) (tree a)))
(assert (par (a) (forall ((x a)) (= (insert_braun a x (Leaf a)) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (insert_braun a x (Node a l y r))
  (ite (less a x y) (Node a (insert_braun a y r) x l) (Node a (insert_braun a x r) y l))))))
(declare-fun del_left (par (a) ((tree a)) (pair a (tree a))))
(assert (par (a) (forall ((x a) (r (tree a))) (= (del_left a (Node a (Leaf a) x r)) (Pair a (tree a) x r)))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_left a (Node a l x r))
;  (let ((yl (del_left a l))) (Pair a (tree a) (Pair_0 a (tree a) yl) (Node a r x (Pair_1 a (tree a) yl))))))))
(declare-fun sift_down (par (a) ((tree a) a (tree a)) (tree a)))
(assert (par (a) (forall ((x a) (t (tree a))) (= (sift_down a (Leaf a) x t) (Node a (Leaf a) x (Leaf a))))))
(assert (par (a) (forall ((x a) (t (tree a)) (y a)) (= (sift_down a (Node a (Leaf a) x t) y (Leaf a))
  (ite (leq a y x) (Node a (Node a (Leaf a) x (Leaf a)) y (Leaf a)) (Node a (Node a (Leaf a) y (Leaf a)) x (Leaf a)))))))
(assert (par (a) (forall ((l1 (tree a)) (x1 a) (r1 (tree a)) (y a) (l2 (tree a)) (x2 a) (r2 (tree a)))
  (= (sift_down a (Node a l1 x1 r1) y (Node a l2 x2 r2)) (ite (and (leq a y x1) (leq a y x2))
    (Node a (Node a l1 x1 r1) y (Node a l2 x2 r2)) (ite (leq a x1 x2)
      (Node a (sift_down a l1 y r1) x1 (Node a l2 x2 r2)) (Node a (Node a l1 x1 r1) x2 (sift_down a l2 y r2))))))))
(declare-fun del_min_braun (par (a) ((tree a)) (tree a)))
(assert (par (a) (= (del_min_braun a (Leaf a)) (Leaf a))))
(assert (par (a) (forall ((x a) (r (tree a))) (= (del_min_braun a (Node a (Leaf a) x r)) (Leaf a)))))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (= (del_min_braun a (Node a l x r))
;  (let ((yl (del_left a l))) (sift_down a r (Pair_0 a (tree a) yl) (Pair_1 a (tree a) yl)))))))


; lemmas

;
; Section 1

; T_rev(xs) <= (|xs|+1)^2
(assert (par (a) (forall ((xs (list a))) (leq nat (T_rev a xs) (pow (s (len a xs)) (s (s zero)))))))
; T_itrev(xs,ys) = |xs|+1
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (T_itrev a xs ys) (s (len a xs))))))
; itrev(xs,ys) = rev(xs) @ ys
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (itrev a xs ys) (append a (rev a xs) ys)))))

;
; Section 2

; sorted(sort(xs))
;(assert (forall ((xs (list nat))) (sorted (sort xs))))
; mset(sort(xs)) = mset(xs)
;(assert (forall ((xs (list nat))) (same_mset (sort xs) xs)))
; mset(insort(x,xs)) = {{x}} + mset(xs)

; sorted(isort(xs))
(assert (par (a) (forall ((xs (list a))) (sorted a (isort a xs)))))
; mset(isort(xs)) = mset(xs)
(assert (par (a) (forall ((xs (list a))) (same_mset a (isort a xs) xs))))
; set(insort(x,xs)) = {x} U set(xs)

; sorted(insort(a,xs)) = sorted(xs)
(assert (par (a) (forall ((x a) (xs (list a))) (= (sorted a (insort a x xs)) (sorted a xs)))))
; T_isort(xs) <= (|xs|+1)^2
(assert (par (a) (forall ((xs (list a))) (leq nat (T_isort a xs) (pow (s (len a xs)) (s (s zero)))))))
; T_insort(x,xs) <= |xs| + 1
(assert (par (a) (forall ((x a) (xs (list a))) (leq nat (T_insort a x xs) (s (len a xs))))))
; |insort(x,xs)| = |xs| + 1
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (insort a x xs)) (s (len a xs))))))
; |isort(xs)| = |xs|
(assert (par (a) (forall ((xs (list a))) (= (len a (isort a xs)) (len a xs)))))
; ((!xs. mset(f(xs)) = mset(xs)) & (!xs.sorted(f(xs)))) -> f(xs) = isort(xs)

; mset(quicksort(xs)) = mset(xs)
(assert (par (a) (forall ((xs (list a))) (same_mset a (quicksort a xs) xs))))
; mset(filter(P(xs))) = filter_mset(P,mset(xs))

; (!x.P(x)=(~Q(x))) -> filter_mset(P,M) + filter_mset(Q,M) = M

; sorted(quicksort(xs))
(assert (par (a) (forall ((xs (list a))) (sorted a (quicksort a xs)))))
; sorted(xs @ ys) = (sorted xs & sorted ys & (!x in set(xs). !y in set(ys). x <= y))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (sorted a (append a xs ys)) (and (sorted a xs) (sorted a ys)
  (forall ((x a) (y a)) (=> (and (in_set a x xs) (in_set a y ys)) (leq a x y))))))))
; set(quicksort(xs)) = set(xs)
(assert (par (a) (forall ((xs (list a))) (same_set a xs (quicksort a xs)))))
; quicksort2(xs,ys) = quicksort(xs) @ ys
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (quicksort2 a xs ys) (append a (quicksort a xs) ys)))))
; quicksort3(xs) = quicksort(xs)

; sorted(xs) -> T_quicksort(xs) = a * |xs|^2 + b * |xs| + c

; T_quicksort(xs) <= a * |xs|^2 + b * |xs| + c

; mset(merge(xs,ys)) = mset(xs) + mset(ys)

; set(merge(xs,ys)) = set(xs) U set(ys)

; mset(msort(xs)) = mset(xs)
(assert (par (a) (forall ((xs (list a))) (same_set a xs (msort a xs)))))
; sorted(merge(xs,ys)) = (sorted(xs) & sorted(ys))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (sorted a (merge a xs ys)) (and (sorted a xs) (sorted a ys))))))
; sorted(msort(xs))
(assert (par (a) (forall ((xs (list a))) (sorted a (msort a xs)))))
; |merge(xs,ys)| = |xs| + |ys|
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (len a (merge a xs ys)) (plus (len a xs) (len a ys))))))
; |msort(xs)| = |xs|
(assert (par (a) (forall ((xs (list a))) (= (len a (msort a xs)) (len a xs)))))
; C_merge(xs,ys) <= |xs| + |ys|
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (leq nat (C_merge a xs ys) (plus (len a xs) (len a ys))))))
; |xs| = 2^k -> C_msort(xs) <= k * 2^k
(assert (par (a) (forall ((xs (list a)) (k nat)) (=> (= (len a xs) (pow (s (s zero)) k)) (leq nat (C_msort a xs) (mult k (pow (s (s zero)) k)))))))
; mset(msort2(xs)) = mset(xs)

; sorted(msort2(xs))

; |merge_adj(xs)| = (|xs| + 1) div 2
(assert (par (a) (forall ((xs (lists a))) (= (len (list a) (merge_adj a xs)) (div2 (s (len (list a) xs)))))))
; mset_mset (merge_adj(xss)) = mset_mset(xss)

; mset(merge_all(xss)) = mset_mset(xss)

; mset(msort_bu(xs)) = mset(xs)
(assert (par (a) (forall ((xs (list a))) (same_mset a xs (msort_bu a xs)))))
; Ball(set(xss),sorted) -> Ball(set(merge_adj(xss)),sorted)

; Ball(set(xss),sorted) -> sorted(merge_all(xss))

; sorted(msort_bu(xs))
(assert (par (a) (forall ((xs (list a))) (sorted a (msort_bu a xs)))))
; even(|xss|) & (!xs in set(xss).|xs| = m) -> (!xs in set(merge_adj(xss)). |xs| = 2 * m)

; (!xs in set(xss). |xs| = m) -> C_merge_adj(xss) <= m * |xss|

; (!xs in set(xss). |xs| = m) & |xss| = 2^k -> C_merge_all(xss) <= m * k * 2^k

; |xs| = 2^k -> C_msort_bu(xs) <= k * 2^k

; (!xs, ys. f (xs @ ys) = f(xs) @ ys) -> mset_mset(asc x f ys) = {{x}} + mset(f([])) + mset(ys)

; mset_mset(desc(x,xs,ys)) = {{x}} + mset(xs) + mset(ys)

; mset_mset(runs(xs)) = mset(xs)

; mset(nmsort(xs)) = mset(xs)
;(assert (forall ((xs (list a))) (same_mset xs (nmsort xs))))
; Ball(set(runs(xs)),sorted)

; sorted(nmsort(xs))
(assert (par (a) (forall ((xs (list a))) (sorted a (nmsort a xs)))))
; C_merge_adj(xss) <= |concat(xss)|
(assert (par (a) (forall ((xss (lists a))) (leq nat (C_merge_adj a xss) (len a (concat a xss))))))
; |concat(merge_adj(xss))| = |concat(xss)|
(assert (par (a) (forall ((xss (lists a))) (= (len a (concat a (merge_adj a xss))) (len a (concat a xss))))))
; C_merge_all(xss) <= |concat(xss)| * ceil(lg(|xss|))

; 2 <= n -> ceil(lg(n)) = ceil(lg((n-1) div 2 + 1)) + 1

; (!xs,ys. f(xs @ ys) = f(xs) @ ys) -> |concat(asc(a,f(ys)))| = 1 + |f([])| + |ys|

; |concat(desc(a,xs,ys))| = 1 + |xs| + |ys|
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (len a (concat a (desc a x xs ys))) (s (plus (len a xs) (len a ys)))))))
; |concat(runs(xs))| = |xs|
;(assert (forall ((xs (list a))) (= (len (concat (runs xs))) (len xs))))
; (!xs,ys. f(xs @ ys) = f(xs) @ ys) -> |asc(a,f(ys))| <= 1 + |ys|

; |desc(a,xs,ys)| <= 1 + |ys|
;(assert (forall ((a nat) (xs (list nat)) (ys (list nat))) (leq nat (len (desc a xs ys)) (+ 1 (len ys)))))
; |runs(xs)| <= |xs|
;(assert (forall ((xs (list nat))) (leq nat (len (runs xs)) (len xs))))
; C_asc(a,ys) <= |ys|
(assert (par (a) (forall ((x a) (ys (list a))) (leq nat (C_asc a x ys) (len a ys)))))
; C_desc(a,ys) <= |ys|
(assert (par (a) (forall ((x a) (ys (list a))) (leq nat (C_desc a x ys) (len a ys)))))
; TODO I think this is not valid and the -1 is superfluous
; C_runs(xs) <= |xs| - 1
;(assert (par (a) (forall ((xs (list a))) (leq nat (C_runs a xs) (- (len a xs) 1)))))
; |xs| = n -> C_nmsort(xs) <= n + n * ceil(lg(n))

; C_merge_all(runs(xs)) <= n * ceil(lg(n))

; mset(sort_key(f,xs)) = mset(xs)

; sorted(map(f,sort_key(f,xs)))

; filter((lambda y. (f y = k)), sort_key(f,xs)) = filter((lambda y. (f y = k)),xs)

; mset(isort_key(f,xs)) = mset(xs)

; sorted(map(f,isort_key(f,xs)))

; (!x in set(xs). f(a) <= f(x)) -> insort_key(f,a,xs) = a # xs

; ~P(x) -> filter(P,insort_key(f,x,xs)) = filter(P,xs)

; sorted(map(f,xs)) & P(x) -> filter(P, insort_key(f,x,xs)) = insort_key(f,x,filter(P,xs))

; filter((lamdba y. f(y) = k),isort_key(f,xs)) = filter((lambda y. f(y) = k),xs)

;
; Section 3

; Theorem 3.1 and 3.2 are maybe a bit too long

; mset(xs) = mset(ys) -> sort(xs) = sort(ys)
; mset(xs) = mset(ys) -> select(k,xs) = select(k,ys)
; xs != [] -> select0(xs) = select(0,xs)
; |xs| > 1 -> select1(xs) = select(1,xs)
; k < |xs| -> select_fixed(k,xs) = select(k,xs)
; |xs| > 1 -> select1(xs) = select_fixed(1,xs)
; T_select_fixed(k,xs) <= C1 * k * |xs| + C2 * |xs| + C3 *k + C4
; k < |xs| & i < |xs| & distinct(xs) -> (?z. distinct (xs[i:=z]) & select(k,(xs[i:=z])) != select(k,xs))
; distinct(xs) -> (select(i,xs) = select(k,xs) <-> i = k)
; k < |ys| + |zs| & (!y in set(ys).!z in set(zs). y <= z) -> select(k,ys @ zs) = if k < |ys| then select(k,ys) else select(k-|ys|,zs)
; k < |xs| -> select(k,xs) = let (ls,es,gs) = partition3(x,xs)
;   in if k < |ls| then select(k,ls) else if k < |ls| + |es| then x else select(k-|ls|-|es|,gs)
; xs != [] & k < |xs| -> reduce_select_median(k,xs) != [] & median(reduce_select_median(k,xs)) = select(k,xs)
; 
; the functions in section 3.2 are a bit hard to define for now
; 
; k < |xs| -> mom_select(k,xs) = select(k,xs)
; T_mom_select(k,xs) <= T'_mom_select(|xs|)

;
; Section 4

; |t|_1 = |t| + 1
(assert (par (a) (forall ((t (tree a))) (= (size1 a t) (s (size a t))))))
; h(t) <= |t|
(assert (par (a) (forall ((t (tree a))) (leq nat (h a t) (size a t)))))
; mh(t) <= h(t)
(assert (par (a) (forall ((t (tree a))) (leq nat (mh a t) (h a t)))))
; 2^mh(t) <= |t|_1
(assert (par (a) (forall ((t (tree a))) (leq nat (pow (s (s zero)) (mh a t)) (size1 a t)))))
; |t|_1 <= 2^h(t)
(assert (par (a) (forall ((t (tree a))) (leq nat (size1 a t) (pow (s (s zero)) (h a t))))))
; inorder2(t,xs) = inorder(t) @ xs
(assert (par (a) (forall ((t (tree a)) (xs (list a))) (= (inorder2 a t xs) (append a (inorder a t) xs)))))
; complete(t) <-> mh(t) = h(t)
(assert (par (a) (forall ((t (tree a))) (= (complete a t) (= (mh a t) (h a t))))))
; complete(t) -> |t|_1 = 2^h(t)
(assert (par (a) (forall ((t (tree a))) (=> (complete a t) (= (size1 a t) (pow (s (s zero)) (h a t)))))))
; ~complete(t) -> |t|_1 < 2^h(t)
(assert (par (a) (forall ((t (tree a))) (=> (not (complete a t)) (less nat (size1 a t) (pow (s (s zero)) (h a t)))))))
; ~complete(t) -> 2^mh(t) < |t|_1
(assert (par (a) (forall ((t (tree a))) (=> (not (complete a t)) (less nat (pow (s (s zero)) (mh a t)) (size1 a t))))))
; complete(t) <-> |t|_1 = 2^h(t)
(assert (par (a) (forall ((t (tree a))) (= (complete a t) (= (size1 a t) (pow (s (s zero)) (h a t)))))))
; u in subtrees(t) & complete(u) -> h(u) <= h(mcs(t))

; acomplete(s) & |s| <= |t| -> h(s) <= h(t)
(assert (par (a) (forall ((s (tree a)) (t (tree a))) (=> (and (acomplete a s) (leq nat (size a s) (size a t))) (leq nat (h a s) (h a t))))))
; acomplete(t) -> h(t) = ceil(lg(|t|_1))

; acomplete(t) -> mh(t) = floor(lg(|t|_1))

; n <= |xs| & bal(n,xs) = (t, zs) -> xs = inorder(t) @ zs & |t| = n
(assert (par (a) (forall ((n nat) (xs (list a)) (t (tree a)) (zs (list a))) (=> (and (leq nat n (len a xs)) (= (balance a n xs) (Pair (tree a) (list a) t zs)))
  (and (= xs (append a (inorder a t) zs)) (= (size a t) n))))))
; n <= |xs| -> inorder(bal_list(n,xs)) = take(n,xs)
(assert (par (a) (forall ((n nat) (xs (list a))) (=> (leq nat n (len a xs)) (= (inorder a (bal_list a n xs)) (take a n xs))))))
; inorder(balance_list(xs)) = xs
(assert (par (a) (forall ((xs (list a))) (= (inorder a (balance_list a xs)) xs))))
; n <= |t| -> inorder(bal_tree(n,t)) = take(n,inorder(t))
(assert (par (a) (forall ((n nat) (t (tree a))) (=> (leq nat n (size a t)) (= (inorder a (bal_tree a n t)) (take a n (inorder a t)))))))
; inorder(balance_tree(t)) = inorder(t)
(assert (par (a) (forall ((t (tree a))) (= (inorder a (balance_tree a t)) (inorder a t)))))
; n <= |xs| & bal(n,xs) = (t,zs) -> h(t) = ceil(lg(n+1))

; n <= |xs| & bal(n,xs) = (t,zs) -> mh(t) = floor(lg(n+1))

; n <= |xs| & bal(n,xs) = (t,ys) -> acomplete(t)
(assert (par (a) (forall ((n nat) (xs (list a)) (t (tree a)) (ys (list a)))
  (=> (and (leq nat n (len a xs)) (= (balance a n xs) (Pair (tree a) (list a) t ys))) (acomplete a t)))))
; invar_sz(t) = sz(t) = |t|

; invar_f(t) -> b_val(t) = F(t)

; invar_ch(t) -> ch(t) = (complete(t), ?)

; invar_ch(l) & invar_ch(r) -> invar_ch(node_ch(l,a,r))

; invar_mx(t) -> mx(t) = if t = <> then None else Some(Max(set_tree(t)))

; 
; Section 5

; inorder(join(l,r)) = inorder(l) @ inorder(r)
(assert (par (a) (forall ((l (tree a)) (r (tree a))) (= (inorder a (join a l r)) (append a (inorder a l) (inorder a r))))))
; h(join(l,r)) <= max(h(l),h(r)) + 1
(assert (par (a) (forall ((l (tree a)) (r (tree a))) (leq nat (h a (join a l r)) (s (max (h a l) (h a r)))))))
; bst(t) = sorted(inorder(t))
(assert (par (a) (forall ((t (tree a))) (= (bst a t) (sorted a (inorder a t))))))
; set_tree(t) = set(inorder(t))

; sorted(inorder(t)) -> inorder(insert(x,t)) = ins_list(x,inorder(t))
(assert (par (a) (forall ((x a) (t (tree a))) (=> (sorted a (inorder a t)) (= (inorder a (insert a x t)) (ins_list a x (inorder a t)))))))
; sorted(xs @ y # ys) = (sorted(xs @ [y]) & sorted(y # ys))
(assert (par (a) (forall ((xs (list a)) (y a) (ys (list a))) (= (sorted a (append a xs (Cons a y ys)))
  (and (sorted a (append a xs (Cons a y (Nil a)))) (sorted a (Cons a y ys)))))))
; sorted(x # xs @ y # ys) = (sorted(x # xs) & x < y & sorted(xs @ [y]) & sorted(y # ys))
(assert (par (a) (forall ((x a) (xs (list a)) (y a) (ys (list a))) (= (sorted a (append a (Cons a x xs) (Cons a y ys)))
  (and (sorted a (Cons a x xs)) (less a x y) (sorted a (append a xs (Cons a y (Nil a)))) (sorted a (Cons a y ys)))))))
; sorted(x # xs) -> sorted(xs)
(assert (par (a) (forall ((x a) (xs (list a))) (=> (sorted a (Cons a x xs)) (sorted a xs)))))
; sorted(xs @ [y]) -> sorted(xs)
(assert (par (a) (forall ((xs (list a)) (y a)) (=> (sorted a (append a xs (Cons a y (Nil a)))) (sorted a xs)))))
; sorted(xs @ [a]) -> ins_list(x,xs @ a # ys) =
;   if x < a then ins_list(x,xs) @ a # ys else xs @ ins_list(x,a # ys)

; sorted(xs @ [a] # ys) -> del_list(x, xs @ a # ys) =
;   if x < a then del_list(x,xs) @ a # ys else xs @ del_list(x, a # ys)

; sorted(x # xs) = ((!y in set(xs). x < y) & sorted(xs))
(assert (par (a) (forall ((x a) (xs (list a))) (= (sorted a (Cons a x xs)) (and (forall ((y a)) (=> (in_set a y xs) (less a x y))) (sorted a xs))))))
; sorted(xs @ [x]) = (sorted(xs) & (!y in set(xs). y < x))
(assert (par (a) (forall ((xs (list a)) (x a)) (= (sorted a (append a xs (Cons a x (Nil a)))) (and (sorted a xs) (forall ((y a)) (=> (in_set a y xs) (less a y x))))))))
 
; set_tree(empty) = {}

; sorted(inorder(t)) -> set_tree(insert(x,t)) = set_tree(t) U {x}

; sorted(inorder(t)) -> set_tree(delete(x,t)) = set_tree(t) - {x}

; sorted(inorder(t)) -> isin(t,x) = (x in set_tree(t))

; set(ins_list(x,xs)) = set(xs) U {x}

; sorted(xs) -> set(del_list(x,xs)) = set(xs) - {x}

; sorted(inorder(empty))
(assert (par (a) (sorted a (inorder a (empty a)))))
; sorted(inorder(t)) -> sorted(inorder(insert(x,t)))
(assert (par (a) (forall ((x a) (t (tree a))) (=> (sorted a (inorder a t)) (sorted a (inorder a (insert a x t)))))))
; sorted(inorder(t)) -> sorted(inorder(delete(x,t)))
(assert (par (a) (forall ((x a) (t (tree a))) (=> (sorted a (inorder a t)) (sorted a (inorder a (delete a x t)))))))
; sorted(xs) -> sorted(ins_list(x,xs))
(assert (par (a) (forall ((x a) (xs (list a))) (=> (sorted a xs) (sorted a (ins_list a x xs))))))
; sorted(xs) -> sorted(del_list(x,xs))
(assert (par (a) (forall ((x a) (xs (list a))) (=> (sorted a xs) (sorted a (del_list a x xs))))))

; interval trees:

; inv_max_hi(t) & a in set_tree(t) -> high(a) <= max_hi(t)
;(assert (forall ((a a) (t (tree a))) (=> (and (inv_max_hi t) (in_set_tree a t)) (leq nat (high a) (max_hi t)))))
; inv_max_hi(t) & t != <> -> (?a in set_tree(t). high(a) = max_hi(t))

; sorted(inorder(t)) -> inorder(insert(x,t)) = ins_list(x,inorder(t))
; sorted(inorder(t)) -> inorder(delete(x,t)) = del_list(x,inorder(t))
; inv_max_hi(t) -> inv_max_hi(insert(x,t))
; inv_max_hi(t) -> inv_max_hi(delete(x,t))
; inv_max_hi(t) & sorted(inorder(t)) -> set_tree(insert(x,s)) = set_tree(s) U {x}
; inv_max_hi(t) & sorted(inorder(t)) -> set_tree(delete(x,s)) = set_tree(s) - {x}
; inv_max_hi(t) & sorted(inorder(t)) -> inv_max_hi(insert(x,s)) & sorted(inorder(insert(x,s)))
; inv_max_hi(t) & sorted(inorder(t)) -> inv_max_hi(delete(x,s)) & sorted(inorder(delete(x,s)))
; inv_max_hi(t) & sorted(inorder(t)) -> search(t,x) = has_overlap(set_tree(t),x)
; inv_max_hi(t) & bst(t) -> search1(t,x) = (?iv in set_tree(t). in_ivl(x,iv))

; 2-3 trees:

; complete(t) -> 2^h(t) <= |t| + 1
(assert (par (a) (forall ((x a) (xs (list a))) (=> (sorted a xs) (sorted a (ins_list a x xs))))))
; |maxn(n)| = (3^n - 1) div 2

; |t| <= (3^h(t) - 1) div 2

; complete(t) -> complete(treeI(ins(a,t))) & hI(ins(a,t)) = h(t)
(assert (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (and (complete23 a (treeI a (ins a x t))) (= (hI a (ins a x t)) (h23 a t)))))))
; complete(t) -> complete(insert(a,t))
(assert (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (complete23 a (insert23 a x t))))))
; complete(r) & complete(treeD(l')) & h(r) = hD(l') -> complete(treeD(node21(l',a,r)))
(assert (par (a) (forall ((x a) (l' (upD a)) (r (tree23 a))) (=> (and (complete23 a r) (complete23 a (treeD a l')) (= (h23 a r) (hD a l')))
  (complete23 a (treeD a (node21 a l' x r)))))))
; 0 < h(r) -> hD(node21(l',a,r)) = max(hD(l'),h(r)) + 1
(assert (par (a) (forall ((l' (upD a)) (x a) (r (tree23 a))) (=> (less nat zero (h23 a r)) (= (hD a (node21 a l' x r)) (s (max (hD a l') (h23 a r))))))))
; split_min(t) = (x,t') & 0 < h(t) & complete(t) -> hD(t') = h(t)
(assert (par (a) (forall ((x a) (t (tree23 a)) (t' (upD a))) (=> (and (= (split_min23 a t) (Pair a (upD a) x t')) (less nat zero (h23 a t)) (complete23 a t))
  (= (hD a t') (h23 a t))))))
; split_min(t) = (x,t') & complete(t) & 0 < h(t) -> complete(treeD(t'))
(assert (par (a) (forall ((x a) (t (tree23 a)) (t' (upD a))) (=> (and (= (split_min23 a t) (Pair a (upD a) x t')) (complete23 a t) (less nat zero (h23 a t)))
  (complete23 a (treeD a t'))))))
; complete(t) -> hD(del(x,t)) = h(t)
(assert (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (= (hD a (del a x t)) (h23 a t))))))
; complete(t) -> complete(treeD(del(x,t)))
(assert (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (complete23 a (treeD a (del a x t)))))))
; complete(t) -> complete(delete(x,t))
(assert (par (a) (forall ((x a) (t (tree23 a))) (=> (complete23 a t) (complete23 a (delete23 a x t))))))
; not_T(ts) -> len(join_adj(ts)) < len(ts)
(assert (par (a) (forall ((ts (tree23s a))) (=> (not_T a ts) (less nat (len23s a (join_adj a ts)) (len23s a ts))))))
; not_T(ts) -> len(join_adj(ts)) <= len(ts) div 2

; not_T(ts) -> inorder2(join_adj(ts)) = inorder2(ts)
(assert (par (a) (forall ((ts (tree23s a))) (=> (not_T a ts) (= (inorder23s a (join_adj a ts)) (inorder23s a ts))))))
; inorder(join_all(ts)) = inorder2(ts)
(assert (par (a) (forall ((ts (tree23s a))) (= (inorder23 a (join_all a ts)) (inorder23s a ts)))))
; inorder(tree23_of_list(as)) = as
(assert (par (a) (forall ((xs (list a))) (= (inorder23 a (tree23_of_list a xs)) xs))))
; (!t in trees(ts). complete(t) & h(t) = n) & not_T(ts) -> (!t in trees(join_adj(ts)). complete(t) & h(t) = n + 1)
(assert (par (a) (forall ((n nat) (ts (tree23s a))) (=> (forall ((t (tree23 a))) (=> (in_trees a t ts) (and (complete23 a t) (= (h23 a t) n))))
  (forall ((t (tree23 a))) (=> (in_trees a t (join_adj a ts)) (and (complete23 a t) (= (h23 a t) (s n)))))))))
; (!t in trees(ts). complete(t) & h(t) = n) -> complete(join_all(ts))
(assert (par (a) (forall ((n nat) (ts (tree23s a))) (=> (forall ((t (tree23 a))) (=> (in_trees a t ts) (and (complete23 a t) (= (h23 a t) n))))
  (complete23 a (join_all a ts))))))
; t in trees(leaves(as)) -> complete(t) & h(t) = 0
(assert (par (a) (forall ((t (tree23 a)) (xs (list a))) (=> (in_trees a t (leaves a xs)) (and (complete23 a t) (= (h23 a t) zero))))))
; complete(tree23_of_list(as))
(assert (par (a) (forall ((xs (list a))) (complete23 a (tree23_of_list a xs)))))
; not_T(ts) -> T_join_adj(ts) <= len(ts) div 2

; T_tree23_of_list(as) <= 3 * |as| + 4

 
; red-black trees:

; invc(t) & invh(t) -> h(t) <= 2 * bh(t) + (if color(t) = Black then 0 else 1)
(assert (par (a) (forall ((t (rbt a))) (=> (and (invc a t) (invh a t)) (leq nat (h (pair a color) t) (plus (mult (s (s zero)) (bh a t)) (ite (= (color_of a t) Black) zero (s zero))))))))
; invc(t) & invh(t) -> 2^bh(t) <= |t|_1
(assert (par (a) (forall ((t (rbt a))) (=> (and (invc a t) (invh a t)) (leq nat (pow (s (s zero)) (bh a t)) (size1 (pair a color) t))))))
; 2^(h(t)/2) <= 2^bh(t) <= |t|_1

; rbt(t) -> h(t) <= 2 * lg(|t|_1)

; invh(l) & invh(r) & invc2(l) & invc(r) & bh(l) = bh(r) ->
;   invc(baliL(l,a,r)) & invh(baliL(l,a,r)) & bh(baliL(l,a,r)) = bh(l) + 1
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (=> (and (invh a l) (invh a r) (invc2 a l) (invc a r) (= (bh a l) (bh a r)))
  (and (invc a (baliL a l x r)) (invh a (baliL a l x r)) (= (bh a (baliL a l x r)) (s (bh a l))))))))
; invh(l) & invh(r) & invc(l) & invc2(r) & bh(l) = bh(r) ->
;   invc(baliR(l,a,r)) & invh(baliR(l,a,r)) & bh(baliR(l,a,r)) = bh(l) + 1
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (=> (and (invh a l) (invh a r) (invc a l) (invc2 a r) (= (bh a l) (bh a r)))
  (and (invc a (baliR a l x r)) (invh a (baliR a l x r)) (= (bh a (baliR a l x r)) (s (bh a l))))))))
; invc(t) & invh(t) -> invc2(ins(x,t)) & (color(t) = Black -> invc(ins(x,t))) & invh(ins(x,t)) & bh(ins(x,t)) = bh(t)
(assert (par (a) (forall ((x a) (t (rbt a))) (=> (and (invc a t) (invc a t))
  (and (invc2 a (insRB a x t)) (=> (= (color_of a t) Black) (and (invc a (insRB a x t)) (invh a (insRB a x t)) (= (bh a (insRB a x t)) (bh a t)))))))))
; rbt(t) -> rbt(insert(x,t))
(assert (par (a) (forall ((x a) (t (rbt a))) (=> (inv_rbt a t) (inv_rbt a (insertRB a x t))))))
; split_min(t) = (x,t') & t != <> & invh(t) & invc(t) -> invh(t') & (color(t) = Red -> bh(t') = bh(t) & invc(t')) &
;   (color(t) = Black -> bh(t') = bh(t) - 1 & invc2(t'))
(assert (par (a) (forall ((t (rbt a)) (x a) (t' (rbt a))) (=> (and (= (split_minRB a t) (Pair a (rbt a) x t')) (distinct t (Leaf (pair a color))) (invh a t) (invc a t))
  (and (invc a t')
       (=> (= (color_of a t) Red) (and (= (bh a t') (bh a t)) (invc a t')))
       (=> (= (color_of a t) Black) (and (= (s (bh a t')) (bh a t)) (invc2 a t'))))))))
; invh(t) & invc(t) & t' = del(x,t) -> invh(t') & (color(t) = Red -> bh(t') = bh(t) & invc(t')) &
;   (color(t) = Black -> bh(t') = bh(t) - 1 & invc2(t'))
; TODO this is unsat for some reason
;(assert (par (a) (forall ((t (rbt a)) (x a) (t' (rbt a))) (=> (and (invh a t) (invc a t) (= (delRB a x t) t'))
;  (and (invh a t')
;       (=> (= (color_of a t) Red) (and (= (bh a t') (bh a t)) (invc a t')))
;       (=> (= (color_of a t) Black) (and (= (s (bh a t')) (bh a t)))))))))
; rbt(t) -> rbt(delete(x,t))
(assert (par (a) (forall ((t (rbt a)) (x a)) (=> (inv_rbt a t) (inv_rbt a (deleteRB a x t))))))
; invh(l) & invh(r) & bh(l) + 1 = bh(r) & invc2(l) & invc(r) & t' = baldL(l,a,r) ->
;   invh(t') & bh(t') = bh(r) & invc2(t') & (color(r) = Black -> invc(t'))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a)) (t' (rbt a))) (=> (and (invh a l) (invh a r) (= (s (bh a l)) (bh a r)) (invc2 a l) (invc a r) (= t' (baldL a l x r)))
  (and (invh a t') (= (bh a t') (bh a r)) (invc2 a t') (=> (= (color_of a r) Black) (invc a t')))))))
; invh(l) & invh(r) & bh(l) = bh(r) + 1 & invc(l) & invc2(r) & t' = baldR(l,a,r) ->
;   invh(t') & bh(t') = bh(l) & invc2(t') & (color(l) = Black -> invc(t'))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a)) (t' (rbt a))) (=> (and (invh a l) (invh a r) (= (bh a l) (s (bh a r))) (invc a l) (invc2 a r) (= t' (baldR a l x r)))
  (and (invh a t') (= (bh a t') (bh a l)) (invc2 a t') (=> (= (color_of a l) Black) (invc a t')))))))
; invh(l) & invh(r) & bh(l) = bh(r) & invc(l) & invc(r) & t' = join(l,r) ->
;   invh(t') & bh(t') = bh(l) & invc2(t') & (color(l) = Black & color(r) = Black -> invc(t'))
(assert (par (a) (forall ((l (rbt a)) (r (rbt a)) (t' (rbt a))) (=> (and (invh a l) (invh a r) (= (bh a l) (bh a r)) (invc a l) (invc a r) (= t' (joinRB a l r)))
  (and (invh a t') (= (bh a t') (bh a l)) (invc2 a t') (=> (= (color_of a l) Black) (invc a t')))))))
; invc(t) & invh(t) -> h(t) <= 2 * lg(|t|_1) + 2

; invh(t) <-> bhs(t) = { bh(t) }

; inorder(rbt_of_list(as)) = as
;(assert (par (a) (forall ((xs (list a))) (= (inorder a (rbt_of_list a xs)) xs))))
; rbt(rbt_of_list(as))
;(assert (par (a) (forall ((xs (list a))) (inv_rbt a (rbt_of_list a xs)))))

; AVL trees:

; avl(t) -> fib(h(t) + 2) <= |t|_1
(assert (par (a) (forall ((t (tree_ht a))) (=> (avl a t) (leq nat (fib (plus (h (pair a nat) t) (s (s zero)))) (size1 (pair a nat) t))))))
; ((1 + sqrt(5))/2)^n <= fib(n + 2)

; avl(t) -> h(t) <= 1 / lg((1 + sqrt(5))/2) * lg(|t|_1)

; avl(t) -> avl(insert(x,t)) & h(insert(x,t)) in { h(t), h(t) + 1 }
(assert (par (a) (forall ((x a) (t (tree_ht a))) (=> (avl a t) (and (avl a (insertAVL a x t))
  (or (= (h (pair a nat) (insertAVL a x t)) (h (pair a nat) t)) (= (h (pair a nat) (insertAVL a x t)) (s (h (pair a nat) t)))))))))
; avl(l) & avl(r) & h(r) - 1 <= h(l) & h(l) <= h(r) + 2 -> avl(balL(l,a,r))
(assert (par (a) (forall ((x a) (l (tree_ht a)) (r (tree_ht a))) (=> (and (avl a l) (avl a r) (leq nat (h (pair a nat) r) (s (h (pair a nat) l)))
  (leq nat (h (pair a nat) l) (s (s (h (pair a nat) r))))) (avl a (balL a l x r))))))
; avl(l) & avl(r) & h(l) - 1 <= h(r) & h(r) <= h(l) + 2 -> avl(balR(l,a,r))
(assert (par (a) (forall ((x a) (l (tree_ht a)) (r (tree_ht a))) (=> (and (avl a l) (avl a r) (leq nat (h (pair a nat) l) (s (h (pair a nat) r)))
  (leq nat (h (pair a nat) r) (s (s (h (pair a nat) l))))) (avl a (balR a l x r))))))
; avl(t) & t != <> -> avl(fst(split_max(t))) & h(t) in { h(fst(split_max(t))), h(fst(split_max(t))) + 1 }
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((t (tree_ht a))) (=> (and (avl a t) (distinct t (Leaf (pair a nat))))
;  (let ((sm (split_max a t))) (and (avl a (Pair_0 (tree_ht a) a sm)) (or (= (h (pair a nat) t) (h (pair a nat) (Pair_0 (tree_ht a) a sm))) (= (h (pair a nat) t) (s (h (pair a nat) (Pair_0 (tree_ht a) a sm)))))))))))
; avl(t) & t' = delete(x,t) -> avl(t') & h(t) in { h(t'), h(t') + 1 }
(assert (par (a) (forall ((x a) (t (tree_ht a)) (t' (tree_ht a))) (=> (and (avl a t) (= t' (deleteAVL a x t)))
  (and (avl a t') (or (= (h (pair a nat) t) (h (pair a nat) t')) (= (h (pair a nat) t) (s (h (pair a nat) t')))))))))
; avl(t) & h(t) = n -> 2^(n div 2) <= |t|_1

; avl(t) -> h(t) <= 2 * lg(|t|_1)

; avl0(fibt(n))
(assert (forall ((n nat)) (avl0 unit (fibt n))))
; |fibt(n)|_1 = fib(n + 2)
(assert (forall ((n nat)) (= (size1 unit (fibt n)) (fib (s (s n))))))
; avl(t) -> |fibt(h(t))|_1 <= |t|_1
(assert (par (a) (forall ((t (tree a))) (leq nat (size1 unit (fibt (h a t))) (size1 a t)))))
; acomplete(t) -> avl0(t)
(assert (par (a) (forall ((t (tree a))) (=> (acomplete a t) (avl0 a t)))))
; inorder(avl_of_list(as)) = as
;(assert (par (a) (forall ((xs (list a))) (= (inorder (pair a nat) (avl_of_list a xs)) xs))))
; avl(avl_of_list(as))
;(assert (par (a) (forall ((xs (list a))) (avl a (avl_of_list a xs)))))
; avl(t) & t' = insert(x,t) -> avl(t') & h(t') = h(t) + if incr(t,t') then 1 else 0
(assert (par (a) (forall ((x a) (t (tree_bal a)) (t' (tree_bal a))) (=> (and (avl_bal a t) (= t' (insert_bal a x t)))
  (and (avl_bal a t') (= (h (pair a bal) t') (ite (incr a a t t') (s (h (pair a bal) t)) (h (pair a bal) t))))))))
; avl(t) & t' = delete(x,t) -> avl(t') & h(t) = h(t') + if decr(t,t') then 1 else 0
(assert (par (a) (forall ((x a) (t (tree_bal a)) (t' (tree_bal a))) (=> (and (avl_bal a t) (= t' (delete_bal a x t)))
  (and (avl_bal a t') (= (h (pair a bal) t) (ite (decr a a t t') (s (h (pair a bal) t')) (h (pair a bal) t'))))))))
; split_max(t) = (t',a) & avl(t) & t != <> -> avl(t') & h(t) = h(t') + if decr(t,t') then 1 else 0
(assert (par (a) (forall ((x a) (t (tree_bal a)) (t' (tree_bal a))) (=> (and (= (split_max_bal a t) (Pair (tree_bal a) a t' x))
  (avl_bal a t) (distinct t (Leaf (pair a bal)))) (and (avl_bal a t') (= (h (pair a bal) t) (ite (decr a a t t') (s (h (pair a bal) t')) (h (pair a bal) t'))))))))
; avl(t) -> avl_ht(debal(t))
(assert (par (a) (forall ((t (tree_bal a))) (=> (avl_bal a t) (avl a (debal a t))))))
; avl(t) -> debal2(t) = debal(t)
(assert (par (a) (forall ((t (tree_bal a))) (=> (avl_bal a t) (= (debal2 a t) (debal a t))))))

; 
; split_min(t) = (m,t') & t != <> -> m in set_tree(t) & set_tree(t) = {m} U set_tree(t')
(assert (par (a b) (forall ((t (ptree a b)) (m a) (t' (ptree a b))) (=> (and (= (split_minp a b t) (Pair a (ptree a b) m t'))
  (distinct t (LeafP a b))) (and (in_set_ptree a b m t)
    (forall ((x a)) (= (in_set_ptree a b x t) (or (= x m) (in_set_ptree a b x t')))))))))
; split_min(t) = (m,t') & bst(t) & t != <> -> bst(t') & (!x in set_tree(t').m < x)
(assert (par (a b) (forall ((t (ptree a b)) (m a) (t' (ptree a b))) (=> (and (= (split_minp a b t) (Pair a (ptree a b) m t'))
  (bst (pair a b) t) (distinct t (LeafP a b))) (and (bst (pair a b) t') (forall ((x a)) (=> (in_set_ptree a b x t') (less a m x))))))))
; split_min(t) = (m,t') & inv(t) & t != <> -> inv(t')
(assert (par (a b) (forall ((t (ptree a b)) (m a) (t' (ptree a b))) (=> (and (= (split_minp a b t) (Pair a (ptree a b) m t'))
  (invp a b t) (distinct t (LeafP a b))) (invp a b t')))))
; set_tree(join2(l,r)) = set_tree(l) U set_tree(r)
(assert (par (a b) (forall ((l (ptree a b)) (x a) (r (ptree a b))) (= (in_set_ptree a b x (join2 a b l r))
  (or (in_set_ptree a b x l) (in_set_ptree a b x r))))))
; bst(l) & bst(r) & (!x in set_tree(l).!y in set_tree(r). x < y) -> bst(join2(l,r))
(assert (par (a b) (forall ((l (ptree a b)) (r (ptree a b))) (=> (and (bst (pair a b) l) (bst (pair a b) r)
  (forall ((x a) (y a)) (=> (and (in_set_ptree a b x l) (in_set_ptree a b y r)) (less a x y))))
  (bst (pair a b) (join2 a b l r))))))
; inv(l) & inv(r) -> inv(join2(l,r))
(assert (par (a b) (forall ((l (ptree a b)) (r (ptree a b))) (=> (and (invp a b l) (invp a b r)) (invp a b (join2 a b l r))))))
; split(t,x) = (l,b,r) & bst(t) ->
;   set_tree(l) = { a in set_tree(t) | a < x } & set_tree(r) = { a in set_tree(t) | x < a } & b = (x in set_tree(t)) & bst(l) & bst(r)

; split(t,x) = (l,b,r) & inv(t) -> inv(l) & inv(r)
(assert (par (a b) (forall ((t (ptree a b)) (x a) (y Bool) (l (ptree a b)) (r (ptree a b))) (=> (and (= (splitp a b t x) (Triple (ptree a b) Bool (ptree a b) l y r))
  (invp a b t)) (and (invp a b l) (invp a b r))))))
; bst(t2) -> set_tree(union(t1,t2)) = set_tree(t1) U set_tree(t2)
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (bst (pair a b) t2)
  (forall ((x a)) (= (in_set_ptree a b x (union a b t1 t2)) (or (in_set_ptree a b x t1) (in_set_ptree a b x t2))))))))
; bst(t1) & bst(t2) -> bst(union(t1,t2))
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (bst (pair a b) t1) (bst (pair a b) t2))
  (bst (pair a b) (union a b t1 t2))))))
; inv(t1) & inv(t2) -> inv(union(t1,t2))
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (invp a b t1) (invp a b t2)) (invp a b (union a b t1 t2))))))
; bst(t1) & bst(t2) -> set_tree(inter(t1,t2)) = set_tree(t1) /cap set_tree(t2)
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (bst (pair a b) t1) (bst (pair a b) t2))
  (forall ((x a)) (= (in_set_ptree a b x (inter a b t1 t2)) (and (in_set_ptree a b x t1) (in_set_ptree a b x t2))))))))
; bst(t1) & bst(t2) -> bst(inter(t1,t2))
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (bst (pair a b) t1) (bst (pair a b) t2))
  (bst (pair a b) (inter a b t1 t2))))))
; inv(t1) & inv(t2) -> inv(inter(t1,t2))
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (invp a b t1) (invp a b t2)) (invp a b (inter a b t1 t2))))))
; bst(t1) & bst(t2) -> set_tree(diff(t1,t2)) = set_tree(t1) - set_tree(t2)
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (bst (pair a b) t1) (bst (pair a b) t2))
  (forall ((x a)) (= (in_set_ptree a b x (diff a b t1 t2)) (and (in_set_ptree a b x t1) (not (in_set_ptree a b x t2)))))))))
; bst(t1) & bst(t2) -> bst(diff(t1,t2))
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (bst (pair a b) t1) (bst (pair a b) t2))
  (bst (pair a b) (diff a b t1 t2))))))
; inv(t1) & inv(t2) -> inv(diff(t1,t2))
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (invp a b t1) (invp a b t2)) (invp a b (diff a b t1 t2))))))
; invc(l) & invc(r) & invh(l) & invh(r) & bh(l) <= bh(r) ->
;   invc2(joinL(l,x,r)) & (bh(l) != bh(r) & color(r) = Black -> invc(joinL(l,x,r))) & invh(joinL(l,x,r)) & bh(joinL(l,x,r)) = bh(r)
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (=> (and (invc a l) (invc a r) (invh a l) (invh a r) (leq nat (bh a l) (bh a r)))
  (and (invc2 a (joinL a l x r)) (=> (and (distinct (bh a l) (bh a r)) (= (color_of a r) Black)) (invc a (joinL a l x r)))
    (invh a (joinL a l x r)) (= (bh a (joinL a l x r)) (bh a l)))))))
; bh(l) < bh(r) -> set_tree(joinL(l,x,r)) = set_tree(l) U {x} U set_tree(r)
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (=> (less nat (bh a l) (bh a r))
  (forall ((y a)) (= (in_set_ptree a color y (joinL a l x r)) (or (in_set_ptree a color y l) (= x y) (in_set_ptree a color y r))))))))
; bst(<l,(a,n),r>) & bh(l) <= bh(r) -> bst(joinL(l,a,r))
(assert (par (a) (forall ((l (rbt a)) (x a) (n color) (r (rbt a))) (=> (and (bst (pair a color) (NodeP a color l x n r)) (leq nat (bh a l) (bh a r)))
  (bst (pair a color) (joinL a l x r))))))
; bst(t1) & bst(t2) -> set_tree(diff1(t1,t2)) = set_tree(t1) - set_tree(t2)
(assert (par (a b) (forall ((t1 (ptree a b)) (t2 (ptree a b))) (=> (and (bst (pair a b) t1) (bst (pair a b) t2))
  (forall ((x a)) (= (in_set_ptree a b x (diff1 a b t1 t2)) (and (in_set_ptree a b x t1) (not (in_set_ptree a b x t2)))))))))

; 
; Braun-trees:

; acomplete(l) & acomplete(r) & |l|=|r|+1 -> acomplete(<l,x,r>)
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (and (acomplete a l) (acomplete a r) (= (size a l) (s (size a r))))
  (acomplete a (Node a l x r))))))
; braun(t) -> acomplete(t)
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (acomplete a t)))))
; braun(<l,x,r>) & n in {1..|<l,x,r>|} & 1 < n -> (odd(n) -> n div 2 in {1..|r|}) & (even(n) -> n div 2 in {1..|l|})
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a)) (n nat)) (=> (and (braun a (Node a l x r)) (in_range n (s zero) (size a (Node a l x r)))
  (less nat (s zero) n)) (and
    (=> (odd n) (in_range (div2 n) (s zero) (size a r)))
    (=> (even n) (in_range (div2 n) (s zero) (size a l))))))))
; |list(t)|=|t|
(assert (par (a) (forall ((t (tree a))) (= (len a (list_of a t)) (size a t)))))
; braun(t) & i < |t| -> list(t!i) = lookup1(t,(i+1))
(assert (par (a) (forall ((t (tree a)) (i nat)) (=> (and (braun a t) (less nat i (size a t)))
  (= (nth a (list_of a t) i) (lookup1 a t (s i)))))))
; n < |xs| + |ys| & |ys| <= |xs| & |xs| <= |ys| + 1 -> splice(xs,ys) ! n = (if even(n) then xs else ys) ! (n div 2)
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((n nat) (xs (list a)) (ys (list a))) (=> (and (less nat n (plus (len a xs) (len a ys)))
;  (leq nat (len a ys) (len a xs)) (leq nat (len a xs) (s (len a ys))))
;  (= (nth a (splice a xs ys) n) (nth a (ite (even n) xs ys) (div2 n)))))))
; braun(t) -> list(t) = map(lookup1(t)) [1..<|t|+1]
;(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (= (list_of a t) (map (lookup1 a t ???))))))
; braun(t) & n in {1..|t|} -> |update1(n,x,t)| = |t|
(assert (par (a) (forall ((n nat) (t (tree a)) (x a)) (=> (and (braun a t) (in_range n (s zero) (size a t)))
  (= (size a (update1 a n x t)) (size a t))))))
; braun(t) & n in {1..|t|} -> braun(update1(n,x,t))
(assert (par (a) (forall ((n nat) (t (tree a)) (x a)) (=> (and (braun a t) (in_range n (s zero) (size a t)))
  (braun a (update1 a n x t))))))
; braun(t) & n in {1..|t|} -> lookup1(update1(n,x,t),m) = if n = m then x else lookup1(t,m)
(assert (par (a) (forall ((n nat) (m nat) (t (tree a)) (x a)) (=> (and (braun a t) (in_range n (s zero) (size a t)))
  (= (lookup1 a (update1 a n x t) m) (ite (= n m) x (lookup1 a t m)))))))
; braun(t) & n in {1..|t|} -> list(update1(n,x,t)) = (list(t))[n-1 := x]
(assert (par (a) (forall ((n nat) (t (tree a)) (x a)) (=> (and (braun a t) (in_range (s n) (s zero) (size a t)))
  (= (list_of a (update1 a (s n) x t)) (upd a (list_of a t) n x))))))
; braun(t) -> |update1(|t|+1,x,t)| = |t| + 1
(assert (par (a) (forall ((t (tree a)) (x a)) (=> (braun a t) (= (size a (update1 a (s (size a t)) x t)) (s (size a t)))))))
; braun(t) -> braun(update1(|t|+1,x,t))
(assert (par (a) (forall ((t (tree a)) (x a)) (=> (braun a t) (braun a (update1 a (s (size a t)) x t))))))
; braun(t) -> list(update1(|t|+1,x,t)) = list(t) @ [x]
(assert (par (a) (forall ((t (tree a)) (x a)) (=> (braun a t) (= (list_of a (update1 a (s (size a t)) x t))
  (append a (list_of a t) (Cons a x (Nil a))))))))
; braun(t) -> |adds(xs,|t|,t)| = |t| + |xs| & braun(adds(xs,|t|,t))
(assert (par (a) (forall ((t (tree a)) (xs (list a))) (=> (braun a t)
  (and (= (size a (adds a xs (size a t) t)) (plus (size a t) (len a xs))) (braun a (adds a xs (size a t) t)))))))
; braun(t) -> list(adds(xs,|t|,t)) = list(t) @ xs
(assert (par (a) (forall ((xs (list a)) (t (tree a))) (=> (braun a t)
  (= (list_of a (adds a xs (size a t) t)) (append a (list_of a t) xs))))))
; |ys| <= |xs| -> splice(xs @ [x],ys) = splice(xs,ys @ [x])
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (=> (leq nat (len a ys) (len a xs))
  (= (splice a (append a xs (Cons a x (Nil a))) ys) (splice a xs (append a ys (Cons a x (Nil a)))))))))
; |xs| <= |ys| + 1 -> splice(xs,ys @ [y]) = splice(xs,ys) @ [y]
(assert (par (a) (forall ((y a) (xs (list a)) (ys (list a))) (=> (leq nat (len a xs) (s (len a ys)))
  (= (splice a xs (append a ys (Cons a y (Nil a)))) (append a (splice a xs ys) (Cons a y (Nil a))))))))
; braun(t) -> braun(del_hi(|t|,t))
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (braun a (del_hi a (size a t) t))))))
; braun(t) -> list(del_hi(|t|,t)) = butlast(list(t))
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (= (list_of a (del_hi a (size a t) t)) (butlast a (list_of a t)))))))
; braun(t) -> braun(add_lo(x,t))
(assert (par (a) (forall ((x a) (t (tree a))) (=> (braun a t) (braun a (add_lo a x t))))))
; braun(t) -> list(add_lo(a,t)) = a # list(t)
(assert (par (a) (forall ((x a) (t (tree a))) (=> (braun a t) (= (list_of a (add_lo a x t)) (Cons a x (list_of a t)))))))
; braun(<l,x,r>) -> braun(merge(l,r))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (braun a (Node a l x r)) (braun a (merge_braun a l r))))))
; braun(<l,x,r>) -> list(merge(l,r)) = splice(list(l),list(r))
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (braun a (Node a l x r))
  (= (list_of a (merge_braun a l r)) (splice a (list_of a l) (list_of a r)))))))
; braun(t) -> braun(del_lo(t))
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (braun a (del_lo a t))))))
; braun(t) -> list(del_lo(t)) = tl(list(t))
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (= (list_of a (del_lo a t)) (tl a (list_of a t)))))))
; braun(t) -> size_fast(t) = |t|
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (= (size_fast a t) (size a t))))))
; braun(t) & |t| in {n,n+1} -> diff(t,n) = |t| - n

; list(braun_of(x,n)) = replicate(n,x)
(assert (par (a) (forall ((x a) (n nat)) (= (list_of a (braun_of a x n)) (replicate a n x)))))
; braun(braun_of(x,n))
(assert (par (a) (forall ((x a) (n nat)) (braun a (braun_of a x n)))))
; braun2_of(x,n) = (s,t) -> list(s) = replicate(n,x) & list(t) = replicate(n + 1, x)
(assert (par (a) (forall ((x a) (n nat) (t (tree a)) (t' (tree a))) (=> (= (braun2_of a x n) (Pair (tree a) (tree a) t t'))
  (and (= (list_of a t) (replicate a n x)) (= (list_of a t') (replicate a (s n) x)))))))
; braun2_of(x,n) = (s,t) -> |s| = n & |t| = n + 1 & braun(s) & braun(t)
(assert (par (a) (forall ((x a) (n nat) (t (tree a)) (t' (tree a))) (=> (= (braun2_of a x n) (Pair (tree a) (tree a) t t'))
  (and (= (size a t) n) (= (size a t') (s n)) (braun a t) (braun a t'))))))
; take_nths(i,k,drop(j,xs)) = take_nths(i + j,k,xs)
(assert (par (a) (forall ((i nat) (k nat) (j nat) (xs (list a))) (= (take_nths a i k (drop a j xs)) (take_nths a (plus i j) k xs)))))
; take_nths(0,0,xs) = xs
(assert (par (a) (forall ((xs (list a))) (= (take_nths a zero zero xs) xs))))
; splice(take_nths(0,1,xs),take_nths(1,1,xs)) = xs
(assert (par (a) (forall ((xs (list a))) (= (splice a (take_nths a zero (s zero) xs)
  (take_nths a (s zero) (s zero) xs)) xs))))
; take_nths(i,m,take_nths(j,n,xs)) = take_nths(i * 2^n + j, m + n, xs)
(assert (par (a) (forall ((i nat) (m nat) (j nat) (n nat) (xs (list a)))
  (= (take_nths a i m (take_nths a j n xs)) (take_nths a (plus (mult i (pow (s (s zero)) n)) j) (plus m n) xs)))))
; take_nths(i,k,xs) = [] <-> |xs| <= i
(assert (par (a) (forall ((i nat) (k nat) (xs (list a))) (= (= (take_nths a i k  xs) (Nil a)) (leq nat (len a xs) i)))))
; i < |xs| -> hd(take_nths(i,k,xs)) = xs ! i
(assert (par (a) (forall ((i nat) (k nat) (xs (list a))) (=> (less nat i (len a xs))
  (= (hd a (take_nths a i k xs)) (nth a xs i))))))
; |xs| = |ys| | |xs| = |ys| + 1 -> take_nths(0,1,splice(xs,ys)) = xs & take_nths(1,1,splice(xs,ys)) = ys
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (=> (or (= (len a xs) (len a ys)) (= (len a xs) (s (len a ys))))
  (and (= (take_nths a zero (s zero) (splice a xs ys)) xs)
       (= (take_nths a (s zero) (s zero) (splice a xs ys)) ys))))))
; |take_nths(0,1,xs)| = |take_nths(1,1,xs)| | |take_nths(0,1,xs)| = |take_nths(1,1,xs)| + 1
(assert (par (a) (forall ((xs (list a))) (or (= (len a (take_nths a zero (s zero) xs)) (len a (take_nths a (s zero) (s zero) xs)))
  (= (len a (take_nths a zero (s zero) xs)) (s (len a (take_nths a (s zero) (s zero) xs))))))))
; braun_list(t,xs) <-> braun(t) & xs = list(t)
; |nodes(ls,xs,rs)| = |xs|
; i < |xs| -> nodes(ls,xs,rs) ! i = <if i < |ls| then ls ! i else <>, xs ! i, if i < |rs| then rs ! i else <>>
; |brauns(k,xs)| = min(|xs|,2^k)
; i < min(|xs|,2^k) -> braun_list(brauns(k,xs ! i), take_nths(i,k,xs))
; braun(brauns1(xs)) & list(brauns1(xs)) = xs
; T_brauns(k,xs) = 4 * |xs|
; |ts| = 2^k & (!i<2^k.braun_list(ts ! i, take_nths(i,k,xs))) -> list_fast_rec(ts) = xs
; map_value(ts) = take(2^k,xs)
; list_fast_rec(map(left,ts) @ map(right,ts)) = drop(2^k,xs)
; (!t in set(ts).t != <>) -> ...
; Theorem 11.9
; braun(t) -> h(t) = ceil(lg(|t|_1))
; braun(t) -> 2^h(t) <= 2 * |t| + 1
; n <= |xs| & bal(n,xs) = (t,zs) -> braun(t)
; braun(t) & nat_of(bs) in {1..|t|} -> lookup_trie(t,bs) = lookup1(t,nat_of(bs))
; update_trie(bs,x,t) = update1(nat_of(bs),x,t)
; del_lo2(t) = del_lo(t)
; braun(t) -> lh(t) = h(t)
; T_size_fast(t) <= h(t)^2
; list(braun_of_naive(x,n)) = replicate(n,x)
; 
; Tries:
; ...
; 
; Huffman's algorithm:
; consistent(t) & a in alphabet(t) & b in alphabet(t) & freq(t,a) <= freq(t,b) & depth(t,a) < depth(t,b) -> cost(swapSyms(t,a,b)) <= cost(t)
; consistent(t) & sibling(t,a) != a -> cost(mergeSibling(t,a)) + freq(t,a) + freq(t,sibling(t,a)) = cost(t)
; consistent(t) & a in alphabet(t) & freq(t,a) = wa + wb -> cost(splitLeaf(t,wa,a,wb,b)) = cost(t) + wa + wb

; Priority queues

; Leftist heaps
; heap t & t != <> -> get_min t = Min (set_tree t)

; mset_tree (merge t1 t2) = mset_tree t1 + mset_tree t2
(assert (par (a) (forall ((t1 (lheap a)) (t2 (lheap a)) (x a)) (= (count_ptree a nat x (merge_lheap a t1 t2))
  (plus (count_ptree a nat x t1) (count_ptree a nat x t2))))))
; ltree l & ltree r -> ltree (merge l r)
; TODO if we write lheap instead of ltree Vampire crashes. Fix it with a user error message.
(assert (par (a) (forall ((l (lheap a)) (r (lheap a))) (=> (and (ltree a l) (ltree a r)) (ltree a (merge_lheap a l r))))))
; heap l & heap r -> heap (merge l r)
(assert (par (a) (forall ((l (lheap a)) (r (lheap a))) (=> (and (heapp a nat l) (heapp a nat r)) (heapp a nat (merge_lheap a l r))))))
; mset_tree (insert x t) = mset_tree t + {{x}}

; mset_tree (del_min t) = mset_tree t - {{ get_min t}}

; ltree t -> ltree (insert x t)
(assert (par (a) (forall ((x a) (t (lheap a))) (=> (ltree a t) (ltree a (insert_lheap a x t))))))
; heap t -> heap (insert x t)
(assert (par (a) (forall ((x a) (t (lheap a))) (=> (heapp a nat t) (heapp a nat (insert_lheap a x t))))))
; ltree t -> ltree (del_min t)
(assert (par (a) (forall ((t (lheap a))) (=> (ltree a t) (ltree a (del_min_lheap a t))))))
; heap t -> heap (del_min t)
(assert (par (a) (forall ((t (lheap a))) (=> (heapp a nat t) (heapp a nat (del_min_lheap a t))))))
; ltree l & ltree r -> T_merge l r <= mh l + mh r + 1

; ltree l & ltree r -> T_merge l r <= lg |l|_1 + lg |r|_1 + 1

; ltree t -> T_insert x t <= lg |t|_1 + 3

; ltree t -> T_del_min t <= 2 * lg |t|_1 + 1

; Braun tree priority queues
; |insert x t| = |t| + 1
(assert (par (a) (forall ((x a) (t (tree a))) (= (size a (insert_braun a x t)) (s (size a t))))))
; mset_tree (insert x t) = {{x}} + mset_tree t

; braun t -> braun (insert x t)
(assert (par (a) (forall ((x a) (t (tree a))) (=> (braun a t) (braun a (insert_braun a x t))))))
; heap t -> heap (insert x t)
(assert (par (a) (forall ((x a) (t (tree a))) (=> (heap a t) (heap a (insert_braun a x t))))))
; del_left t = (x,t') & t != <> -> mset_tree t = {{x}} + mset_tree t'

; del_left t = (x,t') & t != <> & heap t -> heap t'
(assert (par (a) (forall ((x a) (t (tree a)) (t' (tree a))) (=> (and (= (del_left a t) (Pair a (tree a) x t'))
  (distinct t (Leaf a)) (heap a t)) (heap a t')))))
; del_left t = (x,t') & t != <> -> |t| = |t'| + 1
(assert (par (a) (forall ((x a) (t (tree a)) (t' (tree a))) (=> (and (= (del_left a t) (Pair a (tree a) x t'))
  (distinct t (Leaf a))) (= (size a t) (s (size a t')))))))
; del_left t = (x,t') & t != <> & braun t -> braun t'
(assert (par (a) (forall ((x a) (t (tree a)) (t' (tree a))) (=> (and (= (del_left a t) (Pair a (tree a) x t'))
  (distinct t (Leaf a)) (braun a t)) (braun a t')))))
; braun <l,a,r> -> |sift_down l a r| = |l| + |r| + 1
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (braun a (Node a l x r))
  (= (size a (sift_down a l x r)) (s (plus (size a l) (size a r))))))))
; braun <l,a,r> -> braun (sift_down l a r)
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (braun a (Node a l x r))
  (braun a (sift_down a l x r))))))
; braun <l,a,r> -> mset_tree (sift_down l a r) = {{a}} + (mset_tree l + mset_tree r)

; braun <l,a,r> & heap l & heap r -> heap (sift_down l a r)
(assert (par (a) (forall ((l (tree a)) (x a) (r (tree a))) (=> (and (braun a (Node a l x r))
  (heap a l) (heap a r)) (heap a (sift_down a l x r))))))
; braun t -> braun (del_min t)
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (braun a (del_min_braun a t))))))
; heap t & braun t -> heap (del_min t)
(assert (par (a) (forall ((t (tree a))) (=> (and (heap a t) (braun a t)) (heap a (del_min_braun a t))))))
; braun t -> |del_min t| = |t| - 1
(assert (par (a) (forall ((t (tree a))) (=> (braun a t) (= (s (size a (del_min_braun a t))) (size a t))))))
; braun t & t != <> -> mset_tree (del_min t) = mset_tree t - {{ get_min t }} 

; Binomial heaps
; invar_btree t -> |mset_tree t| = 2^(rank t)
; invar ts -> |ts| <= lg (|mset_heap ts| + 1)
; invar_tree t1 & invar_tree t2 & rank t1 = rank t2 -> invar_tree (link t1 t2)
; mset_tree (link t1 t2) = mset_tree t1 + mset_tree t2
; invar_tree t & invar ts & (!t' in set ts. rank t <= rank t') -> invar (ins_tree t ts)
; mset_heap (ins_tree t ts) = mset_tree t + mset_heap ts
; invar t -> invar (insert x t)
; mset_heap (insert x t) = {{x}} + mset_heap t
; invar ts1 & invar ts2 -> invar (merge ts1 ts2)
; mset_heap (merge ts1 ts2) = mset_heap ts1 + mset_heap ts2
; t' in set (merge ts1 ts2) & (!t1 in set ts1. rank t < rank t1) & (!t2 in set ts2. rank t < rank t2) ->
;   rank t < rank t'
; mset_heap ts != {{}} & invar ts -> get_min ts = Min_mset (mset_heap ts)
; ts != [] & invar ts -> invar (del_min ts)
; ts != [] -> mset_heap ts = mset_heap (del_min ts) + {{get_min ts}}
; get_min_rest ts = (t',ts') & ts != [] & invar ts -> invar_tree t'
; get_min_rest ts = (t',ts') & ts != [] & invar ts -> invar ts'
; ts != [] & get_min_rest ts = (t',ts') -> root t' = get_min ts
; T_ins_tree t ts <= |ts| + 1
; invar ts -> T_insert x ts <= lg (|mset_heap ts| + 1) + 2
; T_ins_tree t ts + |ins_tree t ts| = 2 + |ts|
; |merge ts1 ts2| + T_merge ts1 ts2 <= 2 * (|ts1| + |ts2|) + 1
; invar ts1 & invar ts2 -> T_merge ts1 ts2 <= 4 * lg (|mset_heap ts1| + |mset_heap ts2| + 1) + 1
; invar ts & ts != [] -> T_del_min ts <= 6 * lg(|mset_heap ts| + 1) + 3
; invar_btree t -> nol l t = rank t choose l