(* INES FARO PEREZ - GRUPO 1.2 *)
(* Práctica 4: *)

let hd = function
	  [] -> raise (Failure "hd")
	| h::_ -> h;;

(* ======================================= *)

let tl = function
	  [] -> raise (Failure "tl")
	| _::t -> t;;

(* ======================================= *)

let rec length = function
	  [] -> 0
	| _::t -> 1 + length t;;
		
(* ======================================= *)

let compare_lengths l1 l2 =
	if length l1 < length l2 then -1
	else if length l1 > length l2 then 1
	else 0;; 

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

let rec append l1 l2 = 
if l1=[] then l2
else (hd l1)::(append(tl l1) l2);;

		
(* ======================================= *)

let rec init n f = match n with 
	0 -> [] 
	| _ -> append(init (n-1)f)[f (n-1)];;

(* ======================================= *)

let rec rev = function
  [] -> []
| h::t -> append (rev t) [h];;


(* ======================================= *)

let rec rev_append l1 l2 = match l1 with
	  [] -> l2
	| (h::t) -> rev_append t (h::l2);;

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

(* ======================================= *)

let map2 f l1 l2 = 
	let rec aux l1 l2 l3 = match l1,l2 with
		  [],[] -> l3
		| [],_ -> raise (Invalid_argument "map2")
		| _,[] -> raise (Invalid_argument "map2")
		|(h1::t1),(h2::t2) -> (f h1 h2)::(aux t1 t2 l3)
	in aux l1 l2 [];;

(* ======================================= *)

let rec fold_left f a = function
  [] -> a
| h::t -> fold_left f (f a h) t;;
	
(* ======================================= *)

let rec fold_right f l a =
  match l with
   [] -> a
 | h::t -> f h (fold_right f t a);;

(* ======================================= *)

let rec find p = function
  [] -> raise Not_found
| h::t -> if p h then h else find p t;;	

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

let rec filter p = function
  [] -> []
| h::t -> if (p h) then h::(filter p t)
			else (filter p t);;

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

