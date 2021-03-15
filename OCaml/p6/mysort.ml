(* Daniel Boubeta Portela - Grupo 4.1 *)
(* Práctica 6 *)

let rlist_t r n =
	if n <= 0 then [] else 
	let rec aux i lout = 
		if i == 0 then lout
		else aux (i-1) (Random.int r::lout)
	in aux n [];;
	
(* ======================================= *)

let insert_t x l =
	let rec aux x l l2 flag = match l,flag with
		| _,false -> List.rev_append l2 l
		| [],_ -> List.rev_append  l2 [x]
		| h::t, true -> if x<=h then aux x t (h::x::l2) false
					    else aux x t (h::l2) true
							in aux x l [] true;;
	
	
let isort_t l = 
	let rec aux l i = match l with
		[] -> i
		| h::t -> aux t (insert_t h i)in aux l [];;

(* ======================================= *)

let divide_t l = 
	let rec aux lin lout1 lout2 = match lin with
		  [] -> List.rev(lout1),List.rev(lout2)
		| (h1::[]) -> aux [] (h1::lout1) lout2
		| (h1::h2::t) -> aux t (h1::lout1) (h2::lout2)
	in aux l [] [];;	
	
	
let merge_t l1 l2 = 
	let rec aux lin1 lin2 lout = match lin1,lin2 with
		  l, [] | [], l -> List.rev_append lout l
		| (h1::t1),(h2::t2) ->
		if h1<=h2 then aux t1 lin2 (h1::lout)
		else aux lin1 t2 (h2::lout)
	in aux l1 l2 [];;


let rec msort_qt l = match l with
	[] | [_] -> l
	| _ -> let l1,l2 = divide_t l in
		merge_t (msort_qt l1) (msort_qt l2);;
	

(* ======================================= *)

let filter p l =
	let rec aux l1 l2 = match l1 with
		  [] -> List.rev l2
		| (h::t) ->
		if p h then aux t (h::l2)
		else aux t l2
	in aux l [];;
	
	
let partition p l = (filter p l),(filter (fun x -> not(p x)) l);;


let rec qsort_qt l = match l with
	[] | [_] -> l
	| h::t -> let l1,l2 = partition ((<=) h) t in
		List.rev_append (List.rev(qsort_qt l2)) (h::qsort_qt l1);;

(* ======================================= *)

let insert_gen_t f x l =
	let rec aux f x l l2 flag = match l,flag with
		| _,false -> List.rev_append l2 l
		| [],_ -> List.rev_append  l2 [x]
		| h::t, true -> if f x h then aux f x t (h::x::l2) false
						else aux f x t (h::l2) true
							in aux f x l [] true;;


let rec isort_gen f = function
	|[] -> []
	| h::t -> insert_gen_t f h (isort_gen f t);;

	
let isort_t_gen f l = 
	let rec aux f l i = match l with
		| [] -> i
		| h::t -> aux f t (insert_gen_t f h i)
			in aux f l [];;

let merge_gen_t f l1 l2 = match l1,l2 with
	  [], [] -> []
	| [], l | l,[] -> l
	| h1::t1, h2::t2 -> let rec aux f l1 l2 i = match l1,l2 with
							[h], [] | [], [h] -> List.rev (h::i)
							| [], h::t -> aux f [] t (h::i)
							| h::t,[] -> aux f t [] (h::i)
							| h1::t1, h2::t2 -> if f h1 h2 then aux f t1 l2 (h1::i)
												else aux f l1 t2 (h2::i)
													in aux f l1 l2 [];;
						
			
let rec msort_gen f l = match l with
	[] | [_] -> l
	| _ -> let l1,l2 = 
				divide_t l 
			in merge_gen_t f (msort_gen f l1) (msort_gen f l2);;


let rec msort_qt_gen f l = match l with
	| [] -> []
	| [h] -> [h]
	| _ -> let drch, izq =
				divide_t l
			in merge_gen_t f (msort_qt_gen f drch) (msort_qt_gen f izq);;
			
			
let rec qsort_gen f l = match l with
	[] | [_] -> l
	| h::t-> let l1,l2 = 
				List.partition ((f) h) t 
			in (qsort_gen f l2) @ (h::qsort_gen f l1);;
						
		
let rec qsort_qt_gen f l = match l with
	[] | [_] -> l
	| h::t-> let l1,l2 = 
				List.partition (f h) t 
			in let append l1 l2 =
				List.rev_append (List.rev l1) l2
			in append (qsort_qt_gen f l2) (h::qsort_qt_gen f l1);;

(* ======================================= *)


	



				



