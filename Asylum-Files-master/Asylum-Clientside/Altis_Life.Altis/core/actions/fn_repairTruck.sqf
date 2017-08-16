/*
	File: fn_repairTruck.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Main functionality for toolkits, to be revised in later version.
*/
private["_veh","_delay","_consume","_rand"];
_veh = cursorTarget;
if(isNull _veh) exitwith {};
if((_veh isKindOf "Car") OR (_veh isKindOf "Ship") OR (_veh isKindOf "Air")) then
{
		_delay = 0.27; // sec per 1 percent
		if (!("ToolKit" in (items player)) && !(114 in life_talents) && !(83 in life_talents)) then { _delay = _delay * 4; };
		if ((66 in life_talents) || (84 in life_talents)) then { _delay =  _delay - 0.1; };
	
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Repairing %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		_success = false;
		_started = getPosATL player;
		
		life_action_in_use = true;
		
		[[player,"Acts_carFixingWheel","playNow",21],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		
		while{true} do
		{
			if(!isNull findDisplay 602) exitWith {};
			sleep _delay;
			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];
			if(_cP >= 1) exitWith {_success = true};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(player distance _started > 2 || speed player > 2) exitWith {};
			if(player distance _veh > 5) exitWith {};
			if(player getVariable ["downed",false]) exitWith {};
			if (!life_action_in_use) exitWith {};
		};
		
		[[player,""],"life_fnc_animSync",true,false] spawn life_fnc_MP;
		
		5 cutText ["","PLAIN"];
		life_action_in_use = false;
		
		if (!_success) exitWith { hint "Your repair has been interrupted and failed." };
		
		_consume = true;
		if ((67 in life_talents)) then
		{
			_rand = floor (random 4);
			if (_rand == 0) then { _consume = false; };			
		};
		if (_consume && playerSide != west) then
		{
			player removeItem "ToolKit";
			titleText["You have repaired that vehicle.","PLAIN"];
		}
		else
		{
			titleText["You have repaired that vehicle without even scratching your tools.","PLAIN"];
		};
		_veh setDamage 0;
		
		life_experience = life_experience + 2;
		//[[40, player, format["Repaired vehicle %1", typeOf _veh]],"ASY_fnc_logIt",false,false] spawn life_fnc_MP;
};