(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 7 *)

open St_tree;;

let is_single t = try
	let _ = branches t in false
	with No_branches -> true;;
	

let left t =
	if (is_single t) then t
	else fst (branches t);;
	
	
let right t =
	if (is_single t) then t
	else snd (branches t);;
	
	
let rec size t = 
	if (is_single t) then 1
	else (size (left t)) + (size (right t)) + 1;;

	
let rec height t = 
	if (is_single t) then 1
	else max (height (left t)) (height (right t)) + 1;;


let rec pre_order t = 
	if (is_single t) then [root t]
	else [root t] @ (pre_order (left t)) @ (pre_order (right t));;
	

let rec post_order t =
	if (is_single t) then [root t]
	else (post_order (left t) @ post_order (right t)) @ [root t];;
	

let rec in_order t =
	if (is_single t) then [root t]
	else (in_order (left t)) @ [root t] @ (in_order (right t));;
	
	
let rec leaves t =
	if (is_single t) then [root t]
	else (leaves (left t)) @ (leaves (right t));;


let rec mirror t =
	if (is_single t) then t
	else comp (root t) (mirror (right t), mirror (left t));;


let rec tree_map f t = 
	if (is_single t) then single (f (root t))
	else comp (f (root t)) (tree_map f (left t), tree_map f (right t));;


