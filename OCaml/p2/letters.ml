(* Daniel Boubeta Portela - Grupo 4.1 *)

let lowercase c = char_of_int ((int_of_char c) + 32);;

let uppercase c = char_of_int ((int_of_char c) - 32);;

(* MEJOR VERSION *)

let lowercase c = 
	let num = int_of_char c in
		if num >= 65 && num <= 90 then char_of_int (num + 32)
		else c;;

let uppercase c = 
	let num = int_of_char c in
		if num >= 97 && num <= 122 then char_of_int (num - 32)
		else c;;
		
