(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 7 *)

type 'a bin_tree =
	Empty
	| Node of 'a * 'a bin_tree * 'a bin_tree;;

exception No_branches;;

(* ============================================================== *)

let empty = Empty;;


let comp r (i,d) = Node (r,i,d);;


let root = function
	  Empty -> raise No_branches
	| Node (r,i,d) -> r;;


let branches = function
	  Empty -> raise No_branches
	| Node (r,i,d) -> (i,d);;


let is_empty = function
	  Empty -> true
	| Node _ -> false;;
	
	
let left = function
	  Empty -> raise No_branches
	| Node (r,i,d) -> i;;


let right = function
	  Empty -> raise No_branches
	| Node (r,i,d) -> d;;


let rec size = function
	  Empty -> 1
	| Node (r,i,d) -> (size i) + (size d) + 1;;
	
	
let rec height = function
	  Empty -> 1
	| Node (r,i,d) -> (max (height i) (height d)) + 1;;


let rec pre_order = function
	Empty -> []
	| Node (r,i,d) -> r::(pre_order i) @ (pre_order d);;
	

let rec post_order = function
	Empty -> []
	| Node (r,i,d) -> (post_order i) @ (post_order d) @ [r];;
	
let rec in_order = function
	Empty -> []
	| Node (r,i,d) -> ((in_order i) @ [r]) @ (in_order d);;


let rec leaves = function 
	  Empty -> []
	| Node (r,Empty,Empty) -> [r]
	| Node (r,i,d) -> leaves i @ leaves d;;

	
let mirror = function
	  Empty -> Empty
	| Node (r,i,d) -> Node (r,d,i);;

	
let rec tree_map f = function
	  Empty -> Empty
	| Node (r,i,d) -> Node (f r, (tree_map f i), (tree_map f d));;


