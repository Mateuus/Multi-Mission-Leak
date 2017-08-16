scopeName "spikestrip";
/*
	File: fn_spikeStrip.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Creates a spike strip and preps it.
*/
private["_position","_spikeStrip"];
closeDialog 0;
_allowMoveDistance = 10;
if(life_isPlacing) exitWith {};
	hintSilent "Use Windows Key to Place the Spike Strip!;";
	[] spawn {
		_allowMoveDistance = 10;
		_spikeStrip = createVehicle ["Land_Razorwire_F", [0,0,0], [], 0, "NONE"];
		_spikeStrip attachTo[player,[0,5.5,-0.5]];
		_spikeStrip setDir 90;
		_spikeStrip setVariable["item","objectDeployed",true];
		life_isPlacing = true;
		life_objectPlacing = _spikeStrip;
		_originalPos = position _spikeStrip;
		_playerOriginalPos = position player;
		waitUntil{if(!alive player || vehicle player != player) then {call life_fnc_prathutuwr;};};
		//breakout "spikestrip";
	};
