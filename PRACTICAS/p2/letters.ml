(* INES FARO PEREZ - GRUPO 1.2 *)
(* PRACTICA 2: *)

let lowercase c = 
	let num = int_of_char c in
		if num >= 65 && num <= 90 then char_of_int (num + 32)
		else c;;

let uppercase c = 
	let num = int_of_char c in
		if num >= 97 && num <= 122 then char_of_int (num - 32)
		else c;;
		