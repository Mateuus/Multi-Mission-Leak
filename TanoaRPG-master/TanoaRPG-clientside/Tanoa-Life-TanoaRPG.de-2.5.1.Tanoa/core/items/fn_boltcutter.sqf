/*
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Breaks the lock on a single door (Closet door to the player).
*/
private["_building","_door","_doors","_cpRate","_title","_progressBar","_titleText","_cp","_ui","_dome","_glitch"];

systemChat "Boltcutter-Debug 7";

_glitch = 1;
_building = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if (((player distance dome) > 5) || ((player distance rsb) > 5)) then 
{
	systemChat "Boltcutter-Debug 8";
	if(isNull _building) exitWith {};
	if(!(_building isKindOf "House_F")) exitWith {hint "Du kannst den Bolzenschneider nur auf ein Haus verwenden.";};
};
systemChat "Boltcutter-Debug 9";


if(isNil "life_boltcutter_uses") then {life_boltcutter_uses = 0;};
if(((nearestObject [[13347,12035,0],"Land_ConcreteWall_01_l_gate_F"]) == _building) OR ((nearestObject [[13229,12010,0],"Land_ConcreteWall_01_l_gate_F"]) == _building) OR ((fed_bank getVariable ["Rsb", ObjNull]) == _building) OR ((fed_bank getVariable ["Dome", ObjNull]) == _building)) then {
	systemChat "Boltcutter-Debug 10";
	[[1,2],"STR_ISTR_Bolt_AlertFed",true,[]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
	[getPlayerUID player, (localize "STR_ISTR_Bolt_AlertFed")] remoteExec ["TEX_fnc_logit", 2];
	[player, objNull, 1, "[BANK]", "Hat den Bolzenschneider benutzt"] remoteExec ["TEX_FNC_LOGIT", 2];
	
	if(_building == (fed_bank getVariable ["Rsb", ObjNull])) then
	{
		systemChat "Boltcutter-Debug 11";
		_glitch = 0;
		_dome = (fed_bank getVariable ["Dome", ObjNull]);
		for "_i" from 1 to 7 do
		{	//1 gleich close 0 = open
			if(_dome getVariable [(format["bis_disabled_Door_%1",_i]), 1] == 0) then {_glitch = 1;};
		};
		
		if(_glitch == 0) then
		{
			[[0,1,2], "STR_Fed_Glitch", true, [player getVariable ["realname",name player]]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
			
			//STRAFE MUSS SEIN AB INSCOP HQ UND GEFESSELT BLEIBEN !!!
			player setPos (getMarkerPos "cop_spawn_3");
			player setVariable["restrained",true,true];
			[2,-1,"Ich hab mich in die Bank GEGLITCHED und stehe gefesselt im Polizei HQ und warte auf meine Bestrafung !!!"] call tanoarpg_fnc_newMsg;
			player say3D "GlitchUse";
			[] spawn {
				while {player getVariable "restrained"} do
				{
					if(vehicle player == player) then
					{
						player playMove "AmovPercMstpSnonWnonDnon_Ease";
					};
	
					waitUntil {animationState player != "AmovPercMstpSnonWnonDnon_Ease" || !(player getvariable "restrained")};
			
					if(!alive player) exitWith
					{
						player setVariable ["restrained",false,true];
						player setVariable ["Escorting",false,true];
						player setVariable ["transporting",false,true];
						detach player;
					};
	
					if(vehicle player != player) then
					{
						if(driver (vehicle player) == player) then {player action["eject",vehicle player];};
					};
				};
				
				if(alive player) then
				{
					player switchMove "AmovPercMstpSlowWrflDnon_SaluteIn";
					player setVariable ["Escorting",false,true];
					player setVariable ["transporting",false,true];
					detach player;
				};
			};
			//ENDE VOM RESTARAIN :D
		};
	};
	
} else {
	[0,"STR_ISTR_Bolt_AlertHouse",true,[profileName]] remoteExec ["tanoarpg_fnc_broadcast", -2, false];
	
	_dome = (_building getVariable["house_owner", []]);
	if(format["|%1|", (_dome select 0)] != "|<null>|") then
	{
		_dome = (_dome select 0);
		{
			if((getPlayerUID _x) == _dome) then
			{
				[[0,1,2], format["%1 bricht gerade in dein Haus[%2|%3] ein !!!", profileName, ((getPos _building) select 0), ((getPos _building) select 1)]] remoteExec ["tanoarpg_fnc_broadcast", _x, false];
			};
		} forEach playableUnits;
	};
};

if(_glitch == 0) exitWith{};

_doors = getNumber(configFile >> "CfgVehicles" >> (typeOf _building) >> "NumberOfDoors");

_door = 0;
//Find the nearest door
for "_i" from 1 to _doors do {
	_selPos = _building selectionPosition format["Door_%1_trigger",_i];
	_worldSpace = _building modelToWorld _selPos;
		if(player distance _worldSpace < 5) exitWith {_door = _i;};
};

if(_door == 0) exitWith {hint localize "STR_Cop_NotaDoor"}; //Not near a door to be broken into.
if((_building getVariable[format["bis_disabled_Door_%1",_door],0]) == 0) exitWith {hint localize "STR_House_Raid_DoorUnlocked"};
life_action_inUse = true;

//Setup the progress bar
disableSerialization;
_title = localize "STR_ISTR_Bolt_Process";
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNamespace getVariable "life_progress";
_progressBar = _ui displayCtrl 38201;
_titleText = _ui displayCtrl 38202;
_titleText ctrlSetText format["%2 (1%1)...","%",_title];
_progressBar progressSetPosition 0.01;
_cP = 0.01;

switch (typeOf _building) do {
	case "Land_Offices_01_V1_F": {_cpRate = 0.0011;};
	case "Land_Medevac_house_V1_F": {_cpRate = 0.0014;};
	default {_cpRate = 0.002;}
};

while {true} do
{
	if(animationState player != "AinvPknlMstpsnonWnonDnon_medic_1" ) then {
		player action ["SwitchWeapon", player, player, 100];
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
		player playActionNow "stop";
		player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
	};
	sleep 0.26;
	if(isNull _ui) then {
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNamespace getVariable "life_progress";
		_progressBar = _ui displayCtrl 38201;
		_titleText = _ui displayCtrl 38202;
	};
	_cP = _cP + _cpRate;
	_progressBar progressSetPosition _cP;
	_titleText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_title];
	if(_cP >= 1 OR !alive player) exitWith {};
	if(life_istazed) exitWith {}; //Tazed
	if(life_interrupted) exitWith {};
};

//Kill the UI display and check for various states
5 cutText ["","PLAIN"];
player playActionNow "stop";
if(!alive player OR life_istazed) exitWith {life_action_inUse = false;};
if((player getVariable["restrained",false])) exitWith {life_action_inUse = false;};
if(life_interrupted) exitWith {life_interrupted = false; titleText[localize "STR_NOTF_ActionCancel","PLAIN"]; life_action_inUse = false;};
life_boltcutter_uses = life_boltcutter_uses + 1;
life_action_inUse = false;
if(life_boltcutter_uses >= 5) then {
	[false,"boltcutter",1] call tanoarpg_fnc_handleInv;
	life_boltcutter_uses = 0;
};

_building setVariable[format["bis_disabled_Door_%1",_door],0,true]; //Unlock the door.
if((_building getVariable["locked",false])) then {
	_building setVariable["locked",false,true];
};
[getPlayerUID player,profileName,"459"] remoteExec ["tanoarpg_fnc_wantedAdd", 2, false];