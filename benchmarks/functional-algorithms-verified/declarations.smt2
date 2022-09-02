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
(define-sort itree (a) (tree (pair a nat)))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype upI (par (a) ((TI (TI_0 (tree23 a))) (OF (OF_0 (tree23 a)) (OF_1 a) (OF_2 (tree23 a))))))
(declare-datatype upD (par (a) ((TD (TD_0 (tree23 a))) (UF (UF_0 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T (T_0 (tree23 a))) (TTs (TTs_0 (tree23 a)) (TTs_1 a) (TTs_2 (tree23s a))))))
(declare-datatype color ((Red) (Black)))
(declare-datatype bal ((Lh) (Bal) (Rh)))
;(declare-datatype tree4 ((Leaf4) (Lh (Lh_0 tree4) (Lh_1 nat) (Lh_2 tree4)) (Bal (Bal_0 tree4) (Bal_1 nat) (Bal_2 tree4)) (Rh (Rh_0 tree4) (Rh_1 nat) (Rh_2 tree4))))
;(declare-datatype trie ((Nd Bool ('a -> 'a trie option))))
(declare-datatype trie ((Lf) (Nd (Nd_0 Bool) (Nd_1 trie) (Nd_2 trie))))
(declare-datatype trieP ((LfP) (NdP (NdP_0 (list Bool)) (NdP_1 Bool) (NdP_2 trieP) (NdP_3 trieP))))
(declare-datatype rbt (par (a) ((LeafRB) (NodeRB (NodeR_0 (rbt a)) (NodeR_1 (pair a color)) (NodeR_2 (rbt a))))))
(define-sort tree_ht (a) (tree (pair a nat)))

; auxiliary functions for sets and multisets -- remove these once a higher-order setting is used
(declare-fun in_set (par (a) (a (list a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set a x (Nil a))))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (in_set a x (Cons a y ys)) (or (= x y) (in_set a x ys))))))
(declare-fun in_set_tree (par (a) (a (tree a)) Bool))
(assert (par (a) (forall ((x a)) (not (in_set_tree a x (Leaf a))))))
(assert (par (a) (forall ((x a) (l (tree a)) (y a) (r (tree a))) (= (in_set_tree a x (Node a l y r)) (or (= x y) (in_set_tree a x l) (in_set_tree a x r))))))
(declare-fun count (par (a) (a (list a)) nat))
(assert (par (a) (forall ((x a)) (= (count a x (Nil a)) zero))))
(assert (par (a) (forall ((x a) (y a) (ys (list a))) (= (count a x (Cons a y ys)) (ite (= x y) (s (count a x ys)) (count a x ys))))))
(declare-fun same_set (par (a) ((list a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (same_set a xs ys) (forall ((x a)) (= (in_set a x xs) (in_set a x ys)))))))
(declare-fun same_mset (par (a) ((list a) (list a)) Bool))
(assert (par (a) (forall ((xs (list a)) (ys (list a))) (= (same_mset a xs ys) (forall ((x a)) (= (count a x xs) (count a x ys)))))))

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
(declare-fun append (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (append a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (append a (Cons a x xs) ys) (Cons a x (append a xs ys))))))
(declare-fun rev (par (a) ((list a)) (list a)))
(assert (par (a) (= (rev a (Nil a)) (Nil a))))
(assert (par (a) (forall ((x a) (xs (list a))) (= (rev a (Cons a x xs)) (append a (rev a xs) (Cons a x (Nil a)))))))
(declare-fun itrev (par (a) ((list a) (list a)) (list a)))
(assert (par (a) (forall ((ys (list a))) (= (itrev a (Nil a) ys) ys))))
(assert (par (a) (forall ((x a) (xs (list a)) (ys (list a))) (= (itrev a (Cons a x xs) ys) (itrev a xs (Cons a x ys))))))
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
(declare-fun len (par (a) ((list a)) nat))
(assert (par (a) (= (len a (Nil a)) zero)))
(assert (par (a) (forall ((x a) (xs (list a))) (= (len a (Cons a x xs)) (s (len a xs))))))
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
;(assert (par (a) (forall ((xs (list a))) (= (msort a xs) (let ((n (len a xs))) (ite (leq nat n 1) xs
;  (merge a (msort a (take a (div n 2) xs)) (msort a (drop a (div n 2) xs)))))))))
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
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (R a l x r) (NodeRB a l (Pair a color x Red) r)))))
(declare-fun B (par (a) ((rbt a) a (rbt a)) (rbt a)))
(assert (par (a) (forall ((l (rbt a)) (x a) (r (rbt a))) (= (B a l x r) (NodeRB a l (Pair a color x Black) r)))))
(declare-fun color_of (par (a) ((rbt a)) color))
(assert (par (a) (= (color_of a (LeafRB a)) Black)))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (color_of a (NodeRB a l (Pair a color x c) r)) c))))
(declare-fun paint (par (a) (color (rbt a)) (rbt a)))
(assert (par (a) (forall ((c color)) (= (paint a c (LeafRB a)) (LeafRB a)))))
(assert (par (a) (forall ((c color) (l (rbt a)) (x a) (d color) (r (rbt a))) (= (paint a c (NodeRB a l (Pair a color x d) r)) (NodeRB a l (Pair a color x c) r)))))
(declare-fun invc (par (a) ((rbt a)) Bool))
(assert (par (a) (invc a (LeafRB a))))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (invc a (NodeRB a l (Pair a color x c) r))
  (and (=> (= c Red) (and (= (color_of a l) Black) (= (color_of a r) Black))) (invc a l) (invc a r))))))
(declare-fun bh (par (a) ((rbt a)) nat))
(assert (par (a) (= (bh a (LeafRB a)) zero)))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (bh a (NodeRB a l (Pair a color x c) r))
  (ite (= c Black) (s (bh a l)) (bh a l))))))
(declare-fun invh (par (a) ((rbt a)) Bool))
(assert (par (a) (invh a (LeafRB a))))
(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (invh a (NodeRB a l (Pair a color x c) r))
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
(assert (par (a) (forall ((x a)) (= (insRB a x (LeafRB a)) (R a (LeafRB a) x (LeafRB a))))))
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
;(assert (par (a) (forall ((l (rbt a)) (x a) (c color) (r (rbt a))) (= (split_minRB a (NodeRB a l (Pair a color x c) r))
;  (ite (= l (LeafRB a)) (Pair a (rbt a) x r) (let ((xl (split_minRB a l)))
;    (Pair a (rbt a) (Pair_0 a (rbt a) xl) (ite (= (color_of a l) Black) (baldL a (Pair_1 a (rbt a) xl) x r) (R a (Pair_1 a (rbt a) xl) x r)))))))))
(declare-fun delRB (par (a) (a (rbt a)) (rbt a)))
; TODO this cannot be parsed yet
;(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (c color) (r (rbt a))) (= (delRB a x (NodeRB a l (Pair a color y c) r))
;  (match (cmp a x y) ((LT (let ((ll (delRB a x l))) (ite (and (distinct l (LeafRB a)) (= (color_of a l) Black)) (baldL a ll y r) (R a ll y r))))
;                      (EQ (ite (= r (LeafRB a)) l (let ((ar (split_minRB a r))) (ite (= (color_of a r) Black)
;                        (baldR a l (Pair_0 a (rbt a) ar) (Pair_1 a (rbt a) ar)) (R a l (Pair_0 a (rbt a) ar) (Pair_1 a (rbt a) ar))))))
;                      (GT (let ((rr (delRB a x r))) (ite (and (distinct r (LeafRB a)) (= (color_of a r) Black)) (baldR a l y rr) (R a l y rr))))))))))
(declare-fun deleteRB (par (a) (a (rbt a)) (rbt a)))
(assert (par (a) (forall ((x a) (t (rbt a))) (= (deleteRB a x t) (paint a Black (delRB a x t))))))
;(declare-fun bhs ((rbt a)) set)
(declare-fun joinRB (par (a) ((rbt a) (rbt a)) (rbt a)))
; TODO not well-defined
;(assert (par (a) (forall ((t (rbt a))) (= (joinRB a t (LeafRB a)) t))))
;(assert (par (a) (forall ((t (rbt a))) (= (joinRB a (LeafRB a) t) t))))
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
;(assert (par (a) (forall ((x a) (l (rbt a)) (y a) (c color) (r (rbt a))) (= (delRB2 a x (NodeRB a l (Pair a color y c) r))
;  (match (cmp a x y) ((LT (let ((ll (delRB2 a x l))) (ite (and (distinct l (LeafRB a)) (= (color_of a l) Black)) (baldL a ll y r) (R a ll y r))))
;                      (EQ (joinRB a l r))
;                      (GT (let ((rr (delRB2 a x r))) (ite (and (distinct r (LeafRB a)) (= (color_of a r) Black)) (baldR a l y rr) (R a l y rr))))))))))

; AVL trees
(declare-fun ht (par (a) ((tree_ht a)) nat))
(assert (par (a) (= (ht a (Leaf (pair a nat))) zero)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (n nat) (r (tree_ht a))) (= (ht a (Node (pair a nat) l (Pair a nat x n) r)) n))))
(declare-fun node (par (a) ((tree_ht a) a (tree_ht a)) (tree_ht a)))
(assert (par (a) (forall ((l (tree_ht a)) (x a) (r (tree_ht a))) (= (node a l x r) (Node (pair a nat) l (Pair a nat x (s (max (ht a l) (ht a r)))) r)))))
;(declare-fun avl ((tree_ht nat)) Bool)
;(assert (avl (Leaf (pair nat nat))))
;(assert (forall ((l (tree_ht nat)) (a nat) (n nat) (r (tree_ht nat))) (= (avl (NodeHT l a n r))
;  (and (leq nat (- (h l) (h r)) 1) (= n (+ 1 (max (h l) (h r)))) (avl l) (avl r)))))




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
;(assert (forall ((xs (list nat))) (= (len (merge_adj xs)) (div (+ (len xs) 1) 2))))
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
; complete(t) -> complete(insert(a,t))
; complete(r) & complete(treeD(l')) & h(r) = hD(l') -> complete(treeD(node21(l',a,r)))
; 0 < h(r) -> hD(node21(l',a,r)) = max(hD(l'),h(r)) + 1
; split_min(t) = (x,t') & 0 < h(t) & complete(t) -> hD(t') = h(t)
; split_min(t) = (x,t') & complete(t) & 0 < h(t) -> complete(treeD(t'))
; complete(t) -> hD(del(x,t)) = h(t)
; complete(t) -> complete(treeD(del(x,t)))
; complete(t) -> complete(delete(x,t))
; not_T(ts) -> len(join_adj(ts)) < len(ts)
; not_T(ts) -> len(join_adj(ts)) <= len(ts) div 2
; not_T(ts) -> inorder2(join_adj(ts)) = inorder2(ts)
; inorder(join_all(ts)) = inorder2(ts)
; inorder(tree23_of_list(as)) = as
; (!t in trees(ts). complete(t) & h(t) = n) & not_T(ts) -> (!t in trees(join_adj(ts)). complete(t) & h(t) = n + 1)
; (!t in trees(ts). complete(t) & h(t) = n) -> complete(join_all(ts))
; t in trees(leaves(as)) -> complete(t) & h(t) = 0
; complete(tree23_of_list(as))
; not_T(ts) -> T_join_adj(ts) <= len(ts) div 2
; T_tree23_of_list(as) <= 3 * |as| + 4
; 
; red-black trees:
; invc(t) & invh(t) -> h(t) <= 2 * bh(t) + (if color(t) = Black then 0 else 1)
; invc(t) & invh(t) -> 2^bh(t) <= |t|_1
; 2^(h(t)/2) <= 2^bh(t) <= |t|_1
; rbt(t) -> h(t) <= 2 * lg(|t|_1)
; invh(l) & invh(r) & invc2(l) & invc(r) & bh(l) = bh(r) ->
;   invc(baliL(l,a,r)) & invh(baliL(l,a,r)) & bh(baliL(l,a,r)) = bh(l) + 1
; invh(l) & invh(r) & invc(l) & invc2(r) & bh(l) = bh(r) ->
;   invc(baliR(l,a,r)) & invh(baliR(l,a,r)) & bh(baliR(l,a,r)) = bh(l) + 1
; invc(t) & invh(t) -> invc2(ins(x,t)) & (color(t) = Black -> invc(ins(x,t))) & invh(ins(x,t)) & bh(ins(x,t)) = bh(t)
; rbt(t) -> rbt(insert(x,t))
; split_min(t) = (x,t') & t != <> & invh(t) & invc(t) -> invh(t') & (color(t) = Red -> bh(t') = bh(t) & invc(t')) &
;   (color(t) = Black -> bh(t') = bh(t) - 1 & invc2(t'))
; invh(t) & invc(t) & t' = del(x,t) -> invh(t') & (color(t) = Red -> bh(t') = bh(t) & invc(t')) &
;   (color(t) = Black -> bh(t') = bh(t) - 1 & invc2(t'))
; rbt(t) -> rbt(delete(x,t))
; invh(l) & invh(r) & bh(l) + 1 = bh(r) & invc2(l) & invc(r) & t' = baldL(l,a,r) ->
;   invh(t') & bh(t') = bh(r) & invc2(t') & (color(r) = Black -> invc(t'))
; invh(l) & invh(r) & bh(l) = bh(r) + 1 & invc(l) & invc2(r) & t' = baldR(l,a,r) ->
;   invh(t') & bh(t') = bh(l) & invc2(t') & (color(l) = Black -> invc(t'))
; invh(l) & invh(r) & bh(l) = bh(r) & invc(l) & invc(r) & t' = join(l,r) ->
;   invh(t') & bh(t') = bh(l) & invc2(t') & (color(l) = Black & color(r) = Black -> invc(t'))
; invc(t) & invh(t) -> h(t) <= 2 * lg(|t|_1) + 2
; invh(t) <-> bhs(t) = { bh(t) }
; inorder(rbt_of_list(as)) = as
; rbt(rbt_of_list(as))
; 
; AVL trees:
; avl(t) -> fib(h(t) + 2) <= |t|_1
; ((1 + sqrt(5))/2)^n <= fib(n + 2)
; avl(t) -> h(t) <= 1 / lg((1 + sqrt(5))/2) * lg(|t|_1)
; avl(t) -> avl(insert(x,t)) & h(insert(x,t)) in { h(t), h(t) + 1 }
; avl(l) & avl(r) & h(r) - 1 <= h(l) & h(l) <= h(r) + 2 -> avl(balL(l,a,r))
; avl(l) & avl(r) * h(l) - 1 <= h(r) & h(r) <= h(l) + 2 -> avl(balR(l,a,r))
; avl(t) & t != <> -> avl(fst(split_max(t))) & h(t) in { h(fst(split_max(t))), h(fst(split_max(t))) + 1 }
; avl(t) & t' = delete(x,t) -> avl(t') & h(t) in { h(t'), h(t') + 1 }
; avl(t) & h(t) = n -> 2^(n div 2) <= |t|_1
; avl(t) -> h(t) <= 2 * lg(|t|_1)
; avl0(fibt(n))
; |fibt(n)|_1 = fib(n + 2)
; avl(t) -> |fibt(h(t))|_1 <= |t|_1
; acomplete(t) -> avl0(t)
; inorder(avl_of_list(as)) = as
; avl(avl_of_list(as))
; avl(t) & t' = insert(x,t) -> avl(t') & h(t') = h(t) + if incr(t,t') then 1 else 0
; avl(t) & t' = delete(x,t) -> avl(t') & h(t) = h(t') + if decr(t,t') then 1 else 0
; split_max(t) = (t',a) & avl(t) & t != <> -> avl(t') & h(t) = h(t') + if decr(t,t') then 1 else 0
; avl(t) -> avl_ht(debal(t))
; avl(t) -> debal2(t) = debal(t)
; 
; split_min(t) = (m,t') & t != <> -> m in set_tree(t) & set_tree(t) = {m} U set_tree(t')
; split_min(t) = (m,t') & bst(t) & t != <> -> bst(t') & (!x in set_tree(t').m < x)
; split_min(t) = (m,t') & inv(t) & t != <> -> inv(t')
; set_tree(join2(l,r)) = set_tree(l) U set_tree(r)
; bst(l) & bst(r) & (!x in set_tree(l).!y in set_tree(r). x < y) -> bst(join2(l,r))
; inv(l) & inv(r) -> inv(join2(l,r))
; split(t,x) = (l,b,r) & bst(t) ->
;   set_tree(l) = { a in set_tree(t) | a < x } & set_tree(r) = { a in set_tree(t) | x < a } & b = (x in set_tree(t)) & bst(l) & bst(r)
; split(t,x) = (l,b,r) & inv(t) -> inv(l) & inv(r)
; (maybe "bst(t1) & "?) bst(t2) -> set_tree(union(t1,t2)) = set_tree(t1) U set_tree(t2)
; bst(t1) & bst(t2) -> bst(union(t1,t2))
; inv(t1) & inv(t2) -> inv(union(t1,t2))
; bst(t1) & bst(t2) -> set_tree(inter(t1,t2)) = set_tree(t1) /cap set_tree(t2)
; bst(t1) & bst(t2) -> bst(inter(t1,t2))
; inv(t1) & inv(t2) -> inv(inter(t1,t2))
; bst(t1) & bst(t2) -> set_tree(diff(t1,t2)) = set_tree(t1) - set_tree(t2)
; bst(t1) & bst(t2) -> bst(diff(t1,t2))
; inv(t1) & inv(t2) -> inv(diff(t1,t2))
; invc(l) & invc(r) & invh(l) & invh(r) & bh(l) <= bh(r) ->
;   invc2(joinL(l,x,r)) & (bh(l) != bh(r) & color(r) = Black -> invc(joinL(l,x,r))) & invh(joinL(l,x,r)) & bh(joinL(l,x,r)) = bh(r)
; bh(l) < bh(r) -> set_tree(joinL(l,x,r)) = set_tree(l) U {x} U set_tree(r)
; bst(<l,(a,n),r>) & bh(l) <= bh(r) -> bst(joinL(l,a,r))
; bst(t1) & bst(t2) -> set_tree(diff1(t1,t2)) = set_tree(t1) - set_tree(t2)
; 
; Braun-trees:
; acomplete(l) & acomplete(r) & |l|=|r|+1 -> acomplete(<l,x,r>)
; braun(t) -> acomplete(t)
; list(t) = map(lookup1(t)) [1..<|t|+1]
; braun(<l,x,r>) & n in {1..|<l,x,r>|} & 1 < n -> (odd(n) -> n div 2 in {1..|r|}) & (even(n) -> n div 2 in {1..|l|})
; |list(t)|=|t|
; braun(t) & i < |t| -> list(t!i) = lookup1(t,(i+1))
; n < |xs| + |ys| & |ys| <= |xs| & |xs| <= |ys| + 1 -> splice(xs,ys) ! n = (if even(n) then xs else ys) ! (n div 2)
; braun(t) -> list(t) = map(lookup1(t)) [1..<|t|+1]
; xs = ys <-> |xs| = |ys| & (!i<|xs|. xs ! i = ys ! i)
; braun(t) & n in {1..|t|} -> |update1(n,x,t)| = |t|
; braun(t) & n in {1..|t|} -> braun(update1(n,x,t))
; braun(t) & n in {1..|t|} -> lookup1(update1(n,x,t),m) = if n = m then x else lookup1(t,m)
; braun(t) & n in {1..|t|} -> list(update1(n,x,t)) = (list(t))[n-1 := x]
; braun(t) -> |update1(|t|+1,x,t)| = |t| + 1
; braun(t) -> braun(update1(|t|+1,x,t))
; braun(t) -> list(update1(|t|+1,x,t)) = list(t) @ [x]
; braun(t) -> |adds(xs,|t|,t)| = |t| + |xs| & braun(adds(xs,|t|,t))
; braun(t) -> list(adds(xs,|t|,t)) = list(t @ xs)
; |ys| <= |xs| -> splice(xs @ [x],ys) = splice(xs,ys @ [x])
; |xs| <= |ys| + 1 -> splice(xs,ys @ [y]) = splice(xs,ys) @ [y]
; braun(t) -> braun(del_hi(|t|,t))
; braun(t) -> list(del_hi(|t|,t)) = butlast(list(t))
; braun(t) -> braun(add_lo(x,t))
; braun(t) -> list(add_lo(a,t)) = a # list(t)
; braun(<l,x,r>) -> braun(merge(l,r))
; braun(<l,x,r>) -> list(merge(l,r)) = splice(list(l),list(r))
; braun(t) -> braun(del_lo(t))
; braun(t) -> list(del_lo(t)) = tl(list(t))
; braun(t) -> size_fast(t) = |t|
; braun(t) & |t| in {n,n+1} -> diff(t,n) = |t| - n
; list(braun_of(x,n)) = replicate(n,x)
; braun(braun_of(x,n))
; braun2_of(x,n) = (s,t) -> list(s) = replicate(n,x) & list(t) = replicate(n + 1, x)
; braun2_of(x,n) = (s,t) -> |s| = n & |t| = n + 1 & braun(s) & braun(t)
; take_nths(i,k,drop(j,xs)) = take_nths(i + j,k,xs)
; take_nths(0,0,xs) = xs
; splice(take_nths(0,1,xs),take_nths(1,1,xs)) = xs
; take_nths(i,m,take_nths(j,n,xs)) = take_nths(i * 2^n + j, m + n, xs)
; take_nths(i,k,xs) = [] <-> |xs| <= i
; i < |xs| -> hd(take_nths(i,k,xs)) = xs ! i
; |xs| = |ys| | |xs| = |ys| + 1 -> take_nths(0,1,splice(xs,ys)) = xs & take_nths(1,1,splice(xs,ys)) = ys
; |take_nths(0,1,xs)| = |take_nths(1,1,xs)| | |take_nths(0,1,xs)| = |take_nths(1,1,xs)| + 1
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
