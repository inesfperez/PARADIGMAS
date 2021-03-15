(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 3 *)

let hd = function
	  [] -> raise (Failure "hd")
	| (h::_) -> h;;

(* ======================================= *)

let tl = function
	  [] -> raise (Failure "tl")
	| (_::t) -> t;;

(* ======================================= *)

let rec length = function
	  [] -> 0
	| (h::t) -> 1 + (length t);;
		
(* ======================================= *)

let nth lista n = match lista, n with
	  [], _ -> raise (Failure "nth")
	| _, n when n < 0 -> raise (Invalid_argument "nth")
	| (h::t), n ->
	let rec aux l i =
		if n = i then hd l
		else aux (tl l) (i+1)
	in aux lista 0;;

(* ======================================= *)

let rec append l1 l2 = match l1 with
	  [] -> l2
	|(h::t) -> h::(append t l2);;
		
(* ======================================= *)

let rev lista = 
	let rec aux l1 l2 = match l1 with
		  [] -> l2
		| (h::t) -> aux t (h::l2)
	in aux lista [];;

(* ======================================= *)

let rec rev_append l1 l2 = match l1 with
	  [] -> l2
	| (h::t) -> rev_append t (h::l2);;

(* ======================================= *)

let rec concat lista = match lista with
	  [] -> []
	| (h::[]) -> h
	| (h::t) -> append h (concat t);;
		
(* ======================================= *)

let flatten lista = concat lista;;

(* ======================================= *)

let map f l = 
	let rec aux l1 l2 = match l1 with
		  [] -> rev l2
		|(h::t) -> aux t ((f h)::l2)
	in aux l [];;

(* ======================================= *)

let map2 f l1 l2 = 
	let rec aux l1 l2 l3 = match l1,l2 with
		  [],[] -> l3
		| [],_ -> raise (Invalid_argument "map2")
		| _,[] -> raise (Invalid_argument "map2")
		|(h1::t1),(h2::t2) -> (f h1 h2)::(aux t1 t2 l3)
	in aux l1 l2 [];;

(* ======================================= *)

let rec fold_left f a l = match a,l with
	  a, [] -> a
	| a, (h::t) -> fold_left f (f a h) t;;
	
(* ======================================= *)

let rec fold_right f l b = match l,b with
	  [], b -> b
	| (h::t), b -> f h (fold_right f t b);;

(* ======================================= *)

let rec find p l = match l with
	  [] -> raise (Not_found)
	| (h::t) ->
		if p h then h
		else find p t;;

(* ======================================= *)

let rec for_all p l = match l with
	  [] -> true
	| (h::t) ->
		if p h then for_all	p t
		else false;;

(* ======================================= *)

let rec exists p l = match l with
	  [] -> false
	| (h::t) ->
		if p h then true
		else exists p t;;

(* ======================================= *)

let rec mem a l = match l with
	  [] -> false
	| (h::t) ->
		if a = h then true
		else mem a t;;

(* ======================================= *)

let filter p l =
	let rec aux l1 l2 = match l1 with
		  [] -> rev l2
		| (h::t) ->
		if p h then aux t (h::l2)
		else aux t l2
	in aux l [];;

(* ======================================= *)

let find_all p l = filter p l;;

(* ======================================= *)

let partition p l = (filter p l),(filter (fun x -> not(p x)) l);;

(* ======================================= *)

let split l =
	let rec aux l1 l2 l3 = match l1 with
		  [] -> (rev l2),(rev l3)
		| (a,b)::t -> aux t (a::l2) (b::l3)
	in aux l [] [];;

(* ======================================= *)

let combine l1 l2 =
	let rec aux lista1 lista2 lista3 = match lista1, lista2 with
		  [],[] -> rev lista3
		| [],_ -> raise (Invalid_argument "combine")
		| _,[] -> raise (Invalid_argument "combine")
		| (h1::t1),(h2::t2) -> aux t1 t2 ((h1,h2)::lista3)
	in aux l1 l2 [];;

