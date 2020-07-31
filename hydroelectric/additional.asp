% Hydroelectric Power Plant Problem
% by Huyen N. Nguyen, project for class CS 4331/5331 
% Special Topics: Intelligent Planning and Diagnosis
% Summer II 2020 - Texas Tech Computer Science

% Heuristics 

% There is no point to toggle after the sun shines, because there is no water
:- occurs(sun,T), occurs(toggle,T+1), time(T), time(T+1).

% There should not be rain right after sun:
:- occurs(sun,T), occurs(rain,T+1), time(T), time(T+1).

% There should not be sun right after rain:
:- occurs(rain,T), occurs(sun,T+1), time(T), time(T+1).

% Inertia Axioms 

holds(F,T+1) :- fluent(F), time(T), holds(F,T), not -holds(F,T+1).
-holds(F,T+1) :- fluent(F), time(T), -holds(F,T), not holds(F,T+1).

% In this instance the reservoir is initially not full. The weather is dry. 
% The gate is opened. There is no flow, no electric on the cables.

-holds(full,0).
holds(dry,0).
holds(opened,0).
-holds(flow,0).
-holds(electric,0).

% Goal is there is electric on the cables.

goal(T) :- holds(electric,T), time(T).

time(0..4).