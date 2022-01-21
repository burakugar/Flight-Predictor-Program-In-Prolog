%all routes for the given flights */
flight(istanbul,izmir,2).        
flight(istanbul,ankara,1).   
flight(istanbul,rize,4). 
flight(ankara,rize,5). 
flight(ankara,van,4).
flight(gaziantep,van,3).
flight(canakkale,erzincan,6).
flight(erzincan,antalya,3).
flight(izmir,antalya,2).
flight(antalya,diyarbakir,4).
flight(izmir,ankara,6).
flight(ankara,diyarbakir,8).
% because the routes are mutual, we can change the direction of the route 
tied(X,Y,C) :- 
	flight(X,Y,C) ; flight(Y,X,C).
route(X,Y,C) :-
    flight(X,Y,C).

route(X,Y,C) :-   %finds the right route, after finding that, it returns the total cost 
	route(X,Y,C,[],[]). 

route(K,L,C,LIST,Z) :-  %Z is the list for checking the repeating elements 
%using recursion to handle head and tail elements,  we are taking the head of the list and check it's available routes 
	tied(K,L,C) ; not(member(K,LIST)), not(member(K,Z)),
	tied(K,B,C2),
	not(B=K),
	route(B,L,C3,[K|LIST],Z),not(member(B,LIST)),not(K=LIST),not(member(B,Z)), 
	C is C2 + C3.