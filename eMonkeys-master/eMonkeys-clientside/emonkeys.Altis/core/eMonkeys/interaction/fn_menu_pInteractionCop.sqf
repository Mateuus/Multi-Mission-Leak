/*
	Author: DerOnkel & Williams
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	Player Interaction Menu for Cops
*/
private["_boxType","_curTarget","_isVehicle","_display","_btn1","_btn2","_btn3","_btn4","_btn5","_btn6","_btn7","_btn8","_btn9","_btn10","_btn11"];
disableSerialization;

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

if(isNull _curTarget) exitWith {};
if(!isPlayer _curTarget) exitWith {};

EMonkeys_pInact_curTarget = _curTarget;

switch (_this select 1) do
{
	case 0:
	{
		createDialog "interaction_menu_3";
			
		_display = findDisplay 9000;
		_background = _display displayCtrl 9001;
		_background ctrlSetFade 0;
		_background ctrlCommit 5;

		_btn1 = _display displayCtrl 9002;
		_btn2 = _display displayCtrl 9003;
		_btn3 = _display displayCtrl 9004;
		_btn4 = _display displayCtrl 9005;
		
		_btn1 = _display displayCtrl 9002;
		_btn2 = _display displayCtrl 9003;
		_btn3 = _display displayCtrl 9004;
		_btn4 = _display displayCtrl 9005;
		
		_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
		_btn1 ctrlSetTooltip "Menü schliessen";
		_btn1 buttonSetAction "closeDialog 0;";
		
		_btn2 ctrlSetText "core\textures\menu_icons\icon_erstehilfe.paa";
		_btn2 ctrlSetTooltip "Stabilisieren";
		_btn2 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_hdm;";
		
		_btn3 ctrlSetText "core\textures\menu_icons\icon_pluendern.paa";
		_btn3 ctrlSetTooltip "Plündern";
		_btn3 buttonSetAction "closeDialog 0;";
		
		_btn4 ctrlSetText "core\textures\menu_icons\icon_ausweisnehmen.paa";
		_btn4 ctrlSetTooltip "Ausweis nehmen";
		_btn4 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_ausweiscomforce;";
		
		{
			uisleep 0.1;
			_x ctrlSetFade 0;
			_x ctrlCommit 3;
			_x ctrlShow true;
		} forEach [_Btn1,_Btn2,_Btn3,_Btn4];
	};

	case 1:
	{
		if(side _curTarget in [west]) exitWith {};
		if(!((_curTarget getVariable["restrained",false]) OR (_curTarget getVariable["restrainedciv",false]))) then
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
			
			_btn2 ctrlSetText "core\textures\menu_icons\icon_marke.paa";
			_btn2 ctrlSetTooltip "Marke zeigen";
			_btn2 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_copShowLicense;";
			
			_btn3 ctrlSetText "core\textures\menu_icons\icon_joint.paa";
			_btn3 ctrlSetTooltip "Joint ausmachen";
			_btn3 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_extinguishJoint;";
			
			_btn4 ctrlSetText "core\textures\menu_icons\icon_ausweisnehmen.paa";
			_btn4 ctrlSetTooltip "Ausweis nehmen";
			_btn4 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_ausweiscomforce;";
			
			_btn5 ctrlSetText "core\textures\menu_icons\icon_showLicenses.paa";
			_btn5 ctrlSetTooltip "Führerscheine überprüfen";
			_btn5 buttonSetAction "closeDialog 0; [[player],""EMonkeys_fnc_licenseCheck"",EMonkeys_pInact_curTarget,FALSE] spawn EMonkeys_fnc_MP;";

			_btn6 ctrlSetText "core\textures\menu_icons\icon_alkohol.paa";
			_btn6 ctrlSetTooltip "Alkohol & Drogentest";
			_btn6 buttonSetAction "closeDialog 0; [[player],""EMonkeys_fnc_breathalyzer"",EMonkeys_pInact_curTarget,FALSE] call EMonkeys_fnc_mp; closeDialog 0;";
			
			_btn7 ctrlSetText "core\textures\menu_icons\icon_ticket.paa";
			_btn7 ctrlSetTooltip "Bußgeld erteilen";
			_btn7 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_ticketAction;";
			
			{
				uisleep 0.1;
				_x ctrlSetFade 0;
				_x ctrlCommit 3;
				_x ctrlShow true;
			} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7];
		}
			else
		{
			createDialog "interaction_menu_10";
			
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
			_btn10 = _display displayCtrl 9011;
			_btn11 = _display displayCtrl 9012;
			
			_Btn1 ctrlShow false;
			_Btn2 ctrlShow false;
			_Btn3 ctrlShow false;
			_Btn4 ctrlShow false;
			_Btn5 ctrlShow false;
			_Btn6 ctrlShow false;
			_Btn7 ctrlShow false;
			_Btn8 ctrlShow false;
			_Btn9 ctrlShow false;
			_Btn10 ctrlShow false;
			_Btn11 ctrlShow false;
			
			_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
			_btn1 ctrlSetTooltip "Menü schliessen";
			_btn1 buttonSetAction "closeDialog 0;";
			
			_btn2 ctrlSetText "core\textures\menu_icons\icon_marke.paa";
			_btn2 ctrlSetTooltip "Marke zeigen";
			_btn2 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_copShowLicense;";
			
			_btn3 ctrlSetText "core\textures\menu_icons\icon_ausweisnehmen.paa";
			_btn3 ctrlSetTooltip "Ausweis nehmen";
			_btn3 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_ausweiscomforce;";
			
			_btn4 ctrlSetText "core\textures\menu_icons\icon_unrestrain.paa";
			_btn4 ctrlSetTooltip "Entfesseln";
			_btn4 buttonSetAction "[EMonkeys_pInact_curTarget] call EMonkeys_fnc_unrestrain; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_unrestrainciv; closeDialog 0;";
			
			if((_curTarget getVariable["Escorting",false]) OR (_curTarget getVariable["Escortingciv",false])) then 
			{
				_btn5 ctrlSetText "core\textures\menu_icons\icon_escortstop.paa";
				_btn5 ctrlSetTooltip "Eskortieren beenden";
				_btn5 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_stopEscorting;";
			} 
				else 
			{
				_btn5 ctrlSetText "core\textures\menu_icons\icon_escort.paa";
				_btn5 ctrlSetTooltip "Eskortieren";
				_btn5 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_escortAction;";
			};
			
			_btn6 ctrlSetText "core\textures\menu_icons\icon_putintocar.paa";
			_btn6 ctrlSetTooltip "Ins Fahrzeug stecken";
			_btn6 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_putInCar;";
			
			_btn7 ctrlSetText "core\textures\menu_icons\icon_showLicenses.paa";
			_btn7 ctrlSetTooltip "Führerscheine überprüfen";
			_btn7 buttonSetAction "closeDialog 0; [[player],""EMonkeys_fnc_licenseCheck"",EMonkeys_pInact_curTarget,FALSE] spawn EMonkeys_fnc_MP;";

			_btn8 ctrlSetText "core\textures\menu_icons\icon_searchPerson.paa";
			_btn8 ctrlSetTooltip "Durchsuchen";
			_btn8 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] spawn EMonkeys_fnc_searchAction;";
			
			_btn9 ctrlSetText "core\textures\menu_icons\icon_alkohol.paa";
			_btn9 ctrlSetTooltip "Alkohol & Drogentest";
			_btn9 buttonSetAction "[[player],""EMonkeys_fnc_breathalyzer"",EMonkeys_pInact_curTarget,FALSE] call EMonkeys_fnc_mp; closeDialog 0;";
			
			_btn10 ctrlSetText "core\textures\menu_icons\icon_ticket.paa";
			_btn10 ctrlSetTooltip "Bußgeld erteilen";
			_btn10 buttonSetAction "closeDialog 0; [EMonkeys_pInact_curTarget] call EMonkeys_fnc_ticketAction;";
			
			_btn11 ctrlSetText "core\textures\menu_icons\icon_arrest.paa";
			_btn11 ctrlSetTooltip "Ins Gefängnis schicken";
			_btn11 buttonSetAction "closeDialog 0; [] call EMonkeys_fnc_showArrestDialog;";
			if(!((player distance (getMarkerPos "ps_kavala") < 50) OR
			  (player distance (getMarkerPos "police_hq_2") < 50) OR 
			  (player distance (getMarkerPos "cop_spawn_3") < 50) OR 
			  (player distance (getMarkerPos "cop_spawn_5") < 50) OR 
			  (player distance (getMarkerPos "cop_spawn_4") < 50) OR 
			  (player distance (getMarkerPos "police_hq_3") < 50) OR 
			  (player distance (getMarkerPos "police_hq_4") < 50) OR 
			  (player distance (getMarkerPos "police_hq_5") < 50) OR 
			  (player distance (getMarkerPos "police_hq_6") < 50) OR 
			  (player distance (getMarkerPos "police_hq_8") < 50) OR 
			  (player distance (getMarkerPos "police_hq_9") < 50) OR 
			  (player distance (getMarkerPos "cop_markt_kavala") < 5) OR
			  (player distance (getMarkerPos "police_hq_7") < 50) )) then 
			{
				_btn11 ctrlEnable false;
			};
			
			{
				uisleep 0.1;
				_x ctrlSetFade 0;
				_x ctrlCommit 3;
				_x ctrlShow true;
			} forEach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6,_Btn7,_Btn8,_Btn9,_Btn10,_Btn11];
		};
	};
};