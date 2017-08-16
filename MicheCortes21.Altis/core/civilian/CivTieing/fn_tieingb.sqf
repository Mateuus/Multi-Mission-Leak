/*
	fn_tieingb.sqf
*/

params [["_civ", Objnull, [Objnull]]];
if(isNull _civ) exitWith {};

//Monitor excessive blindfolding
[] spawn
{
	private["_time"];
	while {true} do
	{
		uisleep 5;
		
		if(!(player getVariable["blindfolded", false])) exitWith {};

		if(!(player getVariable["tied", false])) exitwith {
			player setVariable["blindfolded", nil, true];
			hint "Du hast es geschafft, die Augenbinde zu entfernen!";
		};

		if(!([east,getPos player,50] call life_fnc_nearUnits) && !([civilian,getPos player,50] call life_fnc_nearUnits) && (player getVariable["blindfolded", false]) && isNull objectParent player) exitWith {

			player setVariable["blindfolded", nil, true];
			"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
			"colorCorrections" ppEffectCommit 3;
			"colorCorrections" ppEffectEnable false;	
			hint "Du hast es geschafft, die Augenbinde zu entfernen!";
		};
	};
};

cutText ["Augenbinde entfernt","PLAIN",2];	

cutText["Deine Augen sind verbunden.","PLAIN",0,true];

"colorCorrections" ppEffectEnable true;			
"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
"colorCorrections" ppEffectCommit 0.3;

removeHeadGear player;
player addheadgear "mgsr_headbag";

[] spawn {
	while {true} do
	{	
		if(!(player getvariable ["blindfolded", false])) exitWith {
			cutText ["Deine Augen sind nicht mehr Verbunden!","PLAIN",2];	
			player setVariable ["blindfolded", nil, true];
		};
		if(deadPlayer) exitWith
		{
			cutText ["Deine Augen sind nicht mehr Verbunden!","PLAIN",2];	
			player setVariable ["blindfolded", nil, true];
		};

		if(vehicle player != player) then
		{
			if(driver (vehicle player) == player) then {
				player action["eject",vehicle player]
			};
		};
		uiSleep 1;
		"colorCorrections" ppEffectEnable true;			
		"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 0.01],  [0, 0, 0, 0.0]]; 
		"colorCorrections" ppEffectCommit 0.3;
	};

	"colorCorrections" ppEffectAdjust [1, 1, -0.003, [0.0, 0.0, 0.0, 0.0], [1, 1, 1, 1],  [0, 0, 0, 0.0]]; 
	"colorCorrections" ppEffectCommit 3;
	"colorCorrections" ppEffectEnable false;	

	removeHeadGear player;
	if(!deadPlayer) then
	{
		player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
		player setVariable ["blindfolded", nil, true];
		detach player;
	};
};