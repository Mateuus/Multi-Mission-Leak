/*
Darkside Life

Author: Shawn "Huntah" Macgillivray

Description:
	Opens the vehicle interaction menu
*/

private["_mcu"];

_mcu = objNull;

if(!dialog) then
{
	if(!(createDialog "interactionMenu")) exitWith {};
};
if(DS_doingStuff)exitwith{};
DS_cursorTarget = _this select 0;
disableSerialization;

_dialog = findDisplay 666675;
_img1 = _dialog displayCtrl 1200;
_img2 = _dialog displayCtrl 1201;
_img3 = _dialog displayCtrl 1202;
_img4 = _dialog displayCtrl 1203;
_img5 = _dialog displayCtrl 1204;
_img6 = _dialog displayCtrl 1205;
_img7 = _dialog displayCtrl 1206;
_img8 = _dialog displayCtrl 1207;
_img9 = _dialog displayCtrl 1208;
_img10 = _dialog displayCtrl 1209;
_btn1 = _dialog displayCtrl 2401;
_btn2 = _dialog displayCtrl 2402;
_btn3 = _dialog displayCtrl 2403;
_btn4 = _dialog displayCtrl 2404;
_btn5 = _dialog displayCtrl 2405;
_btn6 = _dialog displayCtrl 2406;
_btn7 = _dialog displayCtrl 2407;
_btn8 = _dialog displayCtrl 2408;
_btn9 = _dialog displayCtrl 2409;
_btn10 = _dialog displayCtrl 2410;
_header = _dialog displayCtrl 1210;

if((player getVariable ["cuffed",false])||(player getVariable ["ziptied",false]))exitwith{};

switch(playerside)do
	{
	case west:
		{
		if(alive DS_cursorTarget)then
			{
			_header ctrlSetText "extras\textures\menus\policeBanner.jpg";
			_img1 ctrlSetText "extras\icons\cuffs.jpg";
			_btn1 ctrlSetTooltip "Remove or place your target in handcuffs if their hands are up or they are tazed";
			_img2 ctrlSetText "extras\icons\copLicense.jpg";
			_btn2 ctrlSetTooltip "Check for your targets identification and licenses";
			_img3 ctrlSetText "extras\icons\vehSearch.jpg";
			_btn3 ctrlSetTooltip "Search your target if he is restrained";
			_img4 ctrlSetText "extras\icons\escort.jpg";
			_btn4 ctrlSetTooltip "Un-escort your target or escort him if he is restrained";
			_img5 ctrlSetText "extras\icons\ticket.jpg";
			_btn5 ctrlSetTooltip "Issue your target with a ticket";
			_img6 ctrlSetText "extras\icons\jail.jpg";
			_btn6 ctrlSetTooltip "Put your target in jail if you are at a main police HQ";
			_img7 ctrlSetText "extras\icons\enterCar.jpg";
			_btn7 ctrlSetTooltip "Put civilian in your vehicle";
			_img8 ctrlSetText "extras\icons\computer.jpg";
			_btn8 ctrlSetTooltip "Run civilians name through the system";
			_img9 ctrlSetText "extras\icons\beating.jpg";
			_btn9 ctrlSetTooltip "Beat this civilian for information or locations to stolen money";
			
			//Hide buttons that are not always available
			_btn1 ctrlEnable false;
			_btn3 ctrlEnable false;
			_btn4 ctrlEnable false;
			_btn6 ctrlEnable false;
			_btn9 ctrlEnable false;
			
			if((DS_cursorTarget getVariable ["cuffed",false])||(DS_cursorTarget getVariable ["ziptied",false]))then
				{
				_btn1 ctrlEnable true;
				_btn3 ctrlEnable true;
				_btn1 buttonSetAction "[] spawn DS_cop_unRestrain;";
				_Btn3 buttonSetAction "[DS_cursorTarget] spawn DS_cop_searchCivCop;";
				}
				else
				{
				if(DS_cursorTarget getVariable ["surrender",false])then
					{
					_btn1 ctrlEnable true;
					_btn1 buttonSetAction "[] spawn DS_cop_restrain;";
					};
				};
			_btn2 buttonSetAction "[[player],""DS_fnc_checkLicenses"",DS_cursorTarget,FALSE] spawn DS_fnc_MP";	
			if(DS_cursorTarget getVariable ["escorted",false])then
				{
				_btn4 ctrlEnable true;
				_Btn4 buttonSetAction "[DS_cursorTarget] spawn DS_cop_unescortCiv; closeDialog 0;";	
				}
				else
				{
				_btn4 ctrlEnable true;
				_Btn4 buttonSetAction "[DS_cursorTarget] spawn DS_cop_escortCiv; closeDialog 0;";
				};
			_Btn5 buttonSetAction "[DS_cursorTarget] spawn DS_cop_issueTicket;";	
			if((player distance (getMarkerPos "police_hq_1") < 100)||(player distance (getMarkerPos "cop_spawn_5") < 100)||(player distance (getMarkerPos "cop_spawn_3") < 100)||(player distance (getMarkerPos "police_hq_2") < 100))then
				{
				_btn6 ctrlEnable true;
				_Btn6 buttonSetAction "[DS_cursorTarget] spawn DS_cop_jailMenu;";	
				};
			_mcu = (nearestobjects [getPos player,["LandVehicle"], 50]) select 0;
			if(!isNull _mcu)then
				{
				if(_mcu isKindOf "O_Truck_03_covered_F")then
					{
					_Btn6 ctrlEnable true;
					_Btn6 buttonSetAction "[DS_cursorTarget] spawn DS_cop_jailMenu;";
					};
				};
			if(DS_cursorTarget getVariable ["cuffed",false])then
				{
				_btn7 ctrlEnable true;
				_Btn7 buttonSetAction "[DS_cursorTarget] spawn DS_cop_putInVeh;";
				};
			_Btn8 buttonSetAction "[DS_cursorTarget] spawn DS_cop_checkCharges;";
			if(DS_cursorTarget getVariable ["cuffed",false])then
				{
				_btn9 ctrlEnable true;
				_Btn9 buttonSetAction "[DS_cursorTarget] spawn DS_cop_beating;";
				};
			}
			else
			{
			_img1 ctrlSetText "extras\icons\revive.jpg";
			_btn1 ctrlSetTooltip "Revive this person";
			_btn1 ctrlEnable true;
			_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_fnc_revive;";
			_img2 ctrlSetText "extras\icons\enterCar.jpg";
			_btn2 ctrlSetTooltip "Remove this dead body (Must have a police vehicle nearby";
			if(DS_copLevel > 0)then
				{
				_btn2 ctrlEnable true;
				_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_cop_removeDead;";
				};
			};
		};
	case civilian:
		{
			if(!alive DS_cursorTarget)then
				{
				_img1 ctrlSetText "extras\icons\revive.jpg";
				_btn1 ctrlSetTooltip "Revive this person if you have advanced rebel training";
				_img2 ctrlSetText "extras\icons\strangle.jpg";
				_btn2 ctrlSetTooltip "Strangle this person to death";
				if(DSL_rebelAdv)then
					{
					_btn1 ctrlEnable true;
					_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_fnc_revive;";
					_btn2 ctrlEnable true;
					_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_strangle;";
					};
				}
				else
				{
				_img1 ctrlSetText "extras\icons\cuffs.jpg";
				_btn1 ctrlSetTooltip "un-restrain this person if you have rebel training";
				_img2 ctrlSetText "extras\icons\escort.jpg";
				_btn2 ctrlSetTooltip "Escort or un-escort a hand cuffed person";
				_img3 ctrlSetText "extras\icons\enterCar.jpg";
				_btn3 ctrlSetTooltip "Put a hand cuffed person into a vehicle";
				if(DSL_rebel)then
					{
					_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_civ_unRestrain;";
					};
				if(DS_cursorTarget getVariable ["cuffed",false])then
					{
					_btn3 ctrlEnable true;
					_Btn3 buttonSetAction "[DS_cursorTarget] spawn DS_civ_putInVeh; closeDialog 0;";
					};
				if(DS_cursorTarget getVariable ["escorted",false])then
					{
					_btn2 ctrlEnable true;
					_Btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_unescortCiv; closeDialog 0;";	
					}
					else
					{
					_btn2 ctrlEnable true;
					_Btn2 buttonSetAction "[DS_cursorTarget] spawn DS_civ_escortCiv; closeDialog 0;";
					};
				if((player distance (getMarkerPos "hostageArea1") < 200)||(player distance (getMarkerPos "hostageArea2") < 200)||(player distance (getMarkerPos "hostageArea3") < 200))then
					{
					_btn4 ctrlEnable true;
					_btn4 ctrlSetTooltip "Begin Ransom Mission";
					_Btn4 buttonSetAction "[DS_cursorTarget,false] spawn DS_civ_hostageArea; closeDialog 0;";
					_img4 ctrlSetText "extras\icons\cuffs.jpg";
					};
				};
		};
	case independent:
		{
			if(player getVariable ["medic",false])then
				{
				if(!alive DS_cursorTarget)then
					{
					_img1 ctrlSetText "extras\icons\revive.jpg";
					_btn1 ctrlSetTooltip "Revive this person";
					_btn1 ctrlEnable true;
					_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_med_medicRevive;";
					_img2 ctrlSetText "extras\icons\enterCar.jpg";
					_btn2 ctrlSetTooltip "Remove Body";
					_btn2 ctrlEnable true;
					_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_med_removeDeadMedic;";
					}
					else
					{
					_img1 ctrlSetText "extras\icons\requestMoney.jpg";
					_btn1 ctrlSetTooltip "Charge for services";
					_btn1 ctrlEnable true;
					_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_med_issueTicketMedic;";
					_img2 ctrlSetText "extras\icons\revive.jpg";
					_btn2 ctrlSetTooltip "Treat illness";
					_btn2 ctrlEnable true;
					_btn2 buttonSetAction "[DS_cursorTarget] spawn DS_med_treatSicknessMedic;";
					};
				};
			if(player getVariable ["mechanic",false])then
				{
				_img1 ctrlSetText "extras\icons\requestMoney.jpg";
				_btn1 ctrlSetTooltip "Charge for services";
				_btn1 ctrlEnable true;
				_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_mech_issueTicketMech;";
				};
			if(player getVariable ["security",false])then
				{
				if(alive DS_cursorTarget)then
					{
					_header ctrlSetText "";
					_img1 ctrlSetText "extras\icons\cuffs.jpg";
					_btn1 ctrlSetTooltip "Remove or place your target in handcuffs if their hands are up or they are tazed";
					_img2 ctrlSetText "extras\icons\escort.jpg";
					_btn2 ctrlSetTooltip "Un-escort your target or escort him if he is restrained";
					_img3 ctrlSetText "extras\icons\ticket.jpg";
					_btn3 ctrlSetTooltip "Issue your target with a ticket";
					_img4 ctrlSetText "extras\icons\jail.jpg";
					_btn4 ctrlSetTooltip "Put your target in jail if you are at a main police HQ";
					_img5 ctrlSetText "extras\icons\enterCar.jpg";
					_btn5 ctrlSetTooltip "Put civilian in your vehicle";
					_img6 ctrlSetText "extras\icons\computer.jpg";
					_btn6 ctrlSetTooltip "Run civilians name through the system";
					_img7 ctrlSetText "extras\icons\jail.jpg";
					_btn7 ctrlSetTooltip "Send a highly wanted criminal to Kavala Police HQ";
					
					//Hide buttons that are not always available
					_btn1 ctrlEnable false;
					_btn4 ctrlEnable false;
					_btn9 ctrlEnable false;
					
					if(DS_cursorTarget getVariable ["cuffed",false])then
						{
						_btn1 ctrlEnable true;
						_btn2 ctrlEnable true;
						_btn1 buttonSetAction "[] spawn DS_cop_unRestrain;";
						}
						else
						{
						if(DS_cursorTarget getVariable ["surrender",false])then
							{
							_btn1 ctrlEnable true;
							_btn1 buttonSetAction "[] spawn DS_cop_restrain;";
							};
						};
					if(DS_cursorTarget getVariable ["escorted",false])then
						{
						_btn2 ctrlEnable true;
						_Btn2 buttonSetAction "[DS_cursorTarget] spawn DS_cop_unescortCiv; closeDialog 0;";	
						}
						else
						{
						_btn2 ctrlEnable true;
						_Btn2 buttonSetAction "[DS_cursorTarget] spawn DS_cop_escortCiv; closeDialog 0;";
						};
					_Btn3 buttonSetAction "[DS_cursorTarget] spawn DS_cop_issueTicket;";	
					if((player distance (getMarkerPos "secSpawn1") < 100)||(player distance (getMarkerPos "secSpawn2") < 100))then
						{
						_btn4 ctrlEnable true;
						_Btn4 buttonSetAction "[DS_cursorTarget] spawn DS_cop_jailMenu;";
						_btn7 ctrlEnable true;
						_Btn7 buttonSetAction "[DS_cursorTarget] spawn DS_sec_sendCriminal;";
						};
					if(DS_cursorTarget getVariable ["cuffed",false])then
						{
						_btn5 ctrlEnable true;
						_Btn5 buttonSetAction "[DS_cursorTarget] spawn DS_cop_putInVeh;";
						};
					_Btn6 buttonSetAction "[DS_cursorTarget] spawn DS_cop_checkCharges;";
					}
					else
					{
					_img1 ctrlSetText "extras\icons\revive.jpg";
					_btn1 ctrlSetTooltip "Revive this person";
					_btn1 ctrlEnable true;
					_btn1 buttonSetAction "[DS_cursorTarget] spawn DS_fnc_revive;";
					};
				};
		};
	};
			

