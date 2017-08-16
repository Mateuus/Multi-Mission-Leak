/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Vehicle Interaction Menu
*/
private["_boxType","_curTarget","_isVehicle","_display","_btn1","_btn2","_btn3","_btn4","_btn5","_btn6","_btn7","_btn8","_btn9"];
disableSerialization;

_boxType = ["Box_IND_AmmoVeh_F","Land_Cargo20_blue_F"];
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
_fuelVeh = ["C_Van_01_fuel_F","O_Truck_02_fuel_F","O_Truck_03_fuel_F","B_Truck_01_fuel_F","O_Heli_Transport_04_fuel_F"];

if(isNull _curTarget) exitWith {closeDialog 0;};
_isVehicle = if((_curTarget isKindOf "landVehicle") OR (_curTarget isKindOf "Ship") OR (typeof _curTarget in _boxType) OR (_curTarget isKindOf "Air")) then {true} else {false};
if(!_isVehicle) exitWith {closeDialog 0;};

if(!dialog) then 
{
	switch (playerside) do
	{
		case west: {createDialog "interaction_menu_8";};
		case independent: {createDialog "interaction_menu_6";};
		case civilian: {createDialog "interaction_menu_7";};
		case east: {createDialog "interaction_menu_7";};
	};	
};

_display = findDisplay 9000;
_background = _display displayCtrl 9001;
_background ctrlSetFade 0;
_background ctrlCommit 5;

_btn1 = _display displayCtrl 9002;
_btn2 = _display displayCtrl 9003;
_btn3 = _display displayCtrl 9004;
_btn4 = _display displayCtrl 9005;
_btn5 = _display displayCtrl 9006;
_btn6 = _display displayCtrl 9007;
_btn7 = _display displayCtrl 9008;
_btn8 = _display displayCtrl 9009;
_btn9 = _display displayCtrl 9010;

EMonkeys_vInact_curTarget = _curTarget;

switch (playerside) do 
{
	case west:
	{
	
		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		
		_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
		_btn1 ctrlSetTooltip "Menü schliessen";
		_btn1 buttonSetAction "closeDialog 0;";
		
		_btn2 ctrlSetText "core\textures\menu_icons\icon_repair.paa";
		_btn2 ctrlSetTooltip "Reparieren";
		_btn2 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_repairTruck;";
		if("ToolKit" in (items player)) then {_btn2 ctrlEnable true;} else {_btn2 ctrlEnable false;};
		
		_btn3 ctrlSetText "core\textures\menu_icons\icon_register.paa";
		_btn3 ctrlSetTooltip "Besitzer Abfragen";
		_btn3 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_searchVehAction;";
		
		_btn4 ctrlSetText "core\textures\menu_icons\icon_search.paa";
		_btn4 ctrlSetTooltip "Durchsuchen";
		_btn4 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_ImpoundItemMenu;";
		
		_btn5 ctrlSetText "core\textures\menu_icons\icon_pullout.paa";
		_btn5 ctrlSetTooltip "Herausziehen";
		_btn5 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_btn5 ctrlEnable false;};
		
		_btn6 ctrlSetText "core\textures\menu_icons\icon_impound.paa";
		_btn6 ctrlSetTooltip "Beschlagnahmen";
		_btn6 buttonSetAction "closeDialog 0; [cursorTarget,2] spawn EMonkeys_fnc_impoundVehicle";
		
		_btn7 ctrlSetText "core\textures\menu_icons\icon_puttogarage.paa";
		_btn7 ctrlSetTooltip "In die Garage stellen";
		_btn7 buttonSetAction "closeDialog 0; [cursorTarget,0] spawn EMonkeys_fnc_impoundVehicle";
		
		if(!(_curTarget  getVariable ["trunk_in_use",false]) OR !((count ((nearestObjects[player, ["Man"], 10]) arrayIntersect playableUnits)) > 1)) then 
		{
			_btn8 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn8 ctrlSetTooltip "Kofferraum";
			_btn8 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] execFSM ""core\fsm\Trunk.fsm"";";
			_btn8 ctrlEnable true;
		} else {
			_btn8 ctrlSetTooltip "Kofferraum";
			_btn8 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn8 ctrlEnable false;
		};
		
		if(_curTarget in EMonkeys_vehic164) then
		{
			if(_curTarget getVariable "lock_trunk") then 
			{
				_btn9 ctrlSetText "core\textures\menu_icons\icon_trunkclose.paa";
				_btn9 ctrlSetTooltip "Kofferraum aufschliessen";
				_btn9 buttonSetAction "[EMonkeys_vInact_curTarget,""open""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn9 ctrlEnable true;
			} else {
				_btn9 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
				_btn9 ctrlSetTooltip "Kofferraum abschliessen";
				_btn9 buttonSetAction "[EMonkeys_vInact_curTarget,""close""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn9 ctrlEnable true;
			};
		} else {
			_btn9 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
			_btn9 ctrlSetTooltip "Kofferraum abschliessen";
			_btn9 ctrlEnable false;
		};
		
		{
			_x ctrlSetFade 0;
			_x ctrlCommit 3;
			_x ctrlShow true;
		} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9];
	};
	
	case independent:
	{
		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		
		_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
		_btn1 ctrlSetTooltip "Menü schliessen";
		_btn1 buttonSetAction "closeDialog 0;";
		
		_btn2 ctrlSetText "core\textures\menu_icons\icon_repair.paa";
		_btn2 ctrlSetTooltip "Reparieren";
		_btn2 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_repairTruck;";
		if("ToolKit" in (items player)) then {_btn2 ctrlEnable true;} else {_btn2 ctrlEnable false;};
		
		_btn3 ctrlSetText "core\textures\menu_icons\icon_pullout.paa";
		_btn3 ctrlSetTooltip "Herausziehen";
		_btn3 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_pulloutAction;";
		if(count crew _curTarget == 0) then {_btn3 ctrlEnable false;};
		
		_btn4 ctrlSetText "core\textures\menu_icons\icon_unflip.paa";
		_btn4 ctrlSetTooltip "Unflip";
		_btn4 buttonSetAction "EMonkeys_vInact_curTarget setPos [getPos EMonkeys_vInact_curTarget select 0, getPos EMonkeys_vInact_curTarget select 1, (getPos EMonkeys_vInact_curTarget select 2)+0.5]; closeDialog 0;";
		
		_btn5 ctrlSetText "core\textures\menu_icons\icon_puttogarage.paa";
		_btn5 ctrlSetTooltip "Abschleppen";
		_btn5 buttonSetAction "closeDialog 0; [cursorTarget,0] spawn EMonkeys_fnc_impoundVehicle";
		
		if(!(_curTarget  getVariable ["trunk_in_use",false]) OR !((count ((nearestObjects[player, ["Man"], 10]) arrayIntersect playableUnits)) > 1)) then 
		{
			_btn6 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn6 ctrlSetTooltip "Kofferraum";
			_btn6 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] execFSM ""core\fsm\Trunk.fsm"";";
			_btn6 ctrlEnable true;
		} else {
			_btn6 ctrlSetTooltip "Kofferraum";
			_btn6 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn6 ctrlEnable false;
		};
		
		if(_curTarget in EMonkeys_vehic164) then
		{
			if(_curTarget getVariable "lock_trunk") then 
			{
				_btn7 ctrlSetText "core\textures\menu_icons\icon_trunkclose.paa";
				_btn7 ctrlSetTooltip "Kofferraum aufschliessen";
				_btn7 buttonSetAction "[EMonkeys_vInact_curTarget,""open""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn7 ctrlEnable true;
			} else {
				_btn7 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
				_btn7 ctrlSetTooltip "Kofferraum abschliessen";
				_btn7 buttonSetAction "[EMonkeys_vInact_curTarget,""close""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn7 ctrlEnable true;
			};
		} else {
			_btn7 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
			_btn7 ctrlSetTooltip "Kofferraum abschliessen";
			_btn7 ctrlEnable false;
		};
		
		{
			_x ctrlSetFade 0;
			_x ctrlCommit 3;
			_x ctrlShow true;
		} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7];
	};
	
	case civilian:
	{
		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		
		_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
		_btn1 ctrlSetTooltip "Menü schliessen";
		_btn1 buttonSetAction "closeDialog 0;";
		
		_btn2 ctrlSetText "core\textures\menu_icons\icon_repair.paa";
		_btn2 ctrlSetTooltip "Reparieren";
		_btn2 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_repairTruck;";
		if("ToolKit" in (items player)) then {_btn2 ctrlEnable true;} else {_btn2 ctrlEnable false;};
		
		if(!(_curTarget  getVariable ["trunk_in_use",false]) OR !((count ((nearestObjects[player, ["Man"], 10]) arrayIntersect playableUnits)) > 1)) then 
		{
			_btn3 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn3 ctrlSetTooltip "Kofferraum";
			_btn3 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] execFSM ""core\fsm\Trunk.fsm"";";
			_btn3 ctrlEnable true;
		} else {
			_btn3 ctrlSetTooltip "Kofferraum";
			_btn3 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn3 ctrlEnable false;
		};
		
		if(_curTarget in EMonkeys_vehic164) then
		{
			if(_curTarget getVariable "lock_trunk") then 
			{
				_btn4 ctrlSetText "core\textures\menu_icons\icon_trunkclose.paa";
				_btn4 ctrlSetTooltip "Kofferraum aufschliessen";
				_btn4 buttonSetAction "[EMonkeys_vInact_curTarget,""open""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn4 ctrlEnable true;
			} else {
				_btn4 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
				_btn4 ctrlSetTooltip "Kofferraum abschliessen";
				_btn4 buttonSetAction "[EMonkeys_vInact_curTarget,""close""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn4 ctrlEnable true;
			};
		} else {
			_btn4 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
			_btn4 ctrlSetTooltip "Kofferraum abschliessen";
			_btn4 ctrlEnable false;
		};
		if(license_civ_PullOut) then 
		{
			_btn5 ctrlSetText "core\textures\menu_icons\icon_pullout.paa";
			_btn5 ctrlSetTooltip "Herausziehen";
			_btn5 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_pulloutAction;";
			if(count crew _curTarget == 0) then {_btn5 ctrlEnable false;};
		} else {
			_btn5 ctrlSetText "core\textures\menu_icons\icon_pullout.paa";
			_btn5 ctrlSetTooltip "Herausziehen";
			if(count crew _curTarget == 0) then {_btn5 ctrlEnable false;};
		};
		
		if(typeOf _curTarget == "O_Truck_03_device_F") then 
		{
			_btn6 ctrlSetText "core\textures\menu_icons\icon_mining.paa";
			_btn6 ctrlSetTooltip "Abbau starten";
			_btn6 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_deviceMine";
			_btn6 ctrlEnable true;
		} else {
			if(typeOf _curTarget == "B_Plane_CAS_01_F") then 
			{
				_btn6 ctrlSetText "core\textures\menu_icons\icon_mining.paa";
				_btn6 ctrlSetTooltip "Abbau starten";
				_btn6 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_deviceJet";
				_btn6 ctrlEnable true;
			} else {
				_btn6 ctrlSetText "core\textures\menu_icons\icon_mining.paa";
				_btn6 ctrlSetTooltip "Abbau starten";
				_btn6 ctrlEnable false;
			};
		};
		
		if((typeOf _curTarget in _fuelVeh) && (count(nearestObjects[(getPosATL _curTarget),["Land_fs_feed_F"],20]) > 0)) then 
		{
			_btn7 ctrlSetText "core\textures\menu_icons\icon_fuel2.paa";
			_btn7 ctrlSetTooltip "Tankstelle befüllen";
			_btn7 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_fillFuelstation";
			_btn7 ctrlEnable true;
		} else {
			_btn7 ctrlSetText "core\textures\menu_icons\icon_fuel2.paa";
			_btn7 ctrlSetTooltip "Tankstelle befüllen";
			_btn7 ctrlEnable false;
		};
		
		if((typeOf _curTarget in _fuelVeh) && (count(nearestObjects[(getPosATL _curTarget),["O_Truck_03_device_F"],20]) > 0)) then 
		{
			_btn8 ctrlSetText "core\textures\menu_icons\icon_fuel1.paa";
			_btn8 ctrlSetTooltip "Tempest(Gerät) befüllen";
			_btn8 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_fillTempestDevice";
			_btn8 ctrlEnable true;
		} else {
			_btn8 ctrlSetText "core\textures\menu_icons\icon_fuel1.paa";
			_btn8 ctrlSetTooltip "Tempest(Gerät) befüllen";
			_btn8 ctrlEnable false;
		};
		
		{
			_x ctrlSetFade 0;
			_x ctrlCommit 3;
			_x ctrlShow true;
		} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];
	};
	
	case east:
	{
		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		
		_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
		_btn1 ctrlSetTooltip "Menü schliessen";
		_btn1 buttonSetAction "closeDialog 0;";
		
		_btn2 ctrlSetText "core\textures\menu_icons\icon_repair.paa";
		_btn2 ctrlSetTooltip "Reparieren";
		_btn2 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_repairTruck;";
		if("ToolKit" in (items player)) then {_btn2 ctrlEnable true;} else {_btn2 ctrlEnable false;};
		
		if(!(_curTarget  getVariable ["trunk_in_use",false]) OR !((count ((nearestObjects[player, ["Man"], 10]) arrayIntersect playableUnits)) > 1)) then 
		{
			_btn3 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn3 ctrlSetTooltip "Kofferraum";
			_btn3 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] execFSM ""core\fsm\Trunk.fsm"";";
			_btn3 ctrlEnable true;
		} else {
			_btn3 ctrlSetTooltip "Kofferraum";
			_btn3 ctrlSetText "core\textures\menu_icons\icon_trunk.paa";
			_btn3 ctrlEnable false;
		};
		
		if(_curTarget in EMonkeys_vehic164) then
		{
			if(_curTarget getVariable "lock_trunk") then 
			{
				_btn4 ctrlSetText "core\textures\menu_icons\icon_trunkclose.paa";
				_btn4 ctrlSetTooltip "Kofferraum aufschliessen";
				_btn4 buttonSetAction "[EMonkeys_vInact_curTarget,""open""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn4 ctrlEnable true;
			} else {
				_btn4 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
				_btn4 ctrlSetTooltip "Kofferraum abschliessen";
				_btn4 buttonSetAction "[EMonkeys_vInact_curTarget,""close""] call EMonkeys_fnc_trunkOpenClose; [EMonkeys_vInact_curTarget] call EMonkeys_fnc_menu_vInteraction;";
				_btn4 ctrlEnable true;
			};
		} else {
			_btn4 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
			_btn4 ctrlSetTooltip "Kofferraum abschliessen";
			_btn4 ctrlEnable false;
		};
		if(license_civ_PullOut) then 
		{
			_btn5 ctrlSetText "core\textures\menu_icons\icon_pullout.paa";
			_btn5 ctrlSetTooltip "Herausziehen";
			_btn5 buttonSetAction "closeDialog 0; [EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_pulloutAction;";
			if(count crew _curTarget == 0) then {_btn5 ctrlEnable false;};
		} else {
			_btn5 ctrlSetText "core\textures\menu_icons\icon_pullout.paa";
			_btn5 ctrlSetTooltip "Herausziehen";
			if(count crew _curTarget == 0) then {_btn5 ctrlEnable false;};
		};
		
		if(typeOf _curTarget == "O_Truck_03_device_F") then 
		{
			_btn6 ctrlSetText "core\textures\menu_icons\icon_mining.paa";
			_btn6 ctrlSetTooltip "Abbau starten";
			_btn6 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_deviceMine";
			_btn6 ctrlEnable true;
		} else {
			if(typeOf _curTarget == "B_Plane_CAS_01_F") then 
			{
				_btn6 ctrlSetText "core\textures\menu_icons\icon_mining.paa";
				_btn6 ctrlSetTooltip "Abbau starten";
				_btn6 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_deviceJet";
				_btn6 ctrlEnable true;
			} else {
				_btn6 ctrlSetText "core\textures\menu_icons\icon_mining.paa";
				_btn6 ctrlSetTooltip "Abbau starten";
				_btn6 ctrlEnable false;
			};
		};
		
		if((typeOf _curTarget in _fuelVeh) && (count(nearestObjects[(getPosATL _curTarget),["Land_fs_feed_F"],20]) > 0)) then 
		{
			_btn7 ctrlSetText "core\textures\menu_icons\icon_fuel2.paa";
			_btn7 ctrlSetTooltip "Tankstelle befüllen";
			_btn7 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_fillFuelstation";
			_btn7 ctrlEnable true;
		} else {
			_btn7 ctrlSetText "core\textures\menu_icons\icon_fuel2.paa";
			_btn7 ctrlSetTooltip "Tankstelle befüllen";
			_btn7 ctrlEnable false;
		};
		
		if((typeOf _curTarget in _fuelVeh) && (count(nearestObjects[(getPosATL _curTarget),["O_Truck_03_device_F"],20]) > 0)) then 
		{
			_btn8 ctrlSetText "core\textures\menu_icons\icon_fuel1.paa";
			_btn8 ctrlSetTooltip "Tempest(Gerät) befüllen";
			_btn8 buttonSetAction "[EMonkeys_vInact_curTarget] spawn EMonkeys_fnc_fillTempestDevice";
			_btn8 ctrlEnable true;
		} else {
			_btn8 ctrlSetText "core\textures\menu_icons\icon_fuel1.paa";
			_btn8 ctrlSetTooltip "Tempest(Gerät) befüllen";
			_btn8 ctrlEnable false;
		};
		
		{
			_x ctrlSetFade 0;
			_x ctrlCommit 3;
			_x ctrlShow true;
		} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8];
	};
};