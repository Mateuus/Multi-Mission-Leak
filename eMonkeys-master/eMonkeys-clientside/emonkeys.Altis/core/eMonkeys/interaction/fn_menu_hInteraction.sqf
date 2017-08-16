/*
	Author: DerOnkel
	Avanix Gaming Community | E-Monkeys.com
	The usage of this file is restricted to Avanix-Gaming.de & E-Monkeys.com
    You're not allowed to modify this file!
    Licensed under the Arma EULA and Arma Tools EULA.
    For further questions contact the author!
	
	Description:
	House Interaction Menu
*/
private["_curTarget","_display","_btn1","_btn2","_btn3","_btn4","_btn5","_btn6","_btn7","_btn8","_btn9"];
disableSerialization;

_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
em_interaction_target = _curTarget;
if(isNull _curTarget) exitWith {closeDialog 0;};
if(_curTarget isKindOf "House_F") then
{
	if((nearestObject [[16736,13667,0.00140572],"Land_Dome_Small_F"]) == _curTarget OR (nearestObject [[16731.646,13665.511,0],"Land_Research_house_V1_F"]) == _curTarget) then 
	{
		switch (playerside) do
		{
			case west:
			{
				createDialog "interaction_menu_2";
				_display = findDisplay 9000;
				_background = _display displayCtrl 9001;
				_background ctrlSetFade 0;
				_background ctrlCommit 5;

				_btn1 = _display displayCtrl 9002; // Close Buttons
				_btn2 = _display displayCtrl 9003;
				_btn3 = _display displayCtrl 9004;
				
				_Btn1 ctrlShow false;
				_Btn2 ctrlShow false;
				_Btn3 ctrlShow false;
				
				_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
				_btn1 ctrlSetTooltip "Menü schliessen";	
				_Btn1 buttonSetAction "closeDialog 0;";

				_btn2 ctrlSetText "core\textures\menu_icons\icon_trunkclose.paa";
				_btn2 ctrlSetTooltip "Tür reparieren";	
				_btn2 buttonSetAction "[em_interaction_target] spawn EMonkeys_fnc_repairDoor; closeDialog 0;";
				
				_btn3 ctrlSetText "core\textures\menu_icons\icon_trunkopen.paa";
				_btn3 ctrlSetTooltip "Tür Öffnen / Schliessen";		
				_btn3 buttonSetAction "[em_interaction_target] call EMonkeys_fnc_doorAnimate; closeDialog 0;";
				
				{
					uisleep 0.1;
					_x ctrlSetFade 0;
					_x ctrlCommit 3;
					_x ctrlShow true;
				} forEach [_Btn1,_Btn2,_Btn3];
			};
			
			case civilian:
			{
				createDialog "interaction_menu_1";
				_display = findDisplay 9000;
				_background = _display displayCtrl 9001;
				_background ctrlSetFade 0;
				_background ctrlCommit 5;

				_btn1 = _display displayCtrl 9002; // Close Buttons
				_btn2 = _display displayCtrl 9003;
				
				_Btn1 ctrlShow false;
				_Btn2 ctrlShow false;
				
				_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
				_btn1 ctrlSetTooltip "Menü schliessen";	
				_Btn1 buttonSetAction "closeDialog 0;";

				_btn2 ctrlSetText "core\textures\menu_icons\icon_rob.paa";
				_btn2 ctrlSetTooltip "Tür aufbrechen";	
				_btn2 buttonSetAction "[em_interaction_target] spawn EMonkeys_fnc_boltcutter; closeDialog 0;";
				
				{
					uisleep 0.1;
					_x ctrlSetFade 0;
					_x ctrlCommit 3;
					_x ctrlShow true;
				} forEach [_Btn1,_Btn2];
			};
			
			case east:
			{
				createDialog "interaction_menu_1";
				_display = findDisplay 9000;
				_background = _display displayCtrl 9001;
				_background ctrlSetFade 0;
				_background ctrlCommit 5;

				_btn1 = _display displayCtrl 9002; // Close Buttons
				_btn2 = _display displayCtrl 9003;
				
				_Btn1 ctrlShow false;
				_Btn2 ctrlShow false;
				
				_btn1 ctrlSetText "core\textures\menu_icons\icon_close.paa";
				_btn1 ctrlSetTooltip "Menü schliessen";	
				_Btn1 buttonSetAction "closeDialog 0;";

				_btn2 ctrlSetText "core\textures\menu_icons\icon_rob.paa";
				_btn2 ctrlSetTooltip "Tür aufbrechen";	
				_btn2 buttonSetAction "[em_interaction_target] spawn EMonkeys_fnc_boltcutter; closeDialog 0;";
				
				{
					uisleep 0.1;
					_x ctrlSetFade 0;
					_x ctrlCommit 3;
					_x ctrlShow true;
				} forEach [_Btn1,_Btn2];
			};
		};
	};
};