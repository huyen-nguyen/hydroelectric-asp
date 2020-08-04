% Basic ASP Planner

% Hydroelectric Power Plant Problem
% by Huyen N. Nguyen, project for class CS 4331/5331 
% Special Topics: Intelligent Planning and Diagnosis
% Summer II 2020 - Texas Tech Computer Science

% Requires that the goal being true at some time T is specified
% in the problem instance.

goal :- goal(T), time(T).
:- not goal.
1{occurs(A,T):action(A)}1 :- not goal(T), time(T).

% #show occurs/2.