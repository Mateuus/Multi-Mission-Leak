/*-----------------------------------------------------------------------------

       Author: G00golplexian
       Name: fn_toilet.sqf
       Description: Erstmal kacken...

------------------------------------------------------------------------------*/
private["_toilet"];

_toilet = _this select 0;

if(_toilet getvariable "toiletInUse") exitWith {hint "Diese Toilette wird gerade benutzt."};
if(([false,"toiletpaper",1] call life_fnc_handleInv)) then {
	_toilet setVariable ["toiletInUse",true,true];

	player switchCamera "INTERNAL";
	player attachto [_toilet,[0,0.3,-1.25]];
	player setdir 180;
	player attachto [_toilet,[0,0.3,-1.25]];
	player setdir 180;	
	[player,"BasicDriver"] remoteExecCall ["switchmove",0];
	sleep 2;
	_toilet animate ["door_1_rot",0];
	sleep 10;
	_toilet say3D "toilet";
	_toilet animate ["door_1_rot",1];
	sleep 2;
	[player,""] remoteExecCall ["switchmove",0];
	detach player;
	player setpos (player modeltoworld [0,1,0]);
	player switchCamera "EXTERNAL";
	
	_toilet setVariable ["toiletInUse",false,true];
	
	if(!erfolg_toilet) then {erfolg_toilet = true; ["erfolg_toilet"] spawn life_fnc_erfolgerhalten;};
	
	hint "Du fühlst dich total erleichtert!";
	if(life_zustand == "Harndrang") then {life_zustand = "Gesund"; player allowSprint true};
	life_toilet = 0;
	[] call life_fnc_hudupdate;
} else {
	hint "Du benötigst Toilettenpapier für einen Toilettengang!"
};
