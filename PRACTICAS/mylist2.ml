(* INES FARO PEREZ - GRUPO 1.2 *)
(* Práctica 5: *)

let hd = function
	  [] -> raise (Failure "hd")
	| h::_ -> h;;
(*CORRECTO*)
(* ======================================= *)

let tl = function
	  [] -> raise (Failure "tl")
	| _::t -> t;;
(*CORRECTO*)
(* ======================================= *)

let length lista =
	let rec aux i l = match l with
		  [] -> i
		| (h::t) -> aux (i+1) t
	in aux 0 lista;;
		
(* ======================================= *)

let compare_lengths l1 l2 =
	if length l1 < length l2 then -1
	else if length l1 > length l2 then 1
	else 0;; 
(*¡¡¡¡¡¡¡¡¡¡¡INCORRECTA!!!!!!!!!!!!!!!*)
(* ======================================= *)

let nth lista n = match lista, n with
	  [], _ -> raise (Failure "nth")
	| _, n when n < 0 -> raise (Invalid_argument "nth")
	| (h::t), n ->
	let rec aux l i =
		if n = i then hd l
		else aux (tl l) (i+1)
	in aux lista 0;;
(*CORRECTO*)

(* ======================================= *)

let rec append l1 l2 = 
if l1=[] then l2
else (hd l1)::(append(tl l1) l2);;

		
(* ======================================= *)

let rec init n f = match n with 
	0 -> [] 
	| _ -> append(init (n-1)f)[f (n-1)];;
	(*| n < 0 -> raise (Invalid_argument "init")*)

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
(*CORRECTO*)

(* ======================================= *)


let rec concat = function
  [] -> []
| h::t -> append h (concat t);;
		
(* ======================================= *)

let flatten = concat;;

(* ======================================= *)

let map f l = 
	let rec aux l1 l2 = match l1 with
		  [] -> rev l2
		|(h::t) -> aux t ((f h)::l2)
	in aux l [];;

(* ======================================= *)

let rev_map f l = map f (rev l);;
(*CORRECTO*)

(* ======================================= *)

let map2 f l1 l2 = 
	let rec aux l1 l2 l3 = match l1,l2 with
		  [],[] -> l3
		| [],_ -> raise (Invalid_argument "map2")
		| _,[] -> raise (Invalid_argument "map2")
		|(h1::t1),(h2::t2) -> (f h1 h2)::(aux t1 t2 l3)
	in aux l1 l2 [];;
	(*CORRECTO*)

(* ======================================= *)

let rec fold_left f a = function
  [] -> a
| h::t -> fold_left f (f a h) t;;
(*CORRECTO*)
(* ======================================= *)

let rec fold_right f l a =
  match l with
   [] -> a
 | h::t -> f h (fold_right f t a);;

(* ======================================= *)

let rec find p = function
  [] -> raise Not_found
| h::t -> if p h then h else find p t;;	
(*CORRECTO*)

(* ======================================= *)

let rec for_all p = function
  [] -> true
| h::t -> (p h) && (for_all p t);;

(* ======================================= *)

let rec exists p = function
  [] -> false
| h::t -> (p h) || (exists p t);;


(* ======================================= *)

let rec mem a = function
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

let find_all  = filter;;

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
(*CORRECTO*)
