#load "turno.cmo";;
open turno;;
let s = function p -> p + snd p;;
let s = function x,y -> x + y;;
let fst = function x,y -> x;;
let snd = function x,y -> y;;
snd (2,true);;
let snd = function _,y -> y;;
let fst = function x,_ -> x;;
let p = 2,3;;
let x,y = p;; (*pattern-matching*)
let x,y = 2+1;; (*error*)
3,2,true;; 
fst (1,2,true);; (*error*)
let pi = 2 *. asin 1. in pi *. (pi *. 1.);;
let cir = function r -> 4. *. asin 1. *. r;;
let cir = function r -> let dp = 4. *. asin 1. in dp *. r;;
let cir = let dp = 4. *. asin 1. in function r -> dp *. r;; (*es la forma mas eficiente de hacerlo*)
(*en funcional no hay variables, importantisimo*)

