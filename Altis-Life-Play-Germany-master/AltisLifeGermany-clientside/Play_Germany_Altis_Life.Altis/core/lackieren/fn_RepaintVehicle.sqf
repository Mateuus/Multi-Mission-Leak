/*
File: fn_RepaintVehicle.sqf
Author: MooN-Gaming
Modified by: Play Germany

Description: Does the active repaint man....read the title!
*/
private["_veh","_color","_color_index"];
if(!isNull (findDisplay 2300)) then {
_color = lbcursel 2303;
_color_index = lbValue[2303,_color];
_veh_index = lbcursel 2302;
_veh = paint_veh select _veh_index;
closeDialog 0;

if(_color_index == 0) exitWith {};

_baseprice = 10000;  //Price for repaint
_vehicleData = _veh getVariable["vehicle_info_owners",[]];
if(PG_cash < _basePrice) exitWith {hint "Du hast nicht genug Bargeld dabei!"};

if(isNil {_vehicleData}) exitWith {hint "Cheated car?."};
if (!(_veh in life_vehicles)) exitwith {hint "Du bist nicht der Besitzer!"};

		life_action_inUse = true;
		_displayName = getText(configFile >> "CfgVehicles" >> (typeOf _veh) >> "displayName");
		_upp = format["Lackiere %1",_displayName];
		//Setup our progress bar.
		disableSerialization;
		5 cutRsc ["life_progress","PLAIN"];
		_ui = uiNameSpace getVariable "life_progress";
		_progress = _ui displayCtrl 38201;
		_pgText = _ui displayCtrl 38202;
		_pgText ctrlSetText format["%2 (1%1)...","%",_upp];
		_progress progressSetPosition 0.01;
		_cP = 0.01;
		
		_i = 0;
		life_curWep_h = currentWeapon player;
		player action ["SwitchWeapon", player, player, 100];
		while {true} do
		{
			if(animationState player != "AinvPknlMstpSnonWnonDnon_medic_1" && _i mod 3 == 0) then {
				player playMoveNow "AinvPknlMstpSnonWnonDnon_medic_1";
			};					
			uiSleep 0.29;
			//[player,"spraycan"] call life_fnc_globalSound; //Just if you have global sounds!

			_cP = _cP + 0.01;
			_progress progressSetPosition _cP;
			_pgText ctrlSetText format["%3 (%1%2)...",round(_cP * 100),"%",_upp];			
			if(_cP >= 1) exitWith {};
			if(!alive player) exitWith {};
			if(player != vehicle player) exitWith {};
			if(life_interrupted) exitWith {};
			_i = _i +1;
		};
		
		life_action_inUse = false;
		5 cutText ["","PLAIN"];
		player playActionNow "stop";
		if(!isNil "life_curWep_h" && {(life_curWep_h != "")}) then {
			if(life_curWep_h in [primaryWeapon player,secondaryWeapon player,handgunWeapon player]) then {
				player selectWeapon life_curWep_h;
			};
		};
		if(life_interrupted) exitWith {life_interrupted = false; titleText["Cancelled","PLAIN"]; life_action_inUse = false;};
		if(player != vehicle player) exitWith {titleText["Du musst aus dem Fahrzeug aussteigen, um es lackieren zu können!","PLAIN"];};
	
		PG_cash = PG_cash - _basePrice;
		//Send toDB
		[[_veh,_color_index],"PGSERV_fnc_vehicleRepaint",false,false] spawn life_fnc_MP;
		
		//Color vehicle global
		[[_veh,_color_index],"life_fnc_colorVehicle",nil,false] spawn life_fnc_MP;
		
		[] call SOCK_fnc_updateRequest; //Sync silently because it's obviously silently..
};