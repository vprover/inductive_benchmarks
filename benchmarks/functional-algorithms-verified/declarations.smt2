;(declare-datatype nat ((zero) (s (s_0 nat))))
(declare-datatype list ((Nil) (Cons (Cons_0 Int) (Cons_1 list))))
(declare-datatype bool_list ((BNil) (BCons (BCons_0 Bool) (BCons_1 bool_list))))
(declare-datatype lists ((Nils) (Conss (Conss_0 list) (Conss_1 lists))))
(declare-datatype option ((None) (Some (Some_0 Int))))
(declare-datatype tree ((Leaf) (Node (Node_0 tree) (Node_1 Int) (Node_2 tree))))
(declare-datatype ival ((Ival (Ival_0 Int) (Ival_1 Int))))
(declare-datatype itree ((ILeaf) (INode (INode_0 itree) (INode_1 ival) (INode_2 Int) (INode_3 itree))))
(declare-datatype cmp_val ((LT) (EQ) (GT)))
(declare-datatype tree23 ((Leaf23) (Node2 (Node2_0 tree23) (Node2_1 Int) (Node2_2 tree23)) (Node3 (Node3_0 tree23) (Node3_1 Int) (Node3_2 tree23) (Node3_3 Int) (Node3_4 tree23))))
(declare-datatype upI ((TI (TI_0 tree23)) (OF (OF_0 tree23) (OF_1 Int) (OF_2 tree23))))
(declare-datatype upD ((TD (TD_0 tree23)) (UF (UF_0 tree23))))
(declare-datatype tree23s ((T (T_0 tree23)) (TTs (TTs_0 tree23) (TTs_1 Int) (TTs_2 tree23s))))
(declare-datatype color ((Red) (Black)))
(declare-datatype bal ((Lh) (Bal) (Rh)))
;(declare-datatype tree4 ((Leaf4) (Lh (Lh_0 tree4) (Lh_1 Int) (Lh_2 tree4)) (Bal (Bal_0 tree4) (Bal_1 Int) (Bal_2 tree4)) (Rh (Rh_0 tree4) (Rh_1 Int) (Rh_2 tree4))))
;(declare-datatype trie ((Nd Bool ('a -> 'a trie option))))
(declare-datatype trie ((Lf) (Nd (Nd_0 Bool) (Nd_1 trie) (Nd_2 trie))))
(declare-datatype trieP ((LfP) (NdP (NdP_0 bool_list) (NdP_1 Bool) (NdP_2 trieP) (NdP_3 trieP))))
(declare-datatype rbt ((LeafRB) (NodeRB (NodeR_0 rbt) (NodeR_1 Int) (NodeR_2 color) (NodeR_3 rbt))))

; pairs -- delete these once a polymorphic tuple can be used instead
(declare-datatype int_tree_pair ((itp (itp_0 Int) (itp_1 tree))))
(declare-datatype tree_list_pair ((tlp (tlp_0 tree) (tlp_1 list))))
(declare-datatype int_upD_pair ((iupDp (iupDp_0 Int) (iupDp_1 upD))))
(declare-datatype int_rbt_pair ((irp (irp_0 Int) (irp_1 rbt))))

; parametric types for future use
;(declare-datatype pair (par (a b) ((Pair (Pair_0 a) (Pair_1 b)))))
;(declare-fun first ((pair Int Int)) Int)
;(assert (forall ((x Int) (y Int)) (= (first (Pair x y)) x)))
;(declare-fun second ((pair Int Int)) Int)
;(assert (forall ((x Int) (y Int)) (= (second (Pair x y)) y)))

; auxiliary functions for sets and multisets -- remove these once a higher-order setting is used
(declare-fun in_set (Int list) Bool)
(assert (forall ((x Int)) (not (in_set x Nil))))
(assert (forall ((x Int) (y Int) (ys list)) (= (in_set x (Cons y ys)) (or (= x y) (in_set x ys)))))
(declare-fun in_set_tree (Int tree) Bool)
(assert (forall ((x Int)) (not (in_set_tree x Leaf))))
(assert (forall ((x Int) (l tree) (a Int) (r tree)) (= (in_set_tree x (Node l a r)) (or (= x a) (in_set_tree x l) (in_set_tree x r)))))
(declare-fun count (Int list) Int)
(assert (forall ((x Int)) (= (count x Nil) 1)))
(assert (forall ((x Int) (y Int) (ys list)) (= (count x (Cons y ys)) (ite (= x y) (+ 1 (count x ys)) (count x ys)))))
(declare-fun same_mset (list list) Bool)
(assert (forall ((xs list) (ys list)) (= (same_mset xs ys) (forall ((x Int)) (= (count x xs) (count x ys))))))

; filter and map functions -- remove these once a higher-order setting is used
(declare-fun filter_less (Int list) list)
(assert (forall ((x Int)) (= (filter_less x Nil) Nil)))
(assert (forall ((x Int) (y Int) (ys list)) (= (filter_less x (Cons y ys)) (ite (< y x) (Cons y (filter_less x ys)) (filter_less x ys)))))
(declare-fun filter_ge (Int list) list)
(assert (forall ((x Int)) (= (filter_ge x Nil) Nil)))
(assert (forall ((x Int) (y Int) (ys list)) (= (filter_ge x (Cons y ys)) (ite (>= y x) (Cons y (filter_ge x ys)) (filter_ge x ys)))))
(declare-fun map_list_lists (list) lists)
(assert (= (map_list_lists Nil) Nils))
(assert (forall ((x Int) (xs list)) (= (map_list_lists (Cons x xs)) (Conss (Cons x Nil) (map_list_lists xs)))))

; functions
(declare-fun append (list list) list)
(assert (forall ((ys list)) (= (append Nil ys) ys)))
(assert (forall ((x Int) (xs list) (ys list)) (= (append (Cons x xs) ys) (Cons x (append xs ys)))))
(declare-fun rev (list) list)
(assert (= (rev Nil) Nil))
(assert (forall ((x Int) (xs list)) (= (rev (Cons x xs)) (append (rev xs) (Cons x Nil)))))
(declare-fun itrev (list list) list)
(assert (forall ((ys list)) (= (itrev Nil ys) ys)))
(assert (forall ((x Int) (xs list) (ys list)) (= (itrev (Cons x xs) ys) (itrev xs (Cons x ys)))))
(declare-fun T_append (list list) Int)
(assert (forall ((ys list)) (= (T_append Nil ys) 1)))
(assert (forall ((x Int) (xs list) (ys list)) (= (T_append (Cons x xs) ys) (+ (T_append xs ys) 1))))
(declare-fun T_rev (list) Int)
(assert (= (T_rev Nil) 1))
(assert (forall ((x Int) (xs list)) (= (T_rev (Cons x xs)) (+ (T_rev xs) (T_append (rev xs) (Cons x Nil)) 1))))
(declare-fun T_itrev (list list) Int)
(assert (forall ((ys list)) (= (T_itrev Nil ys) 1)))
(assert (forall ((x Int) (xs list) (ys list)) (= (T_itrev (Cons x xs) ys) (+ (T_itrev xs (Cons x ys)) 1))))
(declare-fun sorted (list) Bool)
(assert (sorted Nil))
(assert (forall ((x Int) (xs list)) (= (sorted (Cons x xs)) (and (forall ((y Int)) (=> (in_set y xs) (<= x y))) (sorted xs)))))
(declare-fun insort (Int list) list)
(assert (forall ((x Int)) (= (insort x Nil) (Cons x Nil))))
(assert (forall ((x Int) (y Int) (ys list)) (= (insort x (Cons y ys)) (ite (<= x y) (Cons x (Cons y ys)) (Cons y (insort x ys))))))
(declare-fun isort (list) list)
(assert (= (isort Nil) Nil))
(assert (forall ((x Int) (xs list)) (= (isort (Cons x xs)) (insort x (isort xs)))))
(declare-fun T_insort (Int list) Int)
(assert (forall ((x Int)) (= (T_insort x Nil) 1)))
(assert (forall ((x Int) (y Int) (ys list)) (= (T_insort x (Cons y ys)) (+ (ite (<= x y) 0 (T_insort x ys)) 1))))
(declare-fun T_isort (list) Int)
(assert (= (T_isort Nil) 1))
(assert (forall ((x Int) (xs list)) (= (T_isort (Cons x xs)) (+ (T_isort xs) (T_insort x (isort xs)) 1))))
(declare-fun quicksort (list) list)
(assert (= (quicksort Nil) Nil))
(assert (forall ((x Int) (xs list)) (= (quicksort (Cons x xs))
  (append (quicksort (filter_less x xs)) (append (Cons x Nil) (quicksort (filter_ge x xs)))))))
(declare-fun quicksort2 (list list) list)
(assert (forall ((ys list)) (= (quicksort2 Nil ys) ys)))
(assert (forall ((x Int) (xs list) (ys list)) (= (quicksort2 (Cons x xs) ys)
  (quicksort2 (filter_less x xs) (Cons x (quicksort2 (filter_ge x xs) ys))))))
;(declare-fun partition3 (Int list) tuple(list,list,list))
;(declare-fun quicksort3 (list) list)
(declare-fun len (list) Int)
(assert (= (len Nil) 0))
(assert (forall ((x Int) (xs list)) (= (len (Cons x xs)) (+ (len xs) 1))))
(declare-fun T_quicksort (list) Int)
(assert (= (T_quicksort Nil) 1))
(assert (forall ((x Int) (xs list)) (= (T_quicksort (Cons x xs))
  (+ (T_quicksort (filter_less x xs)) (T_quicksort (filter_ge x xs)) (* 2 (len xs)) 1))))
(declare-fun merge (list list) list)
(assert (forall ((ys list)) (= (merge Nil ys) ys)))
(assert (forall ((xs list)) (= (merge xs Nil) xs)))
(assert (forall ((x Int) (xs list) (y Int) (ys list)) (= (merge (Cons x xs) (Cons y ys))
  (ite (<= x y) (Cons x (merge xs (Cons y ys))) (Cons y (merge (Cons x xs) ys))))))
(declare-fun take (Int list) list)
(assert (forall ((n Int)) (= (take n Nil) Nil)))
(assert (forall ((n Int) (x Int) (xs list)) (= (take n (Cons x xs)) (ite (> n 0) (Cons x (take (- n 1) xs)) Nil))))
(declare-fun drop (Int list) list)
(assert (forall ((n Int)) (= (drop n Nil) Nil)))
(assert (forall ((n Int) (x Int) (xs list)) (= (drop n (Cons x xs)) (ite (> n 0) (drop (- n 1) xs) xs))))
(declare-fun msort (list) list)
(assert (forall ((xs list)) (= (msort xs) (let ((n (len xs))) (ite (<= n 1) xs
  (merge (msort (take (div n 2) xs)) (msort (drop (div n 2) xs))))))))
(declare-fun C_merge (list list) Int)
(assert (forall ((ys list)) (= (C_merge Nil ys) 0)))
(assert (forall ((xs list)) (= (C_merge xs Nil) 0)))
(assert (forall ((x Int) (xs list) (y Int) (ys list)) (= (C_merge (Cons x xs) (Cons y ys))
  (+ 1 (ite (<= x y) (C_merge xs (Cons y ys)) (C_merge (Cons x xs) ys))))))
(declare-fun C_msort (list) Int)
(assert (forall ((xs list)) (= (C_msort xs) (let ((n (len xs))) (let ((ys (take (div n 2) xs)) (zs (drop (div n 2) xs)))
  (ite (<= n 1) 0 (+ (C_msort ys) (C_msort zs) (C_merge (msort ys) (msort zs)))))))))
(declare-fun msort2 (list) list)
(declare-fun merge_adj (lists) lists)
(assert (= (merge_adj Nils) Nils))
(assert (forall ((xs list)) (= (merge_adj (Conss xs Nils)) (Conss xs Nils))))
(assert (forall ((xs list) (ys list) (zss lists)) (= (merge_adj (Conss xs (Conss ys zss))) (Conss (merge xs ys) (merge_adj zss)))))
(declare-fun merge_all (lists) list)
(assert (= (merge_all Nils) Nil))
(assert (forall ((xs list)) (= (merge_all (Conss xs Nils)) xs)))
(assert (forall ((xss lists)) (= (merge_all xss) (merge_all (merge_adj xss)))))
(declare-fun msort_bu (list) list)
(assert (forall ((xs list)) (= (msort_bu xs) (merge_all (map_list_lists xs)))))
(declare-fun C_merge_adj (lists) Int)
(assert (= (C_merge_adj Nils) 0))
(assert (forall ((xs list)) (= (C_merge_adj (Conss xs Nils)) 0)))
(assert (forall ((xs list) (ys list) (zss lists)) (= (C_merge_adj (Conss xs (Conss ys zss)))
  (+ (C_merge xs ys) (C_merge_adj zss)))))
(declare-fun C_merge_all (lists) Int)
(assert (= (C_merge_all Nils) 0))
(assert (forall ((xs list)) (= (C_merge_all (Conss xs Nils)) 0)))
(assert (forall ((xss lists)) (= (C_merge_all xss) (+ (C_merge_adj xss) (C_merge_all (merge_adj xss))))))
(declare-fun C_msort_bu (list) Int)
(assert (forall ((xs list)) (= (C_msort_bu xs) (C_merge_all (map_list_lists xs)))))
(declare-fun even (Int) Bool)
(assert (forall ((n Int)) (= (even n) (= (div n 2) 0))))
(declare-fun odd (Int) Bool)
(assert (forall ((n Int)) (= (odd n) (= (div n 2) 1))))
(declare-fun runs (list) lists)
(assert (= (runs Nil) Nils))
(assert (forall ((x Int)) (= (runs (Cons x Nil)) (Conss (Cons x Nil) Nils))))
;(assert (forall ((a Int) (b Int) (xs list)) (= (runs (Cons a (Cons b xs)))
;  (ite (< b a) (desc b (Cons a Nil) xs) (asc b ((# a) xs))))))
;(declare-fun asc (Int (=> list list) list) lists)
;(assert (forall ((a Int) (xs list)) (= (asc a xs Nil) (Conss xs (Conss (Cons a Nil) Nils)))))
;(assert (forall ((a Int) (xs list) (b Int) (ys list)) (= (asc a xs (Cons b ys))
;  (ite (not (< b a)) (asc b (xs . (#) a) ys) (Conss (xs (Cons a Nil)) (runs (Cons b ys)))))))
(declare-fun desc (Int list list) lists)
(assert (forall ((a Int) (xs list)) (= (desc a xs Nil) (Conss (Cons a xs) Nils))))
(assert (forall ((a Int) (xs list) (b Int) (ys list)) (= (desc a xs (Cons b ys))
  (ite (< b a) (desc b (Cons a xs) ys) (Conss (Cons a xs) (runs (Cons b ys)))))))
(declare-fun nmsort (list) list)
(assert (forall ((xs list)) (= (nmsort xs) (merge_all (runs xs)))))
;(declare-fun Ball (Int (=> Int Bool)) Bool)
(declare-fun C_runs (list) Int)
(declare-fun C_asc (Int list) Int)
(assert (forall ((x Int)) (= (C_asc x Nil) 0)))
(assert (forall ((a Int) (b Int) (bs list)) (= (C_asc a (Cons b bs))
  (+ 1 (ite (not (< b a)) (C_asc b bs) (C_runs (Cons b bs)))))))
(declare-fun C_desc (Int list) Int)
(assert (forall ((x Int)) (= (C_desc x Nil) 0)))
(assert (forall ((a Int) (b Int) (bs list)) (= (C_desc a (Cons b bs))
  (+ 1 (ite (< b a) (C_desc b bs) (C_runs (Cons b bs)))))))
(assert (= (C_runs Nil) 0))
(assert (forall ((x Int)) (= (C_runs (Cons x Nil)) 0)))
(assert (forall ((a Int) (b Int) (xs list)) (= (C_runs (Cons a (Cons b xs)))
  (+ 1 (ite (< b a) (C_desc b xs) (C_asc b xs))))))
(declare-fun C_nmsort (list) Int)
(assert (forall ((xs list)) (= (C_nmsort xs) (+ (C_runs xs) (C_merge_all (runs xs))))))
(declare-fun concat (lists) list)
(assert (= (concat Nils) Nil))
(assert (forall ((xs list) (xss lists)) (= (concat (Conss xs xss)) (append xs (concat xss)))))
(declare-fun lg (Int) Real)
(declare-fun ceil (Real) Int)
(declare-fun floor (Real) Int)
;(declare-fun filter ((=> Int Int) list) list)
;(declare-fun sort_key ((=> Int Int) list) list)
;(declare-fun insort_key ((=> Int Int) Int list) list)
;(declare-fun isort_key ((=> Int Int) list) list)
; already declared
;(declare-fun select (Int list) Int)
;(declare-fun minus (Int Int) Int)
;(declare-fun select0 (list) Int)
;(declare-fun select1 (list) Int)
; already declared
;(declare-fun distinct (list) Bool)
(declare-fun median (list) Int)
(declare-fun chop (Int list) lists)
(declare-fun min (Int Int) Int)
(declare-fun max (Int Int) Int)

(declare-fun inorder (tree) list)
(assert (= (inorder Leaf) Nil))
(assert (forall ((l tree) (a Int) (r tree)) (= (inorder (Node l a r)) (append (inorder l) (append (Cons a Nil) (inorder r))))))
(declare-fun preorder (tree) list)
(assert (= (preorder Leaf) Nil))
(assert (forall ((l tree) (a Int) (r tree)) (= (preorder (Node l a r)) (Cons a (append (inorder l) (inorder r))))))
(declare-fun size (tree) Int)
(assert (= (size Leaf) 0))
(assert (forall ((l tree) (a Int) (r tree)) (= (size (Node l a r)) (+ (size l) (size r) 1))))
(declare-fun size1 (tree) Int)
(assert (= (size1 Leaf) 1))
(assert (forall ((l tree) (a Int) (r tree)) (= (size1 (Node l a r)) (+ (size l) (size r)))))
(declare-fun h (tree) Int)
(assert (= (h Leaf) 0))
(assert (forall ((l tree) (a Int) (r tree)) (= (h (Node l a r)) (+ (max (h l) (h r)) 1))))
(declare-fun mh (tree) Int)
(assert (= (mh Leaf) 0))
(assert (forall ((l tree) (a Int) (r tree)) (= (mh (Node l a r)) (+ (min (mh l) (mh r)) 1))))
(declare-fun complete (tree) Bool)
(assert (complete Leaf))
(assert (forall ((l tree) (a Int) (r tree)) (= (complete (Node l a r)) (and (= (h l) (h r)) (complete l) (complete r)))))
(declare-fun acomplete (tree) Bool)
(assert (forall ((t tree)) (= (acomplete t) (<= (- (h t) (mh t)) 1))))
(declare-fun bal (Int list) tree_list_pair)
(assert (forall ((n Int) (xs list)) (= (bal n xs) (ite (= n 0) (tlp Leaf xs)
  (let ((m (div n 2))) (let ((lys (bal m xs))) (let ((rzs (bal (- n (+ 1 m)) (Cons_1 (tlp_1 lys)))))
    (tlp (Node (tlp_0 lys) (Cons_0 (tlp_1 lys)) (tlp_0 rzs)) (tlp_1 rzs)))))))))
(declare-fun bal_list (Int list) tree)
(assert (forall ((n Int) (xs list)) (= (bal_list n xs) (tlp_0 (bal n xs)))))
(declare-fun balance_list (list) tree)
(assert (forall ((xs list)) (= (balance_list xs) (bal_list (len xs) xs))))
(declare-fun bal_tree (Int tree) tree)
(assert (forall ((n Int) (t tree)) (= (bal_tree n t) (bal_list n (inorder t)))))
(declare-fun balance_tree (tree) tree)
(assert (forall ((t tree)) (= (balance_tree t) (bal_tree (size t) t))))
(declare-fun bst (tree) Bool)
(assert (bst Leaf))
(assert (forall ((l tree) (a Int) (r tree)) (= (bst (Node l a r))
  (and (forall ((x Int)) (=> (in_set_tree x l) (< x a))) (forall ((x Int)) (=> (in_set_tree x l) (< a x))) (bst l) (bst r)))))
(declare-fun cmp (Int Int) cmp_val)
(assert (forall ((x Int) (y Int)) (= (cmp x y) (ite (< x y) LT (ite (= x y) EQ GT)))))
(declare-fun empty () tree)
(assert (= empty Leaf))
(declare-fun isin (tree Int) Bool)
(assert (forall ((x Int)) (not (isin Leaf x))))
(assert (forall ((x Int) (l tree) (a Int) (r tree)) (= (isin (Node l a r) x)
  (match (cmp x a) ((LT (isin l x)) (EQ true) (GT (isin r x)))))))
(declare-fun insert (Int tree) tree)
(assert (forall ((x Int)) (= (insert x Leaf) (Node Leaf x Leaf))))
(assert (forall ((x Int) (l tree) (a Int) (r tree)) (= (insert x (Node l a r))
  (match (cmp x a) ((LT (Node (insert x l) a r))
                    (EQ (Node l a r))
                    (GT (Node l a (insert x r))))))))
(declare-fun split_min (tree) int_tree_pair)
(assert (forall ((l tree) (a Int) (r tree)) (= (split_min (Node l a r))
  (ite (= l Leaf) (itp a r) (let ((xl (split_min l))) (itp (itp_0 xl) (Node (itp_1 xl) a r)))))))
(declare-fun delete (Int tree) tree)
(assert (forall ((x Int)) (= (delete x Leaf) Leaf)))
(assert (forall ((x Int) (l tree) (a Int) (r tree)) (= (delete x (Node l a r))
  (match (cmp x a) ((LT (Node (delete x l) a r))
                    (EQ (ite (= r Leaf) l (let ((ar (split_min r))) (Node l (itp_0 ar) (itp_1 ar)))))
                    (GT (Node l a (delete x r))))))))

(declare-fun join (tree tree) tree)
(assert (forall ((t tree)) (= (join t Leaf) t)))
(assert (forall ((t tree)) (= (join Leaf t) t)))
(assert (forall ((t1 tree) (a Int) (t2 tree) (t3 tree) (b Int) (t4 tree)) (= (join (Node t1 a t2) (Node t3 b t4))
  (match (join t2 t3) ((Leaf (Node t1 a (Node Leaf b t4))) ((Node u2 x u3) (Node (Node t1 a u2) x (Node u3 b t4))))))))
(declare-fun delete2 (Int tree) tree)
(assert (forall ((x Int)) (= (delete2 x Leaf) Leaf)))
(assert (forall ((x Int) (l tree) (a Int) (r tree)) (= (delete2 x (Node l a r))
  (match (cmp x a) ((LT (Node (delete2 x l) a r))
                    (EQ (join l r))
                    (GT (Node l a (delete2 x r))))))))

(declare-fun join0 (tree tree) tree)
(assert (forall ((t tree)) (= (join0 t Leaf) t)))
(assert (forall ((t tree)) (= (join0 Leaf t) t)))
(assert (forall ((t1 tree) (a Int) (t2 tree) (t3 tree) (b Int) (t4 tree))
  (= (join0 (Node t1 a t2) (Node t3 b t4)) (Node t1 a (Node (join0 t2 t3) b t4)))))

(declare-fun ins_list (Int list) list)
(assert (forall ((x Int)) (= (ins_list x Nil) (Cons x Nil))))
(assert (forall ((x Int) (a Int) (xs list)) (= (ins_list x (Cons a xs))
  (ite (< x a) (Cons x (Cons a xs)) (ite (= x a) (Cons a xs) (Cons a (ins_list x xs)))))))
(declare-fun del_list (Int list) list)
(assert (forall ((x Int)) (= (del_list x Nil) Nil)))
(assert (forall ((x Int) (a Int) (xs list)) (= (del_list x (Cons a xs))
  (ite (= x a) xs (Cons a (del_list x xs))))))

; interval trees
;(declare-fun iisin (itree Int) Bool)
;(assert (forall ((x Int)) (not (iisin ILeaf x))))
;(assert (forall ((l itree) (a Int) (b Int) (r itree) (x Int)) (= (iisin (INode l a b r) x)
;  (match (cmp x a) ((LT (iisin l x)) (EQ true) (GT (iisin r x)))))))

; 2-3 trees
(declare-fun size23 (tree23) Int)
(assert (= (size23 Leaf23) 0))
(assert (forall ((l tree23) (a Int) (r tree23)) (= (size23 (Node2 l a r))
  (+ (size23 l) (size23 r) 1))))
(assert (forall ((l tree23) (a Int) (m tree23) (b Int) (r tree23))
  (= (size23 (Node3 l a m b r)) (+ (size23 l) (size23 m) (size23 r) 1))))
(declare-fun h23 (tree23) Int)
(assert (= (h23 Leaf23) 0))
(assert (forall ((l tree23) (a Int) (r tree23)) (= (h23 (Node2 l a r))
  (+ (max (h23 l) (h23 r)) 1))))
(assert (forall ((l tree23) (a Int) (m tree23) (b Int) (r tree23))
  (= (h23 (Node3 l a m b r)) (+ (max (h23 l) (max (h23 m) (h23 r))) 1))))
(declare-fun complete23 (tree23) Bool)
(assert (complete23 Leaf23))
(assert (forall ((l tree23) (a Int) (r tree23)) (= (complete23 (Node2 l a r))
  (and (= (h23 l) (h23 r)) (complete23 l) (complete23 r)))))
(assert (forall ((l tree23) (a Int) (m tree23) (b Int) (r tree23)) (= (complete23 (Node3 l a m b r))
  (and (= (h23 l) (h23 m)) (= (h23 m) (h23 r)) (complete23 l) (complete23 m) (complete23 r)))))
(declare-fun isin23 (tree23 Int) Bool)
(assert (forall ((x Int)) (not (isin23 Leaf23 x))))
(assert (forall ((x Int) (l tree23) (a Int) (r tree23)) (= (isin23 (Node2 l a r) x)
  (match (cmp x a) ((LT (isin23 l x)) (EQ true) (GT (isin23 r x)))))))
(assert (forall ((x Int) (l tree23) (a Int) (m tree23) (b Int) (r tree23)) (= (isin23 (Node3 l a m b r) x)
  (match (cmp x a) ((LT (isin23 l x)) (EQ true) (GT
  (match (cmp x b) ((LT (isin23 m x)) (EQ true) (GT (isin23 r x))))))))))

(declare-fun inorder23 (tree23) list)
(assert (= (inorder23 Leaf23) Nil))
(assert (forall ((t1 tree23) (a Int) (t2 tree23)) (= (inorder23 (Node2 t1 a t2))
  (append (inorder23 t1) (append (Cons a Nil) (inorder23 t2))))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (inorder23 (Node3 t1 a t2 b t3))
  (append (inorder23 t1) (append (Cons a Nil) (append (inorder23 t2) (append (Cons b Nil) (inorder23 t3))))))))
(declare-fun treeI (upI) tree23)
(assert (forall ((t tree23)) (= (treeI (TI t)) t)))
(assert (forall ((l tree23) (a Int) (r tree23)) (= (treeI (OF l a r)) (Node2 l a r))))
(declare-fun treeD (upD) tree23)
(assert (forall ((t tree23)) (= (treeD (TD t)) t)))
(assert (forall ((t tree23)) (= (treeD (UF t)) t)))
(declare-fun ins (Int tree23) upI)
(assert (forall ((x Int)) (= (ins x Leaf23) (OF Leaf23 x Leaf23))))
(assert (forall ((x Int) (l tree23) (a Int) (r tree23)) (= (ins x (Node2 l a r))
  (match (cmp x a) ((LT (match (ins x l) (((TI ll) (TI (Node2 ll a r)))
                                          ((OF l1 b l2) (TI (Node3 l1 b l2 a r))))))
                    (EQ (TI (Node2 l a r)))
                    (GT (match (ins x r) (((TI rr) (TI (Node2 l a rr)))
                                          ((OF r1 b r2) (TI (Node3 l a r1 b r2)))))))))))
(assert (forall ((x Int) (l tree23) (a Int) (m tree23) (b Int) (r tree23)) (= (ins x (Node3 l a m b r))
  (match (cmp x a) ((LT (match (ins x l) (((TI ll) (TI (Node3 ll a m b r)))
                                          ((OF l1 c l2) (OF (Node2 l1 c l2) a (Node2 m b r))))))
                    (EQ (TI (Node3 l a m b r)))
                    (GT (match (cmp x b) ((LT (match (ins x m) (((TI mm) (TI (Node3 l a mm b r)))
                                                                ((OF m1 c m2) (OF (Node2 l a m1) c (Node2 m2 b r))))))
                                          (EQ (TI (Node3 l a m b r)))
                                          (GT (match (ins x r) (((TI rr) (TI (Node3 l a m b rr)))
                                                                ((OF r1 c r2) (OF (Node2 l a m) b (Node2 r1 c r2))))))))))))))
(declare-fun insert23 (Int tree23) tree23)
(assert (forall ((x Int) (t tree23)) (= (insert23 x t) (treeI (ins x t)))))
(declare-fun hI (upI) Int)
(assert (forall ((t tree23)) (= (hI (TI t)) (h23 t))))
(assert (forall ((l tree23) (a Int) (r tree23)) (= (hI (OF l a r)) (h23 l))))
(declare-fun node21 (upD Int tree23) upD)
(assert (forall ((t1 tree23) (a Int) (t2 tree23)) (= (node21 (TD t1) a t2) (TD (Node2 t1 a t2)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (node21 (UF t1) a (Node2 t2 b t3))
  (UF (Node3 t1 a t2 b t3)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23))
  (= (node21 (UF t1) a (Node3 t2 b t3 c t4)) (TD (Node2 (Node2 t1 a t2) b (Node2 t3 c t4))))))
(declare-fun node22 (tree23 Int upD) upD)
(assert (forall ((t1 tree23) (a Int) (t2 tree23)) (= (node22 t1 a (TD t2)) (TD (Node2 t1 a t2)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (node22 (Node2 t1 a t2) b (UF t3))
  (UF (Node3 t1 a t2 b t3)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23))
  (= (node22 (Node3 t1 a t2 b t3) c (UF t4)) (TD (Node2 (Node2 t1 a t2) b (Node2 t3 c t4))))))
(declare-fun node31 (upD Int tree23 Int tree23) upD)
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (node31 (TD t1) a t2 b t3)
  (TD (Node3 t1 a t2 b t3)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23))
  (= (node31 (UF t1) a (Node2 t2 b t3) c t4) (TD (Node2 (Node3 t1 a t2 b t3) c t4)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23) (d Int) (t5 tree23))
  (= (node31 (UF t1) a (Node3 t2 b t3 c t4) d t5) (TD (Node3 (Node2 t1 a t2) b (Node2 t3 c t4) d t5)))))
(declare-fun node32 (tree23 Int upD Int tree23) upD)
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (node32 t1 a (TD t2) b t3)
  (TD (Node3 t1 a t2 b t3)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23))
  (= (node32 t1 a (UF t2) b (Node2 t3 c t4)) (TD (Node2 t1 a (Node3 t2 b t3 c t4))))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23) (d Int) (t5 tree23))
  (= (node32 t1 a (UF t2) b (Node3 t3 c t4 d t5)) (TD (Node3 t1 a (Node2 t2 b t3) c (Node2 t4 d t5))))))
(declare-fun node33 (tree23 Int tree23 Int upD) upD)
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (node33 t1 a t2 b (TD t3))
  (TD (Node3 t1 a t2 b t3)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23))
  (= (node33 t1 a (Node2 t2 b t3) c (UF t4)) (TD (Node2 t1 a (Node3 t2 b t3 c t4))))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23) (c Int) (t4 tree23) (d Int) (t5 tree23))
  (= (node33 t1 a (Node3 t2 b t3 c t4) d (UF t5)) (TD (Node3 t1 a (Node2 t2 b t3) c (Node2 t4 d t5))))))
(declare-fun split_min23 (tree23) int_upD_pair)
(assert (forall ((a Int)) (= (split_min23 (Node2 Leaf23 a Leaf23)) (iupDp a (UF Leaf23)))))
(assert (forall ((a Int) (b Int)) (= (split_min23 (Node3 Leaf23 a Leaf23 b Leaf23))
  (iupDp a (TD (Node2 Leaf23 b Leaf23))))))
(assert (forall ((l tree23) (a Int) (r tree23)) (= (split_min23 (Node2 l a r))
  (let ((xl (split_min23 l))) (iupDp (iupDp_0 xl) (node21 (iupDp_1 xl) a r))))))
(assert (forall ((l tree23) (a Int) (m tree23) (b Int) (r tree23)) (= (split_min23 (Node3 l a m b r))
  (let ((xl (split_min23 l))) (iupDp (iupDp_0 xl) (node31 (iupDp_1 xl) a m b r))))))
(declare-fun del (Int tree23) upD)
(assert (forall ((x Int)) (= (del x Leaf23) (TD Leaf23))))
(assert (forall ((x Int) (a Int)) (= (del x (Node2 Leaf23 a Leaf23)) (ite (= x a) (UF Leaf23) (TD (Node2 Leaf23 a Leaf23))))))
(assert (forall ((x Int) (a Int) (b Int)) (= (del x (Node3 Leaf23 a Leaf23 b Leaf23))
  (TD (ite (= x a) (Node2 Leaf23 b Leaf23) (ite (= x b) (Node2 Leaf23 a Leaf23) (Node3 Leaf23 a Leaf23 b Leaf23)))))))
(assert (forall ((x Int) (l tree23) (a Int) (r tree23)) (= (del x (Node2 l a r))
  (match (cmp x a) ((LT (node21 (del x l) a r))
                    (EQ (let ((ar (split_min23 r))) (node22 l (iupDp_0 ar) (iupDp_1 ar))))
                    (GT (node22 l a (del x r))))))))
(assert (forall ((x Int) (l tree23) (a Int) (m tree23) (b Int) (r tree23)) (= (del x (Node3 l a m b r))
  (match (cmp x a) ((LT (node31 (del x l) a m b r))
                    (EQ (let ((am (split_min23 m))) (node32 l (iupDp_0 am) (iupDp_1 am) b r)))
                    (GT (match (cmp x b) ((LT (node32 l a (del x m) b r))
                                          (EQ (let ((br (split_min23 r))) (node33 l a m (iupDp_0 br) (iupDp_1 br))))
                                          (GT (node33 l a m b (del x r)))))))))))
(declare-fun delete23 (Int tree23) tree23)
(assert (forall ((x Int) (t tree23)) (= (delete23 x t) (treeD (del x t)))))

(declare-fun len23s (tree23s) Int)
(assert (forall ((t tree23)) (= (len23s (T t)) 1)))
(assert (forall ((t tree23) (a Int) (ts tree23s)) (= (len23s (TTs t a ts)) (+ (len23s ts) 1))))
;(declare-fun trees (tree23s) set)
(declare-fun inorder2 (tree23s) list)
(assert (forall ((t tree23)) (= (inorder2 (T t)) (inorder23 t))))
(assert (forall ((t tree23) (a Int) (ts tree23s)) (= (inorder2 (TTs t a ts)) (append (inorder23 t) (Cons a (inorder2 ts))))))
(declare-fun join_adj (tree23s) tree23s)
(assert (forall ((t1 tree23) (a Int) (t2 tree23)) (= (join_adj (TTs t1 a (T t2))) (T (Node2 t1 a t2)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (t3 tree23)) (= (join_adj (TTs t1 a (TTs t2 b (T t3))))
  (T (Node3 t1 a t2 b t3)))))
(assert (forall ((t1 tree23) (a Int) (t2 tree23) (b Int) (ts tree23s)) (= (join_adj (TTs t1 a (TTs t2 b ts)))
  (TTs (Node2 t1 a t2) b (join_adj ts)))))
(declare-fun join_all (tree23s) tree23)
(assert (forall ((t tree23)) (= (join_all (T t)) t)))
(assert (forall ((ts tree23s)) (= (join_all ts) (join_all (join_adj ts)))))
(declare-fun not_T (tree23s) Bool)
(assert (forall ((ts tree23s)) (= (not_T ts) (forall ((t tree23)) (distinct ts (T t))))))
(declare-fun leaves (list) tree23s)
(assert (= (leaves Nil) (T Leaf23)))
(assert (forall ((a Int) (xs list)) (= (leaves (Cons a xs)) (TTs Leaf23 a (leaves xs)))))
(declare-fun tree23_of_list (list) tree23)
(assert (forall ((xs list)) (= (tree23_of_list xs) (join_all (leaves xs)))))

; red-black trees
(declare-fun R (rbt Int rbt) rbt)
(assert (forall ((l rbt) (a Int) (r rbt)) (= (R l a r) (NodeRB l a Red r))))
(declare-fun B (rbt Int rbt) rbt)
(assert (forall ((l rbt) (a Int) (r rbt)) (= (B l a r) (NodeRB l a Black r))))
(declare-fun color (rbt) color)
(assert (= (color LeafRB) Black))
(assert (forall ((l rbt) (a Int) (c color) (r rbt)) (= (color (NodeRB l a c r)) c)))
(declare-fun paint (color rbt) rbt)
(assert (forall ((c color)) (= (paint c LeafRB) LeafRB)))
(assert (forall ((c color) (l rbt) (a Int) (d color) (r rbt)) (= (paint c (NodeRB l a d r)) (NodeRB l a c r))))
(declare-fun invc (rbt) Bool)
(assert (invc LeafRB))
(assert (forall ((l rbt) (a Int) (c color) (r rbt)) (= (invc (NodeRB l a c r))
  (and (=> (= c Red) (and (= (color l) Black) (= (color r) Black))) (invc l) (invc r)))))
(declare-fun bh (rbt) Int)
(assert (= (bh LeafRB) 0))
(assert (forall ((l rbt) (a Int) (c color) (r rbt)) (= (bh (NodeRB l a c r))
  (ite (= c Black) (+ (bh l) 1) (bh l)))))
(declare-fun invh (rbt) Bool)
(assert (invh LeafRB))
(assert (forall ((l rbt) (a Int) (c color) (r rbt)) (= (invh (NodeRB l a c r))
  (and (= (bh l) (bh r)) (invh l) (invh r)))))
(declare-fun inv_rbt (rbt) Bool)
(assert (forall ((t rbt)) (= (inv_rbt t) (and (invc t) (invh t) (= (color t) Black)))))
(declare-fun baliL (rbt Int rbt) rbt)
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt) (c Int) (t4 rbt))
  (= (baliL (R (R t1 a t2) b t3) c t4) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt) (c Int) (t4 rbt))
  (= (baliL (R t1 a (R t2 b t3)) c t4) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt)) (= (baliL t1 a t2) (B t1 a t2))))
(declare-fun baliR (rbt Int rbt) rbt)
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt) (c Int) (t4 rbt))
  (= (baliR t1 a (R t2 b (R t3 c t4))) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt) (c Int) (t4 rbt))
  (= (baliR t1 a (R (R t2 b t3) c t4)) (R (B t1 a t2) b (B t3 c t4)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt)) (= (baliR t1 a t2) (B t1 a t2))))
(declare-fun insRB (Int rbt) rbt)
(assert (forall ((x Int)) (= (insRB x LeafRB) (R LeafRB x LeafRB))))
(assert (forall ((x Int) (l rbt) (a Int) (r rbt)) (= (insRB x (B l a r))
  (match (cmp x a) ((LT (baliL (insRB x l) a r))
                    (EQ (B l a r))
                    (GT (baliR l a (insRB x r))))))))
(assert (forall ((x Int) (l rbt) (a Int) (r rbt)) (= (insRB x (R l a r))
  (match (cmp x a) ((LT (R (insRB x l) a r))
                    (EQ (R l a r))
                    (GT (R l a (insRB x r))))))))
(declare-fun insertRB (Int rbt) rbt)
(assert (forall ((x Int) (t rbt)) (= (insertRB x t) (paint Black (insRB x t)))))
(declare-fun invc2 (rbt) Bool)
(assert (forall ((t rbt)) (= (invc2 t) (invc (paint Black t)))))

(declare-fun baldL (rbt Int rbt) rbt)
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt))
  (= (baldL (R t1 a t2) b t3) (R (B t1 a t2) b t3))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt))
  (= (baldL t1 a (B t2 b t3)) (baliR t1 a (R t2 b t3)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt) (c Int) (t4 rbt))
  (= (baldL t1 a (R (B t2 b t3) c t4)) (R (B t1 a t2) b (baliR t3 c (paint Red t4))))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt)) (= (baldL t1 a t2) (R t1 a t2))))
(declare-fun baldR (rbt Int rbt) rbt)
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt))
  (= (baldR t1 a (R t2 b t3)) (R t1 a (B t2 b t3)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt))
  (= (baldR (B t1 a t2) b t3) (baliL (R t1 a t2) b t3))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt) (b Int) (t3 rbt) (c Int) (t4 rbt))
  (= (baldR (R t1 a (B t2 b t3)) c t4) (R (baliL (paint Red t1) a t2) b (B t3 c t4)))))
(assert (forall ((t1 rbt) (a Int) (t2 rbt)) (= (baldR t1 a t2) (R t1 a t2))))
(declare-fun split_minRB (rbt) int_rbt_pair)
(assert (forall ((l rbt) (a Int) (c color) (r rbt)) (= (split_minRB (NodeRB l a c r))
  (ite (= l LeafRB) (irp a r) (let ((xl (split_minRB l)))
    (irp (irp_0 xl) (ite (= (color l) Black) (baldL (irp_1 xl) a r) (R (irp_1 xl) a r))))))))
(declare-fun delRB (Int rbt) rbt)
(assert (forall ((x Int) (l rbt) (a Int) (c color) (r rbt)) (= (delRB x (NodeRB l a c r))
  (match (cmp x a) ((LT (let ((ll (delRB x l))) (ite (and (distinct l LeafRB) (= (color l) Black)) (baldL ll a r) (R ll a r))))
                    (EQ (ite (= r LeafRB) l (let ((ar (split_minRB r))) (ite (= (color r) Black)
                      (baldR l (irp_0 ar) (irp_1 ar)) (R l (irp_0 ar) (irp_1 ar))))))
                    (GT (let ((rr (delRB x r))) (ite (and (distinct r LeafRB) (= (color r) Black)) (baldR l a rr) (R l a rr)))))))))
(declare-fun deleteRB (Int rbt) rbt)
(assert (forall ((x Int) (t rbt)) (= (deleteRB x t) (paint Black (delRB x t)))))
