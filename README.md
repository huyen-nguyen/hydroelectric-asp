# hydroelectric-asp

Planning domain models via action languages translated to Answer sets.

An agent is controlling a mini hydroelectric power plant used for generating electricity with a gate toggle, artificial rain and sunshine. 
The system requires a reservoir connecting to a powerhouse, where the electricity is generated.
The reservoir can be full or not full. Water contained in the reservoir is forced through a gate.
Sunshine causes the reservoir to be empty (not full) and the weather to be dry. 
Rain causes the weather not dry.
Rain causes the reservoir to be full if the gate is not opened. 
The gate is controlled by a toggle. When the agent switches the toggle, 
the gate will change its position from open to closed or closed to open, 
then water will flow down through the gate. 
Toggle causes water to flow and reservoir to be not full if the reservoir is full and gate is not opened. 
When water flows, the resulting high pressure turns a turbine, converted into power by the generator. 
The resulting power leaves the powerhouse via cables that carry it over long distances; 
there is electricity on the cables if power is available and the weather is dry. 

The goal is to have electricity on cables.
