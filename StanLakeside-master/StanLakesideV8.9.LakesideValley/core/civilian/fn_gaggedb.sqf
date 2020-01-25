/*

*/
private["_civ"];
_civ = param [0,Objnull,[Objnull]];
if(isNull _civ) exitWith {};

//Monitor excessive gag
[] spawn
{
	private["_time"];
	while {true} do
	{
		uisleep 5;
		_chance = round (random 100);
		if(_chance > 98) then {
			[player,"gagged"] spawn life_fnc_nearestSound;

		};
		if(!(player getVariable["gagged", false])) exitWith {};
		if(!(player getVariable["tied", false])) exitwith {
			player setVariable["gagged", nil, true];
			player setVariable ["tf_voiceVolume", 1, true];
			["Udalo Ci sie wypluc skarpete!", false] spawn domsg;
		};

		if(!([east,getPos player,50] call life_fnc_nearUnits) && !([civilian,getPos player,50] call life_fnc_nearUnits) && (player getVariable["gagged", false]) && isNull objectParent player ) exitWith {

			player setVariable["gagged", nil, true];
			player setVariable ["tf_voiceVolume", 1, true];
			["Udalo Ci sie wypluc skarpete!", false] spawn domsg;
		};
	};
};

["Wlozono Ci skarpete do buzi.",true] spawn domsg;
player setVariable ["tf_voiceVolume", 0, true];
while { true } do
{	
	if(!(player getvariable ["gagged", false])) exitWith {
		["Wyjeto Ci skarpete z buzi.",true] spawn domsg;
		player setVariable ["tf_voiceVolume", 1, true];
		player setVariable ["gagged", nil, true];
	};
	if(deadPlayer) exitWith
	{
		["Wyjeto skarpete z buzi.",true] spawn domsg;
		player setVariable ["tf_voiceVolume", 1, true];
		player setVariable ["gagged", nil, true];
	};
	uiSleep 1;
};

removeHeadGear player;
if(!deadPlayer) then
{
	player setVariable ["gagged", nil, true];
	player setVariable ["tf_voiceVolume", 1, true];
	detach player;
};