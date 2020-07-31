// Take a shit
_currentuniform = Uniform player;
disableUserInput true;
life_action_inUse = true;

player playmove "AmovPercMstpSnonWnonDnon_exercisekneeBendA";  
[player,"fart4"] spawn life_fnc_nearestSound;    
uiSleep 2;  
player enablesimulation false;   
[player,"fart5"] spawn life_fnc_nearestSound; 
uiSleep 2;    
player enablesimulation true; 
uisleep 1; 
_poopvehicle = createVehicle ["cg_human_poop", (player), [], 0, "NONE"];
_poopvehicle setpos (getpos player);
player switchmove "";

life_dirt = life_dirt + 10;
life_poop = 0;
if(_currentuniform != "") then {
	["Zesrales sie w gacie Ty idioto.. zanim zrobisz gowno sciagnij spodnie!", false] spawn domsg;
	life_dirt = 100;
	life_poop = 50;
	player setfatigue 1;	
};

life_action_inUse = false;
disableUserInput false;
uisleep 5;
deletevehicle _poopvehicle;

