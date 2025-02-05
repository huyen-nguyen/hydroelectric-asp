% Hydroelectric Power Plant Problem

% by Huyen N. Nguyen, project for class CS 4331/5331 
% Special Topics: Intelligent Planning and Diagnosis
% Summer II 2020 - Texas Tech Computer Science

% An agent is controlling a mini hydroelectric power plant used for generating 
% electricity with a gate toggle, artificial rain, and artificial sunshine. 
% The system requires a reservoir connecting to a powerhouse, where the 
% electricity is generated. The reservoir can be full or not full. 
% The weather can be dry or not dry. Water contained in the reservoir is 
% forced through the gate. Gate can be opened or not. When water flows, 
% the resulting high pressure turns a turbine and is converted into power by 
% the generator. The resulting power leaves the powerhouse via cables that carry 
% it over long distances.

% Sunshine causes the reservoir to be not full and the weather to be dry. 
% Rain causes the weather to be not dry. Rain causes the reservoir to be full 
% if the gate is not opened. A toggle controls the gate. When the agent switches 
% the toggle, the gate will change its position from open to closed or closed to 
% open. If the reservoir is full and the gate is not opened, toggle causes water 
% to flow and the reservoir to be not full. There is electricity on the cables 
% if and only if power is available and the weather is dry. 

% The goal is to have electricity on cables.


% Actions:

action(rain).
action(sun).
action(toggle).

% Fluents:

fluent(full).
fluent(dry).
fluent(opened).
fluent(flow).
fluent(electric).


% Laws (first described in English, then in Action Languages and 
% then each followed by the translated ASP rules):

% Dynamic Causal Laws:

% The sun causes the reservoir to be not full.
% sun causes -full.
-holds(full,T+1) :- occurs(sun,T), time(T).

% The sun causes the weather to be dry.
% sun causes dry.
holds(dry,T+1) :- occurs(sun,T), time(T).

% The rain causes the weather to be not dry.
% rain causes -dry.
-holds(dry,T+1) :- occurs(rain,T), time(T).

% The rain causes the reservoir to be full if the gate is not opened.
% rain causes full.
holds(full,T+1) :- time(T),
                   occurs(rain,T), 
                   -holds(opened,T).
                    
% Toggle causes the gate to change position from opened to closed
% toggle causes opened if -opened.
-holds(opened,T+1) :- time(T),
                      occurs(toggle,T), 
                      holds(opened,T).

% Toggle causes the gate to change position from closed to opened
% toggle causes -opened if opened.
holds(opened,T+1) :- time(T),
                     occurs(toggle,T), 
                     -holds(opened,T).
                      
% Toggle causes flow if the reservoir is full and the gate is not opened
% toggle causes flow if full, -opened.
holds(flow,T+1) :- time(T),
                   occurs(toggle,T), 
                   holds(full,T),
                   -holds(opened,T).
                      
% Toggle causes not full if the reservoir is full and the gate is not opened
% toggle causes -full if full, -opened.
-holds(full,T+1) :- time(T),
                    occurs(toggle,T), 
                    holds(full,T),
                    -holds(opened,T).                    
                      
% State constraints 

% The reservoir is not full if the gate is opened
% -full if opened.
-holds(full,T) :- holds(opened,T), time(T).

% The reservoir is not full if the weather is dry
% -full if dry.
-holds(full,T) :- holds(dry,T), time(T).

% There is no flow if gate is not opened
% -flow if -opened.
-holds(flow,T) :- time(T),
                  -holds(opened,T). 

% There is electricity if water flows and weather is dry
% electric if flow, dry.
holds(electric,T) :- time(T),
                     holds(flow,T),
                     holds(dry,T).
                      
% There is no electricity if there is no water flows
% -electric if -flow.
-holds(electric,T) :- time(T),
                      -holds(flow,T).
                                            
% There is no electricity if weather is not dry
% -electric if -dry.
-holds(electric,T) :- time(T),
                      -holds(dry,T).     
                      
                      