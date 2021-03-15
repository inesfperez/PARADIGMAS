(* Daniel Boubeta Portela  - Grupo 4.1 *)
(* Práctica 2 *)

let x = 1;;
(* int = 1 *)


let y = 2;;
(* int = 2 *)


x - y;;
(* int = -1 *)


let x = y in x - y;;
(* int = 0 *)


x - y;;
(* int -1 *)


(*z;;*)
(* Error, z no definida *)


let z = x + y;;
(* int = 3 *)


z;;
(* int = 3 *)


let x = 5;;
(* int = 5 *)


z;;
(* int = 3 *)


let y = 5 in x + y;;
(* int = 6 *)


x + y;;
(* int = 3 *)


let p = 2,5;;
(* int*int = (2,5) *)


snd p, fst p;;
(* int*int = (5,2) *)


p;;
(* int * int = (2,5) *)


let p = 0,1 in snd p, fst p;;
(* int * int = (1,0) *)


p;;
(* int * int = (2,5) *)


let x,y = p;;
(* x:int = 2, y:int = 5 *)


let z = x + y;;
(* int = 7 *)


let x,y = p,x;;
(* x: int * int = (2,5) , y:int = 2 *)


let x = let x,y = 2,3 in x * x + y;;
(* int = 7 *)


x + y;;
(* int = 9 *)


z;;
(* int = 7 *)


let x = x + y in let y = x * y in x + y +z;;
(* int = 34 *)


x + y + z;;
(* int = 16 *)


int_of_float;;
(* float -> int (Funcion) *)


float_of_int;;
(* int -> float (Funcion) *)


int_of_char;;
(* char -> int (Funcion) *)


char_of_int;;
(* int -> char (Funcion) *)


abs;;
(* int -> int (Funcion) *)


sqrt;;
(* float -> float (Funcion) *)


truncate;;
(* float -> int (Funcion) *)


ceil;;
(* float -> float (Funcion) *)


floor;;
(* float -> float (Funcion) *)


Char.code;;
(* char -> int (Funcion) *)


String.length;;
(* string -> int (Funcion) *)


fst;;
(* a' * b' -> a' (Funcion) *)


snd;;
(* a' * b' -> b' (Funcion) *)


function x -> 2 * x;;
(* int -> int *)


(function x -> 2 * x) (2 + 1);;
(* int = 6 *)


function (x,y) -> x;;
(* a' * b' -> a' *)


let f = function x -> 2 * x;;
(* int -> int *)


f (2+1);;
(* int = 6 *)


f 2 + 1;;
(* int = 5 *)


let n = 10;;
(* int = 10 *)


let sum n = function x -> n + x;;
(* int -> int -> int *)


sum 5;;
(* int -> int *)


sum 1 2;;
(* int = 3 *)


let n = 1;;
(* int = 1 *)


sum n 10;;
(* int = 11 *)


let sumn = sum n;;
(* int -> int *)


sumn 100;;
(* int = 101 *)


let n = 1000;;
(* int = 1000 *)


sumn 100;;
(* int = 101 *)


