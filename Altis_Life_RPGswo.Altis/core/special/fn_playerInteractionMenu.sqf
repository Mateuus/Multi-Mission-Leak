#include "..\..\macros.hpp"
/*
	File: fn_playerInteractionMenu.sqf
	Author: Bryan "Tonic" Boardwine
	
	Description:
	Replaces the mass addactions for various cop actions towards another player.
*/
#include "..\..\macros.hpp"

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_Btn11","_Btn12","_Btn13","_Btn14","_Title"];
if(!dialog) then {
	createDialog "Interaction_Menu";
};
disableSerialization;
_curTarget = param [0,ObjNull,[ObjNull]];
if(isNull _curTarget) exitWith {closeDialog 0;};

_display = findDisplay 37400;
_Btn1 = _display displayCtrl IDC_interact_Btn1;
_Btn2 = _display displayCtrl IDC_interact_Btn2;
_Btn3 = _display displayCtrl IDC_interact_Btn3;
_Btn4 = _display displayCtrl IDC_interact_Btn4;
_Btn5 = _display displayCtrl IDC_interact_Btn5;
_Btn6 = _display displayCtrl IDC_interact_Btn6;
_Btn7 = _display displayCtrl IDC_interact_Btn7;
_Btn8 = _display displayCtrl IDC_interact_Btn8;
_Btn9 = _display displayCtrl IDC_interact_Btn9;
_Btn10 = _display displayCtrl IDC_interact_Btn10;
_Btn11 = _display displayCtrl IDC_interact_Btn11;
_Btn12 = _display displayCtrl IDC_interact_Btn12;
_Btn13 = _display displayCtrl IDC_interact_Btn13;
_Btn14 = _display displayCtrl IDC_interact_Btn14;
_Title = _display displayCtrl IDC_interact_Title;
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
_Btn12 ctrlShow false;
_Btn13 ctrlShow false;
_Btn14 ctrlShow false;

_Title ctrlSetText "Interaktions-Menü";

DWEV_pInact_curTarget = _curTarget;


	_Btn1 ctrlSetText "Ausweis zeigen";
	_Btn1 buttonSetAction "[player] remoteExec [""DWEV_fnc_zeigePerso"",DWEV_pInact_curTarget]; closeDialog 0;";
	_Btn1 ctrlShow true;	
	_Btn1 ctrlEnable DWEV_persoReady;

	switch (side player) do
	{
		case west:{
			_Btn2 ctrlSetText "Bußgeld ausstellen";
			_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_ticketAction;";
			_Btn2 ctrlShow true;
				if((side cursorTarget == west)) then
				{
					if ((__GETC__(DWEV_coplevel) >= 8)) then
					{
						_Btn2 ctrlSetText "Lizenz Menü";
						_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_lizenzgeben;";
						_Btn2 ctrlShow true;
					}
					else
					{
						_Btn2 ctrlShow false;
					};;
				};

			_Btn3 ctrlSetText "Alkoholtest";
			_Btn3 buttonSetAction "[player] remoteExec [""DWEV_fnc_alcoholCheck"",DWEV_pInact_curTarget]; closeDialog 0;";
			_Btn3 ctrlShow true;

			_Btn4 ctrlSetText "Drogentest";
			_Btn4 buttonSetAction "[player] remoteExec [""DWEV_fnc_drugCheck"",DWEV_pInact_curTarget]; closeDialog 0;";
			_Btn4 ctrlShow true;
		};
		case independent: {
			_Btn2 ctrlSetText "Quittung ausstellen";
			_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_ticketmeAction;";
			_Btn2 ctrlShow (if((side cursorTarget == independent)) then {false} else {true});	
			
			_Btn3 ctrlSetText "Niere einsetzten";
			_Btn3 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_giveOrgans; closeDialog 0;";
			if(!(cursorTarget getVariable ["missingOrgan",false])) then
			{_Btn3 ctrlEnable false;};
			_Btn3 ctrlShow true;
		};
		case east: {
			_Btn2 ctrlSetText "Quittung ausstellen";
			_Btn2 buttonSetAction "[DWEV_pInact_curTarget] call DWEV_fnc_ticketmeAction;";
			_Btn2 ctrlShow (if((side cursorTarget == east)) then {false} else {true});	
		};
		default{ 
			_Btn2 ctrlSetText "Führerschein zeigen";
			_Btn2 buttonSetAction "[DWEV_pInact_curTarget,0] call DWEV_fnc_FSzeigen; closeDialog 0;";
			_Btn2 ctrlShow true;
			_Btn2 ctrlEnable (if(lc_driver || lc_truck) then {true} else {false});
			
			_Btn3 ctrlSetText "Flugschein zeigen";
			_Btn3 buttonSetAction "[DWEV_pInact_curTarget,1] call DWEV_fnc_FSzeigen; closeDialog 0;";
			_Btn3 ctrlShow true;
			_Btn3 ctrlEnable (if(lc_air || lc_airgewerbe || lc_airkampf) then {true} else {false});
			
			_Btn4 ctrlSetText "Bootsschein zeigen";
			_Btn4 buttonSetAction "[DWEV_pInact_curTarget,2] call DWEV_fnc_FSzeigen; closeDialog 0;";
			_Btn4 ctrlShow true;
			_Btn4 ctrlEnable (if(lc_boat) then {true} else {false});

			_Btn5 ctrlSetText "Anwaltslizenz zeigen";
			_Btn5 buttonSetAction "[DWEV_pInact_curTarget,3] call DWEV_fnc_FSzeigen; closeDialog 0;";
			_Btn5 ctrlShow true;
			_Btn5 ctrlEnable (if(lc_anwalt) then {true} else {false});

			_Btn6 ctrlSetText "Waffenschein zeigen";
			_Btn6 buttonSetAction "[DWEV_pInact_curTarget,4] call DWEV_fnc_FSzeigen; closeDialog 0;";
			_Btn6 ctrlShow true;
			_Btn6 ctrlEnable (if(lc_gun) then {true} else {false});

			_Btn7 ctrlSetText "Behindertenausweis zeigen";
			_Btn7 buttonSetAction "[DWEV_pInact_curTarget,5] call DWEV_fnc_FSzeigen; closeDialog 0;";
			_Btn7 ctrlShow true;
			_Btn7 ctrlEnable (if(lc_behindert) then {true} else {false});
		};
	};
		