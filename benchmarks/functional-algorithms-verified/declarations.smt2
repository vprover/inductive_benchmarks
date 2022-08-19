;(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list (par (a) ((Nil) (Cons (Cons_0 a) (Cons_1 (list a))))))
;(declare-datatype bool_list ((BNil) (BCons (BCons_0 Bool) (BCons_1 bool_list))))
;(declare-datatype lists ((Nils) (Conss (Conss_0 list) (Conss_1 lists))))
(define-sort lists (a) (list (list a)))
(declare-datatype option (par (a) ((None) (Some (Some_0 a)))))
(declare-datatype tree (par (a) ((Leaf) (Node (Node_0 (tree a)) (Node_1 a) (Node_2 (tree a))))))
;(declare-datatype ival ((Ival (Ival_0 Int) (Ival_1 Int))))
;(declare-datatype itree ((ILeaf) (INode (INode_0 itree) (INode_1 ival) (INode_2 Int) (INode_3 itree))))
(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
(define-sort itree (a) (tree (pair a Int)))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype tree23 (par (a) ((Leaf23) (Node2 (Node2_0 (tree23 a)) (Node2_1 a) (Node2_2 (tree23 a))) (Node3 (Node3_0 (tree23 a)) (Node3_1 a) (Node3_2 (tree23 a)) (Node3_3 a) (Node3_4 (tree23 a))))))
(declare-datatype upI (par (a) ((TI (TI_0 (tree23 a))) (OF (OF_0 (tree23 a)) (OF_1 a) (OF_2 (tree23 a))))))
(declare-datatype upD (par (a) ((TD (TD_0 (tree23 a))) (UF (UF_0 (tree23 a))))))
(declare-datatype tree23s (par (a) ((T (T_0 (tree23 a))) (TTs (TTs_0 (tree23 a)) (TTs_1 a) (TTs_2 (tree23s a))))))
(declare-datatype color ((Red) (Black)))
(declare-datatype bal ((Lh) (Bal) (Rh)))
;(declare-datatype tree4 ((Leaf4) (Lh (Lh_0 tree4) (Lh_1 Int) (Lh_2 tree4)) (Bal (Bal_0 tree4) (Bal_1 Int) (Bal_2 tree4)) (Rh (Rh_0 tree4) (Rh_1 Int) (Rh_2 tree4))))
;(declare-datatype trie ((Nd Bool ('a -> 'a trie option))))
(declare-datatype trie ((Lf) (Nd (Nd_0 Bool) (Nd_1 trie) (Nd_2 trie))))
(declare-datatype trieP ((LfP) (NdP (NdP_0 (list Bool)) (NdP_1 Bool) (NdP_2 trieP) (NdP_3 trieP))))
(declare-datatype rbt (par (a) ((LeafRB) (NodeRB (NodeR_0 (rbt a)) (NodeR_1 (pair a color)) (NodeR_2 (rbt a))))))
;(declare-datatype tree_ht ((LeafHT) (NodeHT (NodeHT_0 tree_ht) (NodeHT_1 Int) (NodeHT_2 Int) (NodeHT_3 tree_ht))))
(define-sort tree_ht (a) (tree (pair a Int)))

; pairs -- delete these once a polymorphic tuple can be used instead
;(declare-datatype int_tree_pair ((itp (itp_0 Int) (itp_1 (tree Int)))))
;(declare-datatype tree_list_pair ((tlp (tlp_0 (tree Int)) (tlp_1 list))))
;(declare-datatype int_upD_pair ((iupDp (iupDp_0 Int) (iupDp_1 upD))))
;(declare-datatype int_rbt_pair ((irp (irp_0 Int) (irp_1 rbt))))

; parametric types for future use
;(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
;(declare-fun first ((pair Int Int)) Int)
;(assert (forall ((x Int) (y Int)) (= (first (Pair x y)) x)))
;(declare-fun second ((pair Int Int)) Int)
;(assert (forall ((x Int) (y Int)) (= (second (Pair x y)) y)))

; auxiliary functions for sets and multisets -- remove these once a higher-order setting is used
(declare-fun in_set (Int (list Int)) Bool)
(assert (forall ((x Int)) (not (in_set x (Nil Int)))))
(assert (forall ((x Int) (y Int) (ys (list Int))) (= (in_set x (Cons Int y ys)) (or (= x y) (in_set x ys)))))
(declare-fun in_set_tree (Int (tree Int)) Bool)
(assert (forall ((x Int)) (not (in_set_tree x (Leaf Int)))))
(assert (forall ((x Int) (l (tree Int)) (a Int) (r (tree Int))) (= (in_set_tree x (Node Int l a r)) (or (= x a) (in_set_tree x l) (in_set_tree x r)))))
(declare-fun count (Int (list Int)) Int)
(assert (forall ((x Int)) (= (count x (Nil Int)) 1)))
(assert (forall ((x Int) (y Int) (ys (list Int))) (= (count x (Cons Int y ys)) (ite (= x y) (+ 1 (count x ys)) (count x ys)))))
(declare-fun same_set ((list Int) (list Int)) Bool)
(assert (forall ((xs (list Int)) (ys (list Int))) (= (same_set xs ys) (forall ((x Int)) (= (in_set x xs) (in_set x ys))))))
(declare-fun same_mset ((list Int) (list Int)) Bool)
(assert (forall ((xs (list Int)) (ys (list Int))) (= (same_mset xs ys) (forall ((x Int)) (= (count x xs) (count x ys))))))

; filter and map functions -- remove these once a higher-order setting is used
(declare-fun filter_less (Int (list Int)) (list Int))
(assert (forall ((x Int)) (= (filter_less x (Nil Int)) (Nil Int))))
(assert (forall ((x Int) (y Int) (ys (list Int))) (= (filter_less x (Cons Int y ys)) (ite (< y x) (Cons Int y (filter_less x ys)) (filter_less x ys)))))
(declare-fun filter_ge (Int (list Int)) (list Int))
(assert (forall ((x Int)) (= (filter_ge x (Nil Int)) (Nil Int))))
(assert (forall ((x Int) (y Int) (ys (list Int))) (= (filter_ge x (Cons Int y ys)) (ite (>= y x) (Cons Int y (filter_ge x ys)) (filter_ge x ys)))))
(declare-fun map_list_lists ((list Int)) (lists Int))
(assert (= (map_list_lists (Nil Int)) (Nil (list Int))))
(assert (forall ((x Int) (xs (list Int))) (= (map_list_lists (Cons Int x xs)) (Cons (list Int) (Cons Int x (Nil Int)) (map_list_lists xs)))))

; functions
(declare-fun pow (Int Int) Int)
(assert (forall ((x Int)) (= (pow x 0) 1)))
(assert (forall ((x Int) (e Int)) (=> (<= 1 e) (= (pow x e) (* x (pow x (- e 1)))))))
(declare-fun append ((list Int) (list Int)) (list Int))
(assert (forall ((ys (list Int))) (= (append (Nil Int) ys) ys)))
(assert (forall ((x Int) (xs (list Int)) (ys (list Int))) (= (append (Cons Int x xs) ys) (Cons Int x (append xs ys)))))
(declare-fun rev ((list Int)) (list Int))
(assert (= (rev (Nil Int)) (Nil Int)))
(assert (forall ((x Int) (xs (list Int))) (= (rev (Cons Int x xs)) (append (rev xs) (Cons Int x (Nil Int))))))
(declare-fun itrev ((list Int) (list Int)) (list Int))
(assert (forall ((ys (list Int))) (= (itrev (Nil Int) ys) ys)))
(assert (forall ((x Int) (xs (list Int)) (ys (list Int))) (= (itrev (Cons Int x xs) ys) (itrev xs (Cons Int x ys)))))
(declare-fun T_append ((list Int) (list Int)) Int)
(assert (forall ((ys (list Int))) (= (T_append (Nil Int) ys) 1)))
(assert (forall ((x Int) (xs (list Int)) (ys (list Int))) (= (T_append (Cons Int x xs) ys) (+ (T_append xs ys) 1))))
(declare-fun T_rev ((list Int)) Int)
(assert (= (T_rev (Nil Int)) 1))
(assert (forall ((x Int) (xs (list Int))) (= (T_rev (Cons Int x xs)) (+ (T_rev xs) (T_append (rev xs) (Cons Int x (Nil Int))) 1))))
(declare-fun T_itrev ((list Int) (list Int)) Int)
(assert (forall ((ys (list Int))) (= (T_itrev (Nil Int) ys) 1)))
(assert (forall ((x Int) (xs (list Int)) (ys (list Int))) (= (T_itrev (Cons Int x xs) ys) (+ (T_itrev xs (Cons Int x ys)) 1))))
(declare-fun sorted ((list Int)) Bool)
(assert (sorted (Nil Int)))
(assert (forall ((x Int) (xs (list Int))) (= (sorted (Cons Int x xs)) (and (forall ((y Int)) (=> (in_set y xs) (<= x y))) (sorted xs)))))
(declare-fun insort (Int (list Int)) (list Int))
(assert (forall ((x Int)) (= (insort x (Nil Int)) (Cons Int x (Nil Int)))))
(assert (forall ((x Int) (y Int) (ys (list Int))) (= (insort x (Cons Int y ys)) (ite (<= x y) (Cons Int x (Cons Int y ys)) (Cons Int y (insort x ys))))))
(declare-fun isort ((list Int)) (list Int))
(assert (= (isort (Nil Int)) (Nil Int)))
(assert (forall ((x Int) (xs (list Int))) (= (isort (Cons Int x xs)) (insort x (isort xs)))))
(declare-fun T_insort (Int (list Int)) Int)
(assert (forall ((x Int)) (= (T_insort x (Nil Int)) 1)))
(assert (forall ((x Int) (y Int) (ys (list Int))) (= (T_insort x (Cons Int y ys)) (+ (ite (<= x y) 0 (T_insort x ys)) 1))))
(declare-fun T_isort ((list Int)) Int)
(assert (= (T_isort (Nil Int)) 1))
(assert (forall ((x Int) (xs (list Int))) (= (T_isort (Cons Int x xs)) (+ (T_isort xs) (T_insort x (isort xs)) 1))))
(declare-fun quicksort ((list Int)) (list Int))
(assert (= (quicksort (Nil Int)) (Nil Int)))
(assert (forall ((x Int) (xs (list Int))) (= (quicksort (Cons Int x xs))
  (append (quicksort (filter_less x xs)) (append (Cons Int x (Nil Int)) (quicksort (filter_ge x xs)))))))
(declare-fun quicksort2 ((list Int) (list Int)) (list Int))
(assert (forall ((ys (list Int))) (= (quicksort2 (Nil Int) ys) ys)))
(assert (forall ((x Int) (xs (list Int)) (ys (list Int))) (= (quicksort2 (Cons Int x xs) ys)
  (quicksort2 (filter_less x xs) (Cons Int x (quicksort2 (filter_ge x xs) ys))))))
;(declare-fun partition3 (Int (list Int)) tuple((list Int),(list Int),(list Int)))
;(declare-fun quicksort3 ((list Int)) (list Int))
(declare-fun len ((list Int)) Int)
(assert (= (len (Nil Int)) 0))
(assert (forall ((x Int) (xs (list Int))) (= (len (Cons Int x xs)) (+ (len xs) 1))))
(declare-fun T_quicksort ((list Int)) Int)
(assert (= (T_quicksort (Nil Int)) 1))
(assert (forall ((x Int) (xs (list Int))) (= (T_quicksort (Cons Int x xs))
  (+ (T_quicksort (filter_less x xs)) (T_quicksort (filter_ge x xs)) (* 2 (len xs)) 1))))
(declare-fun merge ((list Int) (list Int)) (list Int))
(assert (forall ((ys (list Int))) (= (merge (Nil Int) ys) ys)))
(assert (forall ((xs (list Int))) (= (merge xs (Nil Int)) xs)))
(assert (forall ((x Int) (xs (list Int)) (y Int) (ys (list Int))) (= (merge (Cons Int x xs) (Cons Int y ys))
  (ite (<= x y) (Cons Int x (merge xs (Cons Int y ys))) (Cons Int y (merge (Cons Int x xs) ys))))))
(declare-fun take (Int (list Int)) (list Int))
(assert (forall ((n Int)) (= (take n (Nil Int)) (Nil Int))))
(assert (forall ((n Int) (x Int) (xs (list Int))) (= (take n (Cons Int x xs)) (ite (> n 0) (Cons Int x (take (- n 1) xs)) (Nil Int)))))
(declare-fun drop (Int (list Int)) (list Int))
(assert (forall ((n Int)) (= (drop n (Nil Int)) (Nil Int))))
(assert (forall ((n Int) (x Int) (xs (list Int))) (= (drop n (Cons Int x xs)) (ite (> n 0) (drop (- n 1) xs) xs))))
(declare-fun msort ((list Int)) (list Int))
(assert (forall ((xs (list Int))) (= (msort xs) (let ((n (len xs))) (ite (<= n 1) xs
  (merge (msort (take (div n 2) xs)) (msort (drop (div n 2) xs))))))))
(declare-fun C_merge ((list Int) (list Int)) Int)
(assert (forall ((ys (list Int))) (= (C_merge (Nil Int) ys) 0)))
(assert (forall ((xs (list Int))) (= (C_merge xs (Nil Int)) 0)))
(assert (forall ((x Int) (xs (list Int)) (y Int) (ys (list Int))) (= (C_merge (Cons Int x xs) (Cons Int y ys))
  (+ 1 (ite (<= x y) (C_merge xs (Cons Int y ys)) (C_merge (Cons Int x xs) ys))))))
(declare-fun C_msort ((list Int)) Int)
(assert (forall ((xs (list Int))) (= (C_msort xs) (let ((n (len xs))) (let ((ys (take (div n 2) xs)) (zs (drop (div n 2) xs)))
  (ite (<= n 1) 0 (+ (C_msort ys) (C_msort zs) (C_merge (msort ys) (msort zs)))))))))
(declare-fun msort2 ((list Int)) (list Int))
(declare-fun merge_adj ((lists Int)) (lists Int))
(assert (= (merge_adj (Nil (list Int))) (Nil (list Int))))
(assert (forall ((xs (list Int))) (= (merge_adj (Cons (list Int) xs (Nil (list Int)))) (Cons (list Int) xs (Nil (list Int))))))
(assert (forall ((xs (list Int)) (ys (list Int)) (zss (lists Int))) (= (merge_adj (Cons (list Int) xs (Cons (list Int) ys zss))) (Cons (list Int) (merge xs ys) (merge_adj zss)))))
(declare-fun merge_all ((lists Int)) (list Int))
(assert (= (merge_all (Nil (list Int))) (Nil Int)))
(assert (forall ((xs (list Int))) (= (merge_all (Cons (list Int) xs (Nil (list Int)))) xs)))
(assert (forall ((xss (lists Int))) (= (merge_all xss) (merge_all (merge_adj xss)))))
(declare-fun msort_bu ((list Int)) (list Int))
(assert (forall ((xs (list Int))) (= (msort_bu xs) (merge_all (map_list_lists xs)))))
(declare-fun C_merge_adj ((lists Int)) Int)
(assert (= (C_merge_adj (Nil (list Int))) 0))
(assert (forall ((xs (list Int))) (= (C_merge_adj (Cons (list Int) xs (Nil (list Int)))) 0)))
(assert (forall ((xs (list Int)) (ys (list Int)) (zss (lists Int))) (= (C_merge_adj (Cons (list Int) xs (Cons (list Int) ys zss)))
  (+ (C_merge xs ys) (C_merge_adj zss)))))
(declare-fun C_merge_all ((lists Int)) Int)
(assert (= (C_merge_all (Nil (list Int))) 0))
(assert (forall ((xs (list Int))) (= (C_merge_all (Cons (list Int) xs (Nil (list Int)))) 0)))
(assert (forall ((xss (lists Int))) (= (C_merge_all xss) (+ (C_merge_adj xss) (C_merge_all (merge_adj xss))))))
(declare-fun C_msort_bu ((list Int)) Int)
(assert (forall ((xs (list Int))) (= (C_msort_bu xs) (C_merge_all (map_list_lists xs)))))
(declare-fun even (Int) Bool)
(assert (forall ((n Int)) (= (even n) (= (div n 2) 0))))
(declare-fun odd (Int) Bool)
(assert (forall ((n Int)) (= (odd n) (= (div n 2) 1))))
(declare-fun runs ((list Int)) (lists Int))
(assert (= (runs (Nil Int)) (Nil (list Int))))
(assert (forall ((x Int)) (= (runs (Cons Int x (Nil Int))) (Cons (list Int) (Cons Int x (Nil Int)) (Nil (list Int))))))
;(assert (forall ((a Int) (b Int) (xs (list Int))) (= (runs (Cons Int a (Cons Int b xs)))
;  (ite (< b a) (desc b (Cons Int a (Nil Int)) xs) (asc b ((# a) xs))))))
;(declare-fun asc (Int (=> (list Int) (list Int)) (list Int)) (lists Int))
;(assert (forall ((a Int) (xs (list Int))) (= (asc a xs (Nil Int)) (Cons (list Int) xs (Cons (list Int) (Cons Int a (Nil Int)) (Nil (list Int)))))))
;(assert (forall ((a Int) (xs (list Int)) (b Int) (ys (list Int))) (= (asc a xs (Cons Int b ys))
;  (ite (not (< b a)) (asc b (xs . (#) a) ys) (Cons (list Int) (xs (Cons Int a (Nil Int))) (runs (Cons Int b ys)))))))
(declare-fun desc (Int (list Int) (list Int)) (lists Int))
(assert (forall ((a Int) (xs (list Int))) (= (desc a xs (Nil Int)) (Cons (list Int) (Cons Int a xs) (Nil (list Int))))))
(assert (forall ((a Int) (xs (list Int)) (b Int) (ys (list Int))) (= (desc a xs (Cons Int b ys))
  (ite (< b a) (desc b (Cons Int a xs) ys) (Cons (list Int) (Cons Int a xs) (runs (Cons Int b ys)))))))
(declare-fun nmsort ((list Int)) (list Int))
(assert (forall ((xs (list Int))) (= (nmsort xs) (merge_all (runs xs)))))
;(declare-fun Ball (Int (=> Int Bool)) Bool)
(declare-fun C_runs ((list Int)) Int)
(declare-fun C_asc (Int (list Int)) Int)
(assert (forall ((x Int)) (= (C_asc x (Nil Int)) 0)))
(assert (forall ((a Int) (b Int) (bs (list Int))) (= (C_asc a (Cons Int b bs))
  (+ 1 (ite (not (< b a)) (C_asc b bs) (C_runs (Cons Int b bs)))))))
(declare-fun C_desc (Int (list Int)) Int)
(assert (forall ((x Int)) (= (C_desc x (Nil Int)) 0)))
(assert (forall ((a Int) (b Int) (bs (list Int))) (= (C_desc a (Cons Int b bs))
  (+ 1 (ite (< b a) (C_desc b bs) (C_runs (Cons Int b bs)))))))
(assert (= (C_runs (Nil Int)) 0))
(assert (forall ((x Int)) (= (C_runs (Cons Int x (Nil Int))) 0)))
(assert (forall ((a Int) (b Int) (xs (list Int))) (= (C_runs (Cons Int a (Cons Int b xs)))
  (+ 1 (ite (< b a) (C_desc b xs) (C_asc b xs))))))
(declare-fun C_nmsort ((list Int)) Int)
(assert (forall ((xs (list Int))) (= (C_nmsort xs) (+ (C_runs xs) (C_merge_all (runs xs))))))
(declare-fun concat ((lists Int)) (list Int))
(assert (= (concat (Nil (list Int))) (Nil Int)))
(assert (forall ((xs (list Int)) (xss (lists Int))) (= (concat (Cons (list Int) xs xss)) (append xs (concat xss)))))
(declare-fun lg (Int) Real)
(declare-fun ceil (Real) Int)
(declare-fun floor (Real) Int)
;(declare-fun filter ((=> Int Int) (list Int)) (list Int))
;(declare-fun sort_key ((=> Int Int) (list Int)) (list Int))
;(declare-fun insort_key ((=> Int Int) Int (list Int)) (list Int))
;(declare-fun isort_key ((=> Int Int) (list Int)) (list Int))
; already declared
;(declare-fun select (Int (list Int)) Int)
;(declare-fun minus (Int Int) Int)
;(declare-fun select0 ((list Int)) Int)
;(declare-fun select1 ((list Int)) Int)
; already declared
;(declare-fun distinct ((list Int)) Bool)
(declare-fun median ((list Int)) Int)
(declare-fun chop (Int (list Int)) (lists Int))
(declare-fun min (Int Int) Int)
(declare-fun max (Int Int) Int)

(declare-fun inorder ((tree Int)) (list Int))
(assert (= (inorder (Leaf Int)) (Nil Int)))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (inorder (Node Int l a r)) (append (inorder l) (append (Cons Int a (Nil Int)) (inorder r))))))
(declare-fun inorder2 ((tree Int) (list Int)) (list Int))
(assert (forall ((xs (list Int))) (= (inorder2 (Leaf Int) xs) xs)))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int)) (xs (list Int))) (= (inorder2 (Node Int l a r) xs) (inorder2 l (Cons Int a (inorder2 r xs))))))
(declare-fun preorder ((tree Int)) (list Int))
(assert (= (preorder (Leaf Int)) (Nil Int)))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (preorder (Node Int l a r)) (Cons Int a (append (preorder l) (preorder r))))))
(declare-fun size ((tree Int)) Int)
(assert (= (size (Leaf Int)) 0))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (size (Node Int l a r)) (+ (size l) (size r) 1))))
(declare-fun size1 ((tree Int)) Int)
(assert (= (size1 (Leaf Int)) 1))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (size1 (Node Int l a r)) (+ (size1 l) (size1 r)))))
(declare-fun h ((tree Int)) Int)
(assert (= (h (Leaf Int)) 0))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (h (Node Int l a r)) (+ (max (h l) (h r)) 1))))
(declare-fun mh ((tree Int)) Int)
(assert (= (mh (Leaf Int)) 0))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (mh (Node Int l a r)) (+ (min (mh l) (mh r)) 1))))
(declare-fun complete ((tree Int)) Bool)
(assert (complete (Leaf Int)))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (complete (Node Int l a r)) (and (= (h l) (h r)) (complete l) (complete r)))))
(declare-fun acomplete ((tree Int)) Bool)
(assert (forall ((t (tree Int))) (= (acomplete t) (<= (- (h t) (mh t)) 1))))
(declare-fun balance (Int (list Int)) (pair (tree Int) (list Int)))
(assert (forall ((n Int) (xs (list Int))) (= (balance n xs) (ite (= n 0) (Pair (tree Int) (list Int) (Leaf Int) xs)
  (let ((m (div n 2))) (let ((lys (balance m xs))) (let ((rzs (balance (- n (+ 1 m)) (Cons_1 Int (Pair_1 (tree Int) (list Int) lys)))))
    (Pair (tree Int) (list Int) (Node Int (Pair_0 (tree Int) (list Int) lys) (Cons_0 Int (Pair_1 (tree Int) (list Int) lys)) (Pair_0 (tree Int) (list Int) rzs)) (Pair_1 (tree Int) (list Int) rzs)))))))))
(declare-fun bal_list (Int (list Int)) (tree Int))
(assert (forall ((n Int) (xs (list Int))) (= (bal_list n xs) (Pair_0 (tree Int) (list Int) (balance n xs)))))
(declare-fun balance_list ((list Int)) (tree Int))
(assert (forall ((xs (list Int))) (= (balance_list xs) (bal_list (len xs) xs))))
(declare-fun bal_tree (Int (tree Int)) (tree Int))
(assert (forall ((n Int) (t (tree Int))) (= (bal_tree n t) (bal_list n (inorder t)))))
(declare-fun balance_tree ((tree Int)) (tree Int))
(assert (forall ((t (tree Int))) (= (balance_tree t) (bal_tree (size t) t))))
(declare-fun bst ((tree Int)) Bool)
(assert (bst (Leaf Int)))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (bst (Node Int l a r))
  (and (forall ((x Int)) (=> (in_set_tree x l) (< x a))) (forall ((x Int)) (=> (in_set_tree x l) (< a x))) (bst l) (bst r)))))
(declare-fun cmp (Int Int) cmp_val)
(assert (forall ((x Int) (y Int)) (= (cmp x y) (ite (< x y) LT (ite (= x y) EQ GT)))))
(declare-fun empty () (tree Int))
(assert (= empty (Leaf Int)))
(declare-fun isin ((tree Int) Int) Bool)
(assert (forall ((x Int)) (not (isin (Leaf Int) x))))
(assert (forall ((x Int) (l (tree Int)) (a Int) (r (tree Int))) (= (isin (Node Int l a r) x)
  (match (cmp x a) ((LT (isin l x)) (EQ true) (GT (isin r x)))))))
(declare-fun insert (Int (tree Int)) (tree Int))
(assert (forall ((x Int)) (= (insert x (Leaf Int)) (Node Int (Leaf Int) x (Leaf Int)))))
(assert (forall ((x Int) (l (tree Int)) (a Int) (r (tree Int))) (= (insert x (Node Int l a r))
  (match (cmp x a) ((LT (Node Int (insert x l) a r))
                    (EQ (Node Int l a r))
                    (GT (Node Int l a (insert x r))))))))
(declare-fun split_min ((tree Int)) (pair Int (tree Int)))
(assert (forall ((l (tree Int)) (a Int) (r (tree Int))) (= (split_min (Node Int l a r))
  (ite (= l (Leaf Int)) (Pair Int (tree Int) a r) (let ((xl (split_min l))) (Pair Int (tree Int) (Pair_0 Int (tree Int) xl) (Node Int (Pair_1 Int (tree Int) xl) a r)))))))
(declare-fun delete (Int (tree Int)) (tree Int))
(assert (forall ((x Int)) (= (delete x (Leaf Int)) (Leaf Int))))
(assert (forall ((x Int) (l (tree Int)) (a Int) (r (tree Int))) (= (delete x (Node Int l a r))
  (match (cmp x a) ((LT (Node Int (delete x l) a r))
                    (EQ (ite (= r (Leaf Int)) l (let ((ar (split_min r))) (Node Int l (Pair_0 Int (tree Int) ar) (Pair_1 Int (tree Int) ar)))))
                    (GT (Node Int l a (delete x r))))))))

(declare-fun join ((tree Int) (tree Int)) (tree Int))
(assert (forall ((t (tree Int))) (= (join t (Leaf Int)) t)))
(assert (forall ((t (tree Int))) (= (join (Leaf Int) t) t)))
(assert (forall ((t1 (tree Int)) (a Int) (t2 (tree Int)) (t3 (tree Int)) (b Int) (t4 (tree Int))) (= (join (Node Int t1 a t2) (Node Int t3 b t4))
  (match (join t2 t3) (((Leaf Int) (Node Int t1 a (Node Int (Leaf Int) b t4))) ((Node Int u2 x u3) (Node Int (Node Int t1 a u2) x (Node Int u3 b t4))))))))
(declare-fun delete2 (Int (tree Int)) (tree Int))
(assert (forall ((x Int)) (= (delete2 x (Leaf Int)) (Leaf Int))))
(assert (forall ((x Int) (l (tree Int)) (a Int) (r (tree Int))) (= (delete2 x (Node Int l a r))
  (match (cmp x a) ((LT (Node Int (delete2 x l) a r))
                    (EQ (join l r))
                    (GT (Node Int l a (delete2 x r))))))))

(declare-fun join0 ((tree Int) (tree Int)) (tree Int))
(assert (forall ((t (tree Int))) (= (join0 t (Leaf Int)) t)))
(assert (forall ((t (tree Int))) (= (join0 (Leaf Int) t) t)))
(assert (forall ((t1 (tree Int)) (a Int) (t2 (tree Int)) (t3 (tree Int)) (b Int) (t4 (tree Int)))
  (= (join0 (Node Int t1 a t2) (Node Int t3 b t4)) (Node Int t1 a (Node Int (join0 t2 t3) b t4)))))

(declare-fun ins_list (Int (list Int)) (list Int))
(assert (forall ((x Int)) (= (ins_list x (Nil Int)) (Cons Int x (Nil Int)))))
(assert (forall ((x Int) (a Int) (xs (list Int))) (= (ins_list x (Cons Int a xs))
  (ite (< x a) (Cons Int x (Cons Int a xs)) (ite (= x a) (Cons Int a xs) (Cons Int a (ins_list x xs)))))))
(declare-fun del_list (Int (list Int)) (list Int))
(assert (forall ((x Int)) (= (del_list x (Nil Int)) (Nil Int))))
(assert (forall ((x Int) (a Int) (xs (list Int))) (= (del_list x (Cons Int a xs))
  (ite (= x a) xs (Cons Int a (del_list x xs))))))

; interval trees
;(declare-fun iisin (itree Int) Bool)
;(assert (forall ((x Int)) (not (iisin ILeaf x))))
;(assert (forall ((l itree) (a Int) (b Int) (r itree) (x Int)) (= (iisin (INode l a b r) x)
;  (match (cmp x a) ((LT (iisin l x)) (EQ true) (GT (iisin r x)))))))

; 2-3 trees
(declare-fun size23 ((tree23 Int)) Int)
(assert (= (size23 (Leaf23 Int)) 0))
(assert (forall ((l (tree23 Int)) (a Int) (r (tree23 Int))) (= (size23 (Node2 Int l a r))
  (+ (size23 l) (size23 r) 1))))
(assert (forall ((l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int)))
  (= (size23 (Node3 Int l a m b r)) (+ (size23 l) (size23 m) (size23 r) 1))))
(declare-fun h23 ((tree23 Int)) Int)
(assert (= (h23 (Leaf23 Int)) 0))
(assert (forall ((l (tree23 Int)) (a Int) (r (tree23 Int))) (= (h23 (Node2 Int l a r))
  (+ (max (h23 l) (h23 r)) 1))))
(assert (forall ((l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int)))
  (= (h23 (Node3 Int l a m b r)) (+ (max (h23 l) (max (h23 m) (h23 r))) 1))))
(declare-fun complete23 ((tree23 Int)) Bool)
(assert (complete23 (Leaf23 Int)))
(assert (forall ((l (tree23 Int)) (a Int) (r (tree23 Int))) (= (complete23 (Node2 Int l a r))
  (and (= (h23 l) (h23 r)) (complete23 l) (complete23 r)))))
(assert (forall ((l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int))) (= (complete23 (Node3 Int l a m b r))
  (and (= (h23 l) (h23 m)) (= (h23 m) (h23 r)) (complete23 l) (complete23 m) (complete23 r)))))
(declare-fun isin23 ((tree23 Int) Int) Bool)
(assert (forall ((x Int)) (not (isin23 (Leaf23 Int) x))))
(assert (forall ((x Int) (l (tree23 Int)) (a Int) (r (tree23 Int))) (= (isin23 (Node2 Int l a r) x)
  (match (cmp x a) ((LT (isin23 l x)) (EQ true) (GT (isin23 r x)))))))
(assert (forall ((x Int) (l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int))) (= (isin23 (Node3 Int l a m b r) x)
  (match (cmp x a) ((LT (isin23 l x)) (EQ true) (GT
  (match (cmp x b) ((LT (isin23 m x)) (EQ true) (GT (isin23 r x))))))))))

(declare-fun inorder23 ((tree23 Int)) (list Int))
(assert (= (inorder23 (Leaf23 Int)) (Nil Int)))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int))) (= (inorder23 (Node2 Int t1 a t2))
  (append (inorder23 t1) (append (Cons Int a (Nil Int)) (inorder23 t2))))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (inorder23 (Node3 Int t1 a t2 b t3))
  (append (inorder23 t1) (append (Cons Int a (Nil Int)) (append (inorder23 t2) (append (Cons Int b (Nil Int)) (inorder23 t3))))))))
(declare-fun treeI ((upI Int)) (tree23 Int))
(assert (forall ((t (tree23 Int))) (= (treeI (TI Int t)) t)))
(assert (forall ((l (tree23 Int)) (a Int) (r (tree23 Int))) (= (treeI (OF Int l a r)) (Node2 Int l a r))))
(declare-fun treeD ((upD Int)) (tree23 Int))
(assert (forall ((t (tree23 Int))) (= (treeD (TD Int t)) t)))
(assert (forall ((t (tree23 Int))) (= (treeD (UF Int t)) t)))
(declare-fun ins (Int (tree23 Int)) (upI Int))
(assert (forall ((x Int)) (= (ins x (Leaf23 Int)) (OF Int (Leaf23 Int) x (Leaf23 Int)))))
(assert (forall ((x Int) (l (tree23 Int)) (a Int) (r (tree23 Int))) (= (ins x (Node2 Int l a r))
  (match (cmp x a) ((LT (match (ins x l) (((TI Int ll) (TI Int (Node2 Int ll a r)))
                                          ((OF Int l1 b l2) (TI Int (Node3 Int l1 b l2 a r))))))
                    (EQ (TI Int (Node2 Int l a r)))
                    (GT (match (ins x r) (((TI Int rr) (TI Int (Node2 Int l a rr)))
                                          ((OF Int r1 b r2) (TI Int (Node3 Int l a r1 b r2)))))))))))
(assert (forall ((x Int) (l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int))) (= (ins x (Node3 Int l a m b r))
  (match (cmp x a) ((LT (match (ins x l) (((TI Int ll) (TI Int (Node3 Int ll a m b r)))
                                          ((OF Int l1 c l2) (OF Int (Node2 Int l1 c l2) a (Node2 Int m b r))))))
                    (EQ (TI Int (Node3 Int l a m b r)))
                    (GT (match (cmp x b) ((LT (match (ins x m) (((TI Int mm) (TI Int (Node3 Int l a mm b r)))
                                                                ((OF Int m1 c m2) (OF Int (Node2 Int l a m1) c (Node2 Int m2 b r))))))
                                          (EQ (TI Int (Node3 Int l a m b r)))
                                          (GT (match (ins x r) (((TI Int rr) (TI Int (Node3 Int l a m b rr)))
                                                                ((OF Int r1 c r2) (OF Int (Node2 Int l a m) b (Node2 Int r1 c r2))))))))))))))
(declare-fun insert23 (Int (tree23 Int)) (tree23 Int))
(assert (forall ((x Int) (t (tree23 Int))) (= (insert23 x t) (treeI (ins x t)))))
(declare-fun hI ((upI Int)) Int)
(assert (forall ((t (tree23 Int))) (= (hI (TI Int t)) (h23 t))))
(assert (forall ((l (tree23 Int)) (a Int) (r (tree23 Int))) (= (hI (OF Int l a r)) (h23 l))))
(declare-fun node21 ((upD Int) Int (tree23 Int)) (upD Int))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int))) (= (node21 (TD Int t1) a t2) (TD Int (Node2 Int t1 a t2)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (node21 (UF Int t1) a (Node2 Int t2 b t3))
  (UF Int (Node3 Int t1 a t2 b t3)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)))
  (= (node21 (UF Int t1) a (Node3 Int t2 b t3 c t4)) (TD Int (Node2 Int (Node2 Int t1 a t2) b (Node2 Int t3 c t4))))))
(declare-fun node22 ((tree23 Int) Int (upD Int)) (upD Int))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int))) (= (node22 t1 a (TD Int t2)) (TD Int (Node2 Int t1 a t2)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (node22 (Node2 Int t1 a t2) b (UF Int t3))
  (UF Int (Node3 Int t1 a t2 b t3)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)))
  (= (node22 (Node3 Int t1 a t2 b t3) c (UF Int t4)) (TD Int (Node2 Int (Node2 Int t1 a t2) b (Node2 Int t3 c t4))))))
(declare-fun node31 ((upD Int) Int (tree23 Int) Int (tree23 Int)) (upD Int))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (node31 (TD Int t1) a t2 b t3)
  (TD Int (Node3 Int t1 a t2 b t3)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)))
  (= (node31 (UF Int t1) a (Node2 Int t2 b t3) c t4) (TD Int (Node2 Int (Node3 Int t1 a t2 b t3) c t4)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)) (d Int) (t5 (tree23 Int)))
  (= (node31 (UF Int t1) a (Node3 Int t2 b t3 c t4) d t5) (TD Int (Node3 Int (Node2 Int t1 a t2) b (Node2 Int t3 c t4) d t5)))))
(declare-fun node32 ((tree23 Int) Int (upD Int) Int (tree23 Int)) (upD Int))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (node32 t1 a (TD Int t2) b t3)
  (TD Int (Node3 Int t1 a t2 b t3)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)))
  (= (node32 t1 a (UF Int t2) b (Node2 Int t3 c t4)) (TD Int (Node2 Int t1 a (Node3 Int t2 b t3 c t4))))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)) (d Int) (t5 (tree23 Int)))
  (= (node32 t1 a (UF Int t2) b (Node3 Int t3 c t4 d t5)) (TD Int (Node3 Int t1 a (Node2 Int t2 b t3) c (Node2 Int t4 d t5))))))
(declare-fun node33 ((tree23 Int) Int (tree23 Int) Int (upD Int)) (upD Int))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (node33 t1 a t2 b (TD Int t3))
  (TD Int (Node3 Int t1 a t2 b t3)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)))
  (= (node33 t1 a (Node2 Int t2 b t3) c (UF Int t4)) (TD Int (Node2 Int t1 a (Node3 Int t2 b t3 c t4))))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int)) (c Int) (t4 (tree23 Int)) (d Int) (t5 (tree23 Int)))
  (= (node33 t1 a (Node3 Int t2 b t3 c t4) d (UF Int t5)) (TD Int (Node3 Int t1 a (Node2 Int t2 b t3) c (Node2 Int t4 d t5))))))
(declare-fun split_min23 ((tree23 Int)) (pair Int (upD Int)))
(assert (forall ((a Int)) (= (split_min23 (Node2 Int (Leaf23 Int) a (Leaf23 Int))) (Pair Int (upD Int) a (UF Int (Leaf23 Int))))))
(assert (forall ((a Int) (b Int)) (= (split_min23 (Node3 Int (Leaf23 Int) a (Leaf23 Int) b (Leaf23 Int)))
  (Pair Int (upD Int) a (TD Int (Node2 Int (Leaf23 Int) b (Leaf23 Int)))))))
(assert (forall ((l (tree23 Int)) (a Int) (r (tree23 Int))) (= (split_min23 (Node2 Int l a r))
  (let ((xl (split_min23 l))) (Pair Int (upD Int) (Pair_0 Int (upD Int) xl) (node21 (Pair_1 Int (upD Int) xl) a r))))))
(assert (forall ((l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int))) (= (split_min23 (Node3 Int l a m b r))
  (let ((xl (split_min23 l))) (Pair Int (upD Int) (Pair_0 Int (upD Int) xl) (node31 (Pair_1 Int (upD Int) xl) a m b r))))))
(declare-fun del (Int (tree23 Int)) (upD Int))
(assert (forall ((x Int)) (= (del x (Leaf23 Int)) (TD Int (Leaf23 Int)))))
(assert (forall ((x Int) (a Int)) (= (del x (Node2 Int (Leaf23 Int) a (Leaf23 Int))) (ite (= x a) (UF Int (Leaf23 Int)) (TD Int (Node2 Int (Leaf23 Int) a (Leaf23 Int)))))))
(assert (forall ((x Int) (a Int) (b Int)) (= (del x (Node3 Int (Leaf23 Int) a (Leaf23 Int) b (Leaf23 Int)))
  (TD Int (ite (= x a) (Node2 Int (Leaf23 Int) b (Leaf23 Int)) (ite (= x b) (Node2 Int (Leaf23 Int) a (Leaf23 Int)) (Node3 Int (Leaf23 Int) a (Leaf23 Int) b (Leaf23 Int))))))))
(assert (forall ((x Int) (l (tree23 Int)) (a Int) (r (tree23 Int))) (= (del x (Node2 Int l a r))
  (match (cmp x a) ((LT (node21 (del x l) a r))
                    (EQ (let ((ar (split_min23 r))) (node22 l (Pair_0 Int (upD Int) ar) (Pair_1 Int (upD Int) ar))))
                    (GT (node22 l a (del x r))))))))
(assert (forall ((x Int) (l (tree23 Int)) (a Int) (m (tree23 Int)) (b Int) (r (tree23 Int))) (= (del x (Node3 Int l a m b r))
  (match (cmp x a) ((LT (node31 (del x l) a m b r))
                    (EQ (let ((am (split_min23 m))) (node32 l (Pair_0 Int (upD Int) am) (Pair_1 Int (upD Int) am) b r)))
                    (GT (match (cmp x b) ((LT (node32 l a (del x m) b r))
                                          (EQ (let ((br (split_min23 r))) (node33 l a m (Pair_0 Int (upD Int) br) (Pair_1 Int (upD Int) br))))
                                          (GT (node33 l a m b (del x r)))))))))))
(declare-fun delete23 (Int (tree23 Int)) (tree23 Int))
(assert (forall ((x Int) (t (tree23 Int))) (= (delete23 x t) (treeD (del x t)))))

(declare-fun len23s ((tree23s Int)) Int)
(assert (forall ((t (tree23 Int))) (= (len23s (T Int t)) 1)))
(assert (forall ((t (tree23 Int)) (a Int) (ts (tree23s Int))) (= (len23s (TTs Int t a ts)) (+ (len23s ts) 1))))
;(declare-fun trees ((tree23s Int)) set)
(declare-fun inorder23s ((tree23s Int)) (list Int))
(assert (forall ((t (tree23 Int))) (= (inorder23s (T Int t)) (inorder23 t))))
(assert (forall ((t (tree23 Int)) (a Int) (ts (tree23s Int))) (= (inorder23s (TTs Int t a ts)) (append (inorder23 t) (Cons Int a (inorder23s ts))))))
(declare-fun join_adj ((tree23s Int)) (tree23s Int))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int))) (= (join_adj (TTs Int t1 a (T Int t2))) (T Int (Node2 Int t1 a t2)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (t3 (tree23 Int))) (= (join_adj (TTs Int t1 a (TTs Int t2 b (T Int t3))))
  (T Int (Node3 Int t1 a t2 b t3)))))
(assert (forall ((t1 (tree23 Int)) (a Int) (t2 (tree23 Int)) (b Int) (ts (tree23s Int))) (= (join_adj (TTs Int t1 a (TTs Int t2 b ts)))
  (TTs Int (Node2 Int t1 a t2) b (join_adj ts)))))
(declare-fun join_all ((tree23s Int)) (tree23 Int))
(assert (forall ((t (tree23 Int))) (= (join_all (T Int t)) t)))
(assert (forall ((ts (tree23s Int))) (= (join_all ts) (join_all (join_adj ts)))))
(declare-fun not_T ((tree23s Int)) Bool)
(assert (forall ((ts (tree23s Int))) (= (not_T ts) (forall ((t (tree23 Int))) (distinct ts (T Int t))))))
(declare-fun leaves ((list Int)) (tree23s Int))
(assert (= (leaves (Nil Int)) (T Int (Leaf23 Int))))
(assert (forall ((a Int) (xs (list Int))) (= (leaves (Cons Int a xs)) (TTs Int (Leaf23 Int) a (leaves xs)))))
(declare-fun tree23_of_list ((list Int)) (tree23 Int))
(assert (forall ((xs (list Int))) (= (tree23_of_list xs) (join_all (leaves xs)))))

; red-black trees
(declare-fun R ((rbt Int) Int (rbt Int)) (rbt Int))
(assert (forall ((l (rbt Int)) (a Int) (r (rbt Int))) (= (R l a r) (NodeRB Int l (Pair Int color a Red) r))))
(declare-fun B ((rbt Int) Int (rbt Int)) (rbt Int))
(assert (forall ((l (rbt Int)) (a Int) (r (rbt Int))) (= (B l a r) (NodeRB Int l (Pair Int color a Black) r))))
(declare-fun color_of ((rbt Int)) color)
(assert (= (color_of (LeafRB Int)) Black))
(assert (forall ((l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (color_of (NodeRB Int l (Pair Int color a c) r)) c)))
(declare-fun paint (color (rbt Int)) (rbt Int))
(assert (forall ((c color)) (= (paint c (LeafRB Int)) (LeafRB Int))))
(assert (forall ((c color) (l (rbt Int)) (a Int) (d color) (r (rbt Int))) (= (paint c (NodeRB Int l (Pair Int color a d) r)) (NodeRB Int l (Pair Int color a c) r))))
(declare-fun invc ((rbt Int)) Bool)
(assert (invc (LeafRB Int)))
(assert (forall ((l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (invc (NodeRB Int l (Pair Int color a c) r))
  (and (=> (= c Red) (and (= (color_of l) Black) (= (color_of r) Black))) (invc l) (invc r)))))
(declare-fun bh ((rbt Int)) Int)
(assert (= (bh (LeafRB Int)) 0))
(assert (forall ((l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (bh (NodeRB Int l (Pair Int color a c) r))
  (ite (= c Black) (+ (bh l) 1) (bh l)))))
(declare-fun invh ((rbt Int)) Bool)
(assert (invh (LeafRB Int)))
(assert (forall ((l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (invh (NodeRB Int l (Pair Int color a c) r))
  (and (= (bh l) (bh r)) (invh l) (invh r)))))
(declare-fun inv_rbt ((rbt Int)) Bool)
(assert (forall ((t (rbt Int))) (= (inv_rbt t) (and (invc t) (invh t) (= (color_of t) Black)))))
(declare-fun baliL ((rbt Int) Int (rbt Int)) (rbt Int))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)) (c Int) (t4 (rbt Int)))
  (= (baliL (R (R t1 a t2) b t3) c t4) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)) (c Int) (t4 (rbt Int)))
  (= (baliL (R t1 a (R t2 b t3)) c t4) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int))) (= (baliL t1 a t2) (B t1 a t2))))
(declare-fun baliR ((rbt Int) Int (rbt Int)) (rbt Int))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)) (c Int) (t4 (rbt Int)))
  (= (baliR t1 a (R t2 b (R t3 c t4))) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)) (c Int) (t4 (rbt Int)))
  (= (baliR t1 a (R (R t2 b t3) c t4)) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int))) (= (baliR t1 a t2) (B t1 a t2))))
(declare-fun insRB (Int (rbt Int)) (rbt Int))
(assert (forall ((x Int)) (= (insRB x (LeafRB Int)) (R (LeafRB Int) x (LeafRB Int)))))
(assert (forall ((x Int) (l (rbt Int)) (a Int) (r (rbt Int))) (= (insRB x (B l a r))
  (match (cmp x a) ((LT (baliL (insRB x l) a r))
                    (EQ (B l a r))
                    (GT (baliR l a (insRB x r))))))))
(assert (forall ((x Int) (l (rbt Int)) (a Int) (r (rbt Int))) (= (insRB x (R l a r))
  (match (cmp x a) ((LT (R (insRB x l) a r))
                    (EQ (R l a r))
                    (GT (R l a (insRB x r))))))))
(declare-fun insertRB (Int (rbt Int)) (rbt Int))
(assert (forall ((x Int) (t (rbt Int))) (= (insertRB x t) (paint Black (insRB x t)))))
(declare-fun invc2 ((rbt Int)) Bool)
(assert (forall ((t (rbt Int))) (= (invc2 t) (invc (paint Black t)))))

(declare-fun baldL ((rbt Int) Int (rbt Int)) (rbt Int))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)))
  (= (baldL (R t1 a t2) b t3) (R (B t1 a t2) b t3))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)))
  (= (baldL t1 a (B t2 b t3)) (baliR t1 a (R t2 b t3)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)) (c Int) (t4 (rbt Int)))
  (= (baldL t1 a (R (B t2 b t3) c t4)) (R (B t1 a t2) b (baliR t3 c (paint Red t4))))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int))) (= (baldL t1 a t2) (R t1 a t2))))
(declare-fun baldR ((rbt Int) Int (rbt Int)) (rbt Int))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)))
  (= (baldR t1 a (R t2 b t3)) (R t1 a (B t2 b t3)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)))
  (= (baldR (B t1 a t2) b t3) (baliL (R t1 a t2) b t3))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (b Int) (t3 (rbt Int)) (c Int) (t4 (rbt Int)))
  (= (baldR (R t1 a (B t2 b t3)) c t4) (R (baliL (paint Red t1) a t2) b (B t3 c t4)))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int))) (= (baldR t1 a t2) (R t1 a t2))))
(declare-fun split_minRB ((rbt Int)) (pair Int (rbt Int)))
(assert (forall ((l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (split_minRB (NodeRB Int l (Pair Int color a c) r))
  (ite (= l (LeafRB Int)) (Pair Int (rbt Int) a r) (let ((xl (split_minRB l)))
    (Pair Int (rbt Int) (Pair_0 Int (rbt Int) xl) (ite (= (color_of l) Black) (baldL (Pair_1 Int (rbt Int) xl) a r) (R (Pair_1 Int (rbt Int) xl) a r))))))))
(declare-fun delRB (Int (rbt Int)) (rbt Int))
(assert (forall ((x Int) (l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (delRB x (NodeRB Int l (Pair Int color a c) r))
  (match (cmp x a) ((LT (let ((ll (delRB x l))) (ite (and (distinct l (LeafRB Int)) (= (color_of l) Black)) (baldL ll a r) (R ll a r))))
                    (EQ (ite (= r (LeafRB Int)) l (let ((ar (split_minRB r))) (ite (= (color_of r) Black)
                      (baldR l (Pair_0 Int (rbt Int) ar) (Pair_1 Int (rbt Int) ar)) (R l (Pair_0 Int (rbt Int) ar) (Pair_1 Int (rbt Int) ar))))))
                    (GT (let ((rr (delRB x r))) (ite (and (distinct r (LeafRB Int)) (= (color_of r) Black)) (baldR l a rr) (R l a rr)))))))))
(declare-fun deleteRB (Int (rbt Int)) (rbt Int))
(assert (forall ((x Int) (t (rbt Int))) (= (deleteRB x t) (paint Black (delRB x t)))))
;(declare-fun bhs ((rbt Int)) set)
(declare-fun joinRB ((rbt Int) (rbt Int)) (rbt Int))
(assert (forall ((t (rbt Int))) (= (joinRB t (LeafRB Int)) t)))
(assert (forall ((t (rbt Int))) (= (joinRB (LeafRB Int) t) t)))
;(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (t3 (rbt Int)) (c Int) (t4 (rbt Int))) (= (joinRB (R t1 a t2) (R t3 c t4))
;  (match (joinRB t2 t3) (((R u2 b u3) (R (R t1 a u2) b (R u3 c t4)))
;                         (t23 (R t1 a (R t23 c t4))))))))
;(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (t3 (rbt Int)) (c Int) (t4 (rbt Int))) (= (joinRB (B t1 a t2) (B t3 c t4))
;  (match (joinRB t2 t3) (((R u2 b u3) (R (B t1 a u2) b (B u3 c t4)))
;                         (t23 (baldL t1 a (R t23 c t4))))))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (t3 (rbt Int))) (= (joinRB t1 (R t2 a t3)) (R (joinRB t1 t2) a t3))))
(assert (forall ((t1 (rbt Int)) (a Int) (t2 (rbt Int)) (t3 (rbt Int))) (= (joinRB (R t1 a t2) t3) (R t1 a (joinRB t2 t3)))))
(declare-fun delRB2 (Int (rbt Int)) (rbt Int))
(assert (forall ((x Int) (l (rbt Int)) (a Int) (c color) (r (rbt Int))) (= (delRB2 x (NodeRB Int l (Pair Int color a c) r))
  (match (cmp x a) ((LT (let ((ll (delRB2 x l))) (ite (and (distinct l (LeafRB Int)) (= (color_of l) Black)) (baldL ll a r) (R ll a r))))
                    (EQ (joinRB l r))
                    (GT (let ((rr (delRB2 x r))) (ite (and (distinct r (LeafRB Int)) (= (color_of r) Black)) (baldR l a rr) (R l a rr)))))))))

; AVL trees
(declare-fun ht ((tree_ht Int)) Int)
(assert (= (ht (Leaf (pair Int Int))) 0))
(assert (forall ((l (tree_ht Int)) (a Int) (n Int) (r (tree_ht Int))) (= (ht (Node (pair Int Int) l (Pair Int Int a n) r)) n)))
(declare-fun node ((tree_ht Int) Int (tree_ht Int)) (tree_ht Int))
(assert (forall ((l (tree_ht Int)) (a Int) (r (tree_ht Int))) (= (node l a r) (Node (pair Int Int) l (Pair Int Int a (+ (max (ht l) (ht r)) 1)) r))))
;(declare-fun avl ((tree_ht Int)) Bool)
;(assert (avl (Leaf (pair Int Int))))
;(assert (forall ((l (tree_ht Int)) (a Int) (n Int) (r (tree_ht Int))) (= (avl (NodeHT l a n r))
;  (and (<= (- (h l) (h r)) 1) (= n (+ 1 (max (h l) (h r)))) (avl l) (avl r)))))




; lemmas

;
; Section 1

; T_rev(xs) <= (|xs|+1)^2
(assert (forall ((xs (list Int))) (<= (T_rev xs) (pow (+ (len xs) 1) 2))))
; T_itrev(xs,ys) = |xs|+1
(assert (forall ((xs (list Int)) (ys (list Int))) (= (T_itrev xs ys) (+ (len xs) 1))))
; itrev(xs,ys) = rev(xs) @ ys
(assert (forall ((xs (list Int)) (ys (list Int))) (= (itrev xs ys) (append (rev xs) ys))))

;
; Section 2

; sorted(sort(xs))
;(assert (forall ((xs (list Int))) (sorted (sort xs))))
; mset(sort(xs)) = mset(xs)
;(assert (forall ((xs (list Int))) (same_mset (sort xs) xs)))
; mset(insort(x,xs)) = {{x}} + mset(xs)

; sorted(isort(xs))
(assert (forall ((xs (list Int))) (sorted (isort xs))))
; mset(isort(xs)) = mset(xs)
(assert (forall ((xs (list Int))) (same_mset (isort xs) xs)))
; set(insort(x,xs)) = {x} U set(xs)

; sorted(insort(a,xs)) = sorted(xs)
(assert (forall ((a Int) (xs (list Int))) (= (sorted (insort a xs)) (sorted xs))))
; T_isort(xs) <= (|xs|+1)^2
(assert (forall ((xs (list Int))) (<= (T_isort xs) (pow (+ (len xs) 1) 2))))
; T_insort(x,xs) <= |xs| + 1
(assert (forall ((x Int) (xs (list Int))) (<= (T_insort x xs) (+ (len xs) 1))))
; |insort(x,xs)| = |xs| + 1
(assert (forall ((x Int) (xs (list Int))) (= (len (insort x xs)) (+ (len xs) 1))))
; |isort(xs)| = |xs|
(assert (forall ((xs (list Int))) (= (len (isort xs)) (len xs))))
; ((!xs. mset(f(xs)) = mset(xs)) & (!xs.sorted(f(xs)))) -> f(xs) = isort(xs)

; mset(quicksort(xs)) = mset(xs)
(assert (forall ((xs (list Int))) (same_mset (quicksort xs) xs)))
; mset(filter(P(xs))) = filter_mset(P,mset(xs))

; (!x.P(x)=(~Q(x))) -> filter_mset(P,M) + filter_mset(Q,M) = M

; sorted(quicksort(xs))
(assert (forall ((xs (list Int))) (sorted (quicksort xs))))
; sorted(xs @ ys) = (sorted xs & sorted ys & (!x in set(xs). !y in set(ys). x <= y))
(assert (forall ((xs (list Int)) (ys (list Int))) (= (sorted (append xs ys)) (and (sorted xs) (sorted ys)
  (forall ((x Int) (y Int)) (=> (and (in_set x xs) (in_set y ys)) (<= x y)))))))
; set(quicksort(xs)) = set(xs)
(assert (forall ((xs (list Int))) (same_set xs (quicksort xs))))
; quicksort2(xs,ys) = quicksort(xs) @ ys
(assert (forall ((xs (list Int)) (ys (list Int))) (= (quicksort2 xs ys) (append (quicksort xs) ys))))
; quicksort3(xs) = quicksort(xs)

; sorted(xs) -> T_quicksort(xs) = a * |xs|^2 + b * |xs| + c

; T_quicksort(xs) <= a * |xs|^2 + b * |xs| + c

; mset(merge(xs,ys)) = mset(xs) + mset(ys)

; set(merge(xs,ys)) = set(xs) U set(ys)

; mset(msort(xs)) = mset(xs)
(assert (forall ((xs (list Int))) (same_set xs (msort xs))))
; sorted(merge(xs,ys)) = (sorted(xs) & sorted(ys))
(assert (forall ((xs (list Int)) (ys (list Int))) (= (sorted (merge xs ys)) (and (sorted xs) (sorted ys)))))
; sorted(msort(xs))
(assert (forall ((xs (list Int))) (sorted (msort xs))))
; |merge(xs,ys)| = |xs| + |ys|
(assert (forall ((xs (list Int)) (ys (list Int))) (= (len (merge xs ys)) (+ (len xs) (len ys)))))
; |msort(xs)| = |xs|
(assert (forall ((xs (list Int))) (= (len (msort xs)) (len xs))))
; C_merge(xs,ys) <= |xs| + |ys|
(assert (forall ((xs (list Int)) (ys (list Int))) (<= (C_merge xs ys) (+ (len xs) (len ys)))))
; |xs| = 2^k -> C_msort(xs) <= k * 2^k
(assert (forall ((xs (list Int)) (k Int)) (=> (= (len xs) (pow 2 k)) (<= (C_msort xs) (* k (pow 2 k))))))
; mset(msort2(xs)) = mset(xs)

; sorted(msort2(xs))

; |merge_adj(xs)| = (|xs| + 1) div 2
;(assert (forall ((xs (list Int))) (= (len (merge_adj xs)) (div (+ (len xs) 1) 2))))
; mset_mset (merge_adj(xss)) = mset_mset(xss)

; mset(merge_all(xss)) = mset_mset(xss)

; mset(msort_bu(xs)) = mset(xs)
(assert (forall ((xs (list Int))) (same_mset xs (msort_bu xs))))
; Ball(set(xss),sorted) -> Ball(set(merge_adj(xss)),sorted)

; Ball(set(xss),sorted) -> sorted(merge_all(xss))

; sorted(msort_bu(xs))
(assert (forall ((xs (list Int))) (sorted (msort_bu xs))))
; even(|xss|) & (!xs in set(xss).|xs| = m) -> (!xs in set(merge_adj(xss)). |xs| = 2 * m)

; (!xs in set(xss). |xs| = m) -> C_merge_adj(xss) <= m * |xss|

; (!xs in set(xss). |xs| = m) & |xss| = 2^k -> C_merge_all(xss) <= m * k * 2^k

; |xs| = 2^k -> C_msort_bu(xs) <= k * 2^k

; (!xs, ys. f (xs @ ys) = f(xs) @ ys) -> mset_mset(asc x f ys) = {{x}} + mset(f([])) + mset(ys)

; mset_mset(desc(x,xs,ys)) = {{x}} + mset(xs) + mset(ys)

; mset_mset(runs(xs)) = mset(xs)

; mset(nmsort(xs)) = mset(xs)
;(assert (forall ((xs (list Int))) (same_mset xs (nmsort xs))))
; Ball(set(runs(xs)),sorted)

; sorted(nmsort(xs))
(assert (forall ((xs (list Int))) (sorted (nmsort xs))))
; C_merge_adj(xss) <= |concat(xss)|
(assert (forall ((xss (lists Int))) (<= (C_merge_adj xss) (len (concat xss)))))
; |concat(merge_adj(xss))| = |concat(xss)|
(assert (forall ((xss (lists Int))) (= (len (concat (merge_adj xss))) (len (concat xss)))))
; C_merge_all(xss) <= |concat(xss)| * ceil(lg(|xss|))

; 2 <= n -> ceil(lg(n)) = ceil(lg((n-1) div 2 + 1)) + 1

; (!xs,ys. f(xs @ ys) = f(xs) @ ys) -> |concat(asc(a,f(ys)))| = 1 + |f([])| + |ys|

; |concat(desc(a,xs,ys))| = 1 + |xs| + |ys|
(assert (forall ((a Int) (xs (list Int)) (ys (list Int))) (= (len (concat (desc a xs ys))) (+ 1 (len xs) (len ys)))))
; |concat(runs(xs))| = |xs|
;(assert (forall ((xs (list Int))) (= (len (concat (runs xs))) (len xs))))
; (!xs,ys. f(xs @ ys) = f(xs) @ ys) -> |asc(a,f(ys))| <= 1 + |ys|

; |desc(a,xs,ys)| <= 1 + |ys|
;(assert (forall ((a Int) (xs (list Int)) (ys (list Int))) (<= (len (desc a xs ys)) (+ 1 (len ys)))))
; |runs(xs)| <= |xs|
;(assert (forall ((xs (list Int))) (<= (len (runs xs)) (len xs))))
; C_asc(a,ys) <= |ys|
(assert (forall ((a Int) (ys (list Int))) (<= (C_asc a ys) (len ys))))
; C_desc(a,ys) <= |ys|
(assert (forall ((a Int) (ys (list Int))) (<= (C_desc a ys) (len ys))))
; C_runs(xs) <= |xs| - 1
(assert (forall ((xs (list Int))) (<= (C_runs xs) (- (len xs) 1))))
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
(assert (forall ((t (tree Int))) (= (size1 t) (+ (size t) 1))))
; h(t) <= |t|
(assert (forall ((t (tree Int))) (<= (h t) (size t))))
; mh(t) <= h(t)
(assert (forall ((t (tree Int))) (<= (mh t) (h t))))
; 2^mh(t) <= |t|_1
(assert (forall ((t (tree Int))) (<= (pow 2 (mh t)) (size1 t))))
; |t|_1 <= 2^h(t)
(assert (forall ((t (tree Int))) (<= (size1 t) (pow 2 (h t)))))
; inorder2(t,xs) = inorder(t) @ xs
(assert (forall ((t (tree Int)) (xs (list Int))) (= (inorder2 t xs) (append (inorder t) xs))))
; complete(t) <-> mh(t) = h(t)
; complete(t) -> |t|_1 = 2^h(t)
; ~complete(t) -> |t|_1 < 2^h(t)
; ~complete(t) -> 2^mh(t) < |t|_1
; complete(t) <-> |t|_1 = 2^h(t)
; u in subtrees(t) & complete(u) -> h(u) <= h(mcs(t))
; acomplete(s) & |s| <= |t| -> h(s) <= h(t)
; acomplete(t) -> h(t) = ceil(lg(|t|_1))
; acomplete(t) -> mh(t) = floor(lg(|t|_1))
; n <= |xs| & bal(n,xs) = (t, zs) -> xs = inorder(t) @ zs & |t| = n
; n <= |xs| -> inorder(bal_list(n,xs)) = take(n,xs)
; inorder(balance_list(xs)) = xs
; n <= |t| -> inorder(bal_tree(n,t)) = take(n,inorder(t))
; inorder(balance_tree(t)) = inorder(t)
; n <= |xs| & bal(n,xs) = (t,zs) -> h(t) = ceil(lg(n+1))
; n <= |xs| & bal(n,xs) = (t,zs) -> mh(t) = floor(lg(n+1))
; n <= |xs| & bal(n,xs) = (t,ys) -> acomplete(t)
; invar_sz(t) = sz(t) = |t|
; invar_f(t) -> b_val(t) = F(t)
; invar_ch(t) -> ch(t) = (complete(t), ?)
; invar_ch(l) & invar_ch(r) -> invar_ch(node_ch(l,a,r))
; invar_mx(t) -> mx(t) = if t = <> then None else Some(Max(set_tree(t)))
; 
; 5.
; inorder(join(l,r)) = inorder(l) @ inorder(r)
; h(join(l,r)) <= max(h(l),h(r)) + 1
; bst(t) = sorted(inorder(t))
; set_tree(t) = set(inorder(t))
; sorted(inorder(t)) -> inorder(insert(x,t)) = ins_list(x,inorder(t))
; sorted(xs @ y # ys) = (sorted(xs @ [y]) & sorted(y # ys))
; sorted(x # xs @ y # ys) = (sorted(x # xs) & x < y & sorted(xs @ [y]) & sorted(y # ys))
; sorted(x # xs) -> sorted(xs)
; sorted(xs @ [y]) -> sorted(xs)
; sorted(xs @ [a]) -> ins_list(x,xs @ a # ys) =
;   if x < a then ins_list(x,xs) @ a # ys else xs @ ins_list(x,a # ys)
; sorted(xs @ [a] # ys) -> del_list(x, xs @ a # ys) =
;   if x < a then del_list(x,xs) @ a # ys else xs @ del_list(x, a # ys)
; sorted(x # xs) = ((!y in set(xs). x < y) & sorted(xs))
; sorted(xs @ [x]) = (sorted(xs) & (!y in set(xs). y < x))
; 
; set_tree(empty) = {}
; sorted(inorder(t)) -> set_tree(insert(x,t)) = set_tree(t) U {x}
; sorted(inorder(t)) -> set_tree(delete(x,t)) = set_tree(t) - {x}
; sorted(inorder(t)) -> isin(t,x) = (x in set_tree(t))
; set(ins_list(x,xs)) = set(xs) U {x}
; sorted(xs) -> set(del_list(x,xs)) = set(xs) - {x}
; sorted(inorder(empty))
; sorted(inorder(t)) -> sorted(inorder(insert(x,t)))
; sorted(inorder(t)) -> sorted(inorder(delete(x,t)))
; sorted(xs) -> sorted(ins_list(x,xs))
; sorted(xs) -> sorted(del_list(x,xs))
; 
; interval trees:
; inv_max_hi(t) & a in set_tree(t) -> high(a) <= max_hi(t)
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
; 
; 2-3 trees:
; complete(t) -> 2^h(t) <= |t| + 1
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
