/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Player Interaction Menu for Civilist´s
*/
private["_boxType","_curTarget","_isVehicle","_display","_btn1","_btn2","_btn3","_btn4","_btn5","_btn6","_btn7","_btn8","_btn9"];
disableSerialization;

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _curTarget) exitWith {};
if(!isPlayer _curTarget) exitWith {};

EMonkeys_pInact_curTarget = _curTarget;
switch (_this select 1) do
{
	case 0:
	{
		createDialog "interaction_menu_2";
		
		_display = findDisplay 9000;
		_background = _display displayCtrl 9001;
		_background ctrlSetFade 0;
		_background ctrlCommit 5;

		_btn1 = _display displayCtrl 9002;
		_btn2 = _display displayCtrl 9003;
		_btn3 = _display displayCtrl 9004;
		
		_Btn1 ctrlShow false;
		_Btn2 ctrlShow false;
		_Btn3 ctrlShow false;
		
		_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
		_btn1 ctrlSetTooltip "Menü schliessen";
		_btn1 buttonSetAction "closeDialog 0;";
		
		_btn2 ctrlSetText "core\textures\menu_icons\icon_erstehilfe.paa";
		_btn2 ctrlSetTooltip "Stabilisieren";
		_btn2 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_hdm;";
		
		_btn3 ctrlSetText "core\textures\menu_icons\icon_pluendern.paa";
		_btn3 ctrlSetTooltip "Plündern";
		_btn3 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_pluendern;";
		
		{
			uisleep 0.1;
			_x ctrlSetFade 0;
			_x ctrlCommit 3;
			_x ctrlShow true;
		} forEach [_Btn1,_Btn2,_Btn3];
	};

	case 1:
	{
		if(!(_curTarget getVariable["restrainedciv",false])) then 
		{
			createDialog "interaction_menu_6";
			
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
			
			_btn2 ctrlSetText "core\textures\menu_icons\icon_ausweis.paa";
			_btn2 ctrlSetTooltip "Ausweis zeigen";
			_btn2 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_ausweiscom";
			if(count eM_ausweis == 0) then {_btn2 ctrlEnable false;};
			
			_btn3 ctrlSetText "core\textures\menu_icons\icon_pkwschein.paa";
			_btn3 ctrlSetTooltip "PKW Führerschein zeigen";
			_btn3 buttonSetAction "closeDialog 0; [0] call EMonkeys_fnc_licenseShow";
			if(!license_civ_driver) then {_btn3 ctrlEnable false;};
			
			_btn4 ctrlSetText "core\textures\menu_icons\icon_lkwschein.paa";
			_btn4 ctrlSetTooltip "LKW Führerschein zeigen";
			_btn4 buttonSetAction "closeDialog 0; [1] call EMonkeys_fnc_licenseShow";
			if(!license_civ_truck) then {_btn4 ctrlEnable false;};
			
			_btn5 ctrlSetText "core\textures\menu_icons\icon_pilotenschein.paa";
			_btn5 ctrlSetTooltip "Pilotenschein zeigen";
			_btn5 buttonSetAction "closeDialog 0; [2] call EMonkeys_fnc_licenseShow";
			if(!license_civ_air) then {_btn5 ctrlEnable false;};

			_btn6 ctrlSetText "core\textures\menu_icons\icon_waffenschein.paa";
			_btn6 ctrlSetTooltip "Waffenschein zeigen";
			_btn6 buttonSetAction "closeDialog 0; [3] call EMonkeys_fnc_licenseShow";
			if(!license_civ_gun) then {_btn6 ctrlEnable false;};
			
			_btn7 ctrlSetText "core\textures\menu_icons\icon_loglizenz.paa";
			_btn7 ctrlSetTooltip "Logistiklizenz zeigen";
			_btn7 buttonSetAction "closeDialog 0; [4] call EMonkeys_fnc_licenseShow";
			if(!license_civ_log) then {_btn7 ctrlEnable false;};
			
			{
				uisleep 0.1;
				_x ctrlSetFade 0;
				_x ctrlCommit 3;
				_x ctrlShow true;
			} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7];
		};

		if(_curTarget getVariable["restrainedciv",false]) then 
		{
			createDialog "interaction_menu_5";
			
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
			
			_Btn1 ctrlShow false;
			_Btn2 ctrlShow false;
			_Btn3 ctrlShow false;
			_Btn4 ctrlShow false;
			_Btn5 ctrlShow false;
			_Btn6 ctrlShow false;
			
			_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
			_btn1 ctrlSetTooltip "Menü schliessen";
			_btn1 buttonSetAction "closeDialog 0;";
			
			_btn2 ctrlSetText "core\textures\menu_icons\icon_unrestrain.paa";
			_btn2 ctrlSetTooltip "Entfesseln";
			_btn2 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_unrestrainciv;";
			if(!(license_civ_restrain)) then {_btn2 ctrlEnable false;};
			
			if(_curTarget getVariable["Escortingciv",false]) then 
			{
				_btn3 ctrlSetText "core\textures\menu_icons\icon_escortstop.paa";
				_btn3 ctrlSetTooltip "Eskortieren beenden";
				_btn3 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_stopEscortingciv;";
				if(!(license_civ_escort)) then {_btn3 ctrlEnable false;};
			} 
				else 
			{
				_btn3 ctrlSetText "core\textures\menu_icons\icon_escort.paa";
				_btn3 ctrlSetTooltip "Eskortieren";
				_btn3 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_escortActionciv;";
				if(!(license_civ_escort)) then {_btn3 ctrlEnable false;};
			};
			
			_btn4 ctrlSetText "core\textures\menu_icons\icon_putintocar.paa";
			_btn4 ctrlSetTooltip "Ins Fahrzeug stecken";
			_btn4 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_putInCarciv;";
			if(!(license_civ_PullOut)) then {_btn4 ctrlEnable false;};
			
			_btn5 ctrlSetText "core\textures\menu_icons\icon_torture.paa";
			_btn5 ctrlSetTooltip "Foltern";
			_btn5 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_TorturePlayer;";
			if(!(license_civ_Torture)) then {_btn5 ctrlEnable false;};

			if(_curTarget getVariable["gagged",false]) then 
			{
				_btn6 ctrlSetText "core\textures\menu_icons\icon_jutesackstop.paa";
				_btn6 ctrlSetTooltip "Sack abnehmen";
				_btn6 buttonSetAction "closeDialog 0; [[0],""EMonkeys_fnc_bagUseAction"",EMonkeys_pInact_curTarget,FALSE] spawn EMonkeys_fnc_MP;";
				if(!(license_civ_Torture)) then {_btn6 ctrlEnable false;};
			} 
				else 
			{
				if(EMonkeys_inv_jutesack < 1) then 
				{
					_btn6 ctrlSetText "core\textures\menu_icons\icon_jutesack.paa";
					_btn6 ctrlEnable false;
					_btn6 ctrlSetTooltip "Du brauchst einen Jutesack dazu!";
				} else {
					_btn6 ctrlSetText "core\textures\menu_icons\icon_jutesack.paa";
					_btn6 ctrlSetTooltip "Sack überziehen";
					_btn6 buttonSetAction "closeDialog 0; [3] spawn EMonkeys_fnc_bagUseAction;";
				};
				if(!(license_civ_Torture)) then {_btn6 ctrlEnable false;};
			};
			
			{
				uisleep 0.1;
				_x ctrlSetFade 0;
				_x ctrlCommit 3;
				_x ctrlShow true;
			} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6];
		};
	};
};