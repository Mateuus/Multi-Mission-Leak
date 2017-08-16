/*
	File: fn_inventory.sqf
	Author: John "Paratus" VanderZwet

	Description:
	IMPORTANT! Use of this system, or any modification of it, is not permitted outside of Asylum servers.
	Violation of this may result in BattlEye blacklisting.
*/
private["_display","_near"];

_newLoad = [_this,0,true,[true]] call BIS_fnc_param;
_isPhone = [_this,1,false,[false]] call BIS_fnc_param;

disableSerialization;
if (life_action_in_use) exitWith { closeDialog 0; hint "You can't open your inventory while performing another action."; };

if (_isPhone) then { waitUntil {!isNull (findDisplay 2001)}; }
else { waitUntil {!isNull (findDisplay 602)}; };

_display = if (_isPhone) then { findDisplay 2001 } else { findDisplay 602 };

if (_isPhone) then { [] call life_fnc_p_updateMenu; systemChat "It's a phone!" };

if (_newLoad && !life_virt_open && !_isPhone) then
{
	life_virt_open = true;
	systemChat "Press CTRL+R to repack magazine ammo.";
	_mainX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_PlayerBackground" >> "x");
	_mainW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_PlayerBackground" >> "w");
	_panelX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "x");
	_panelY = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "y");
	_panelW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "w");
	_panelH = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "CA_ContainerBackground" >> "h");
	_progressX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "x");
	_progressY = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "y");
	_progressW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "w");
	_progressH = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundLoad" >> "h");
	_containerX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "x");
	_containerY = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "y");
	_containerW = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "w");
	_containerH = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "GroundContainer" >> "h");
	_padding = _progressX - _panelX;

	_panel = _display ctrlCreate ["RscBackground", 6665];
	_panel ctrlSetBackgroundColor [0.05,0.05,0.05,0.7];
	_panelX = (_mainX + _mainW) + (_mainX - _panelX - _panelW);
	_panel ctrlSetPosition [_panelX, _panelY, _panelW, _panelH];
	_panel ctrlCommit 0;

	_load = _display ctrlCreate ["RscProgress", 6667];
	_load ctrlSetTextColor [0.9,0.9,0.9,0.9];
	_load ctrlSetPosition [_panelX + _padding, _progressY, _progressW, _progressH];
	_load ctrlCommit 0;
	_load progressSetPosition (life_carryWeight / life_maxWeight);

	_loadFrame = _display ctrlCreate ["RscFrame", -1];
	_loadFrame ctrlSetTextColor [0.6,0.6,0.6,1];
	_loadFrame ctrlSetPosition [_panelX + _padding, _progressY, _progressW, _progressH];
	_loadFrame ctrlCommit 0;

	_loadText = _display ctrlCreate ["RscStructuredText", 6678];
	_loadText ctrlSetTextColor [0,0,0,0.7];
	_loadText ctrlSetPosition [_panelX + _padding, _progressY, _progressW, _progressH];
	_loadText ctrlSetStructuredText parseText format["<t align='center'>%1/%2</t>", life_carryWeight, life_maxWeight];
	_loadText ctrlCommit 0;

	_title = _display ctrlCreate ["RscText", -1];
	_title ctrlSetTextColor [1,1,1,1];
	_title ctrlSetText "Asylum Items";
	_title ctrlSetPosition [_panelX + _padding, _panelY + _padding, _progressW, _progressH];
	_title ctrlCommit 0;
	
	_players = _display ctrlCreate ["RscCombo", 2023];
	_players ctrlSetPosition [_panelX + _padding, _panelY + _padding, _progressW / 2, _progressH];
	_players ctrlCommit 0;

	_edit = _display ctrlCreate ["RscEdit", 2010];
	_edit ctrlSetText "1";
	_edit ctrlSetPosition [_panelX + _padding + (_progressW / 2), _panelY + _padding, _progressW / 2, _progressH];
	_edit ctrlCommit 0;

	_inv = _display ctrlCreate ["RscListBox", 2005];
	_inv ctrlSetPosition [_panelX + _padding, _containerY, _containerW, _containerH];
	_inv ctrlSetBackgroundColor [0,0,0,0];
	_inv ctrlCommit 0;
	_inv ctrlAddEventHandler ["LBDblClick", "[_this] call life_fnc_popAllItems;"];

	_but1 = _display ctrlCreate ["RscButtonMenu", 6670];
	_but1 ctrlSetPosition [_panelX + _padding, _panelY + _padding + _progressH + (_progressH / 8), _containerW / 3, _progressH];
	_but1 ctrlSetText "Use";
	_but1 ctrlCommit 0;
	_but1 ctrlAddEventHandler ["ButtonClick", "[] call life_fnc_useItem;"];

	_but2 = _display ctrlCreate ["RscButtonMenu", 2002];
	_but2 ctrlSetPosition [_panelX + _padding + ((_containerW / 3) * 1), _panelY + _padding + _progressH + (_progressH / 8), _containerW / 3, _progressH];
	_but2 ctrlSetText "Give";
	_but2 ctrlCommit 0;
	_but2 ctrlAddEventHandler ["ButtonClick", "[] call life_fnc_giveItem;"];

	_but3 = _display ctrlCreate ["RscButtonMenu", 454];
	_but3 ctrlSetPosition [_panelX + _padding + ((_containerW / 3) * 2), _panelY + _padding + _progressH + (_progressH / 8), _containerW / 3, _progressH];
	_but3 ctrlSetText "Drop";
	_but3 ctrlCommit 0;
	_but3 ctrlAddEventHandler ["ButtonClick", "[player,false] spawn life_fnc_dropItems;"];

	_centerX = getNumber (configfile >> "RscDisplayInventory" >> "controls" >> "BackgroundSlotPrimary" >> "x");
	_offset = _centerX - 0.5;
	{
		_x ctrlSetPosition [((ctrlPosition _x) select 0) - _offset,((ctrlPosition _x) select 1)];
		_x ctrlCommit 0;
	} forEach allControls _display;
	
	[] spawn { disableSerialization; waitUntil {isNull (findDisplay 602)}; life_virt_open = false; };
};

_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"medic"};};

//Near players
_near = _display displayCtrl 2023;
_near_units = [];
{ if(player distance _x < 10) then {_near_units set [count _near_units,_x];};} foreach allPlayers;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",name _x, side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach (if(isNull objectParent player) then {_near_units} else {crew vehicle player});

_inv = _display displayCtrl 2005;
lbClear _inv;

if (life_lootKeys select 0 > 0) then
{
	_inv lbAdd format["%1x - %2",life_lootKeys select 0,"Loot Crate Keys"];
	_inv lbSetData [(lbSize _inv)-1,""];
};

{
	_str = [_x] call life_fnc_varToStr;
	_shrt = [_x,1] call life_fnc_varHandle;
	_val = missionNameSpace getVariable _x;
	if(_val > 0) then
	{
		_inv lbAdd format["%1x - %2",_val,_str];
		_inv lbSetData [(lbSize _inv)-1,_shrt];
		_inv lbSetPicture [(lbSize _inv)-1,format["icons\%1.paa",_shrt]];
	};
} foreach life_inv_items;