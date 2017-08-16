/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Fuelstation Menu
*/
private["_curTarget","_display","_btn1","_btn2","_btn3","_btn4","_btn5","_btn6","_btn7","_btn8","_btn9"];
disableSerialization;

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;};

if(!dialog) then 
{
	createDialog "interaction_menu_5";
};

_display = findDisplay 9000;
_background = _display displayCtrl 9001;
_background ctrlSetFade 0;
_background ctrlCommit 5;

_btn1 = _display displayCtrl 9002; // Close Buttons
_btn2 = _display displayCtrl 9003;
_btn3 = _display displayCtrl 9004;
_btn4 = _display displayCtrl 9005;
_btn5 = _display displayCtrl 9006;
_btn6 = _display displayCtrl 9007;

_Btn1 ctrlShow false;
_Btn2 ctrlShow false;
_Btn3 ctrlShow false;
_Btn4 ctrlShow false;
_Btn5 ctrlShow false;
_Btn6 ctrlShow false;

eM_vInact_curTarget = _curTarget;

if(isNil {_curTarget getVariable "fuelstation_id"}) then {closeDialog 0;};
id = _curTarget getVariable "fuelstation_id";

_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
_btn1 ctrlSetTooltip "Menü schliessen";	
_Btn1 buttonSetAction "closeDialog 0;";

_btn2 ctrlSetText "core\textures\menu_icons\icon_shop1.paa";
_btn2 ctrlSetTooltip "Kiosk";	
_Btn2 buttonSetAction "[0,0,0,""tankstellenshop""] spawn EMonkeys_fnc_virt_menu;";

_btn3 ctrlSetTooltip "Zubehör";	
_btn3 ctrlSetText "core\textures\menu_icons\icon_shop2.paa";	
_Btn3 buttonSetAction "[0,0,0,""tankshop""] spawn EMonkeys_fnc_weaponShopMenu;";

_btn4 ctrlSetTooltip "Tankstelle ausrauben";	
_btn4 ctrlSetText "core\textures\menu_icons\icon_rob.paa";	
_Btn4 buttonSetAction "[[player,id],""TON_fnc_getFuelstationRob"",false,false] call EMonkeys_fnc_mp; closeDialog 0;";

_btn5 ctrlSetTooltip "Information";	
_btn5 ctrlSetText "core\textures\menu_icons\icon_info.paa";	
_Btn5 buttonSetAction "[[player,id],""TON_fnc_getFuelstationInfo"",false,false] call EMonkeys_fnc_mp; closeDialog 0;";

_btn6 ctrlSetTooltip "Tankstellenmenü";	
_btn6 ctrlSetText "core\textures\menu_icons\icon_ownerMenu.paa";	
_Btn6 buttonSetAction "[[player,id],""TON_fnc_getFuelstationData"",false,false] call EMonkeys_fnc_mp; closeDialog 0;";	

if(player distance _curTarget > 2.8) then 
{
	_Btn2 ctrlEnable false;
	_Btn3 ctrlEnable false;
	_Btn4 ctrlEnable false;
};

if((_curTarget getVariable "fuelstation_id" == "12") OR 
(_curTarget getVariable "fuelstation_id" == "11") OR 
(_curTarget getVariable "fuelstation_id" == "12") OR 
(_curTarget getVariable "fuelstation_id" == "13") OR 
(_curTarget getVariable "fuelstation_id" == "19") OR 
(_curTarget getVariable "fuelstation_id" == "20")) then {_Btn3 ctrlEnable false;};

if((playerside == west) OR (playerside == independent)) then {
	_Btn2 ctrlEnable false;
	_Btn5 ctrlEnable false;
};

{
	uisleep 0.1;
	_x ctrlSetFade 0;
	_x ctrlCommit 3;
	_x ctrlShow true;
} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6];