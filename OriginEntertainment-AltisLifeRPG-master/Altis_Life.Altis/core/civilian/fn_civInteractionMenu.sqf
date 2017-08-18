/*
	File: fn_civInteractionMenu.sqf

*/
#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457

#define Title 37401

private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
	
	ctrlShow[37456,false];
	ctrlShow[37457,false];
	ctrlShow[37458,false];
	ctrlShow[37459,false];
	
	
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;}; //Bad target
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;

life_pInact_curTarget = _curTarget;

_Btn1 ctrlSetText "Restrain";
_Btn1 buttonSetAction "
		
		if(player distance life_pInact_curTarget > 4) exitWith {hint 'You are too far away.'};
		
		if(([false,'ziptie',1] call life_fnc_handleInv)) then
		{
			life_pInact_curTarget setVariable['restrained',true,true];
			[[player], 'life_fnc_restrain', life_pInact_curTarget, false] spawn life_fnc_MP;
			hint format['%1 restrained.', name life_pInact_curTarget];
			if(!(license_civ_vigilante)) then {
				[[getPlayerUID player,name player,'207'],'life_fnc_wantedAdd',false,false] spawn life_fnc_MP;
			};
			closeDialog 0;
		} else {
			hint 'You have nothing to restrain them with.';
		};
		";

//Set Unrestrain Button
_Btn2 ctrlSetText "Unrestrain";
_Btn2 buttonSetAction "

		if(player distance life_pInact_curTarget > 4) exitWith {hint 'You are too far away.'};
		
		if(license_civ_vigilante) exitWith {
			titleText['You have unrestrained the player.','PLAIN'];
			[life_pInact_curTarget] call life_fnc_unrestrain;
			life_pInact_curTarget setVariable['restrained',false,true];
			life_pInact_curTarget setVariable['Escorting',false,true];
			life_pInact_curTarget setVariable['transporting',false,true];
			life_pInact_curTarget setVariable ['surrender', false, true];
		};
		
		if(([false,'lockpick',1] call life_fnc_handleInv)) then
		{
			closeDialog 0;

			_dice = random(100);
			titleText['Attempting to unrestrain player...','PLAIN'];
			if(_dice < 40) then {
				titleText['You successfully unrestrained the player.','PLAIN'];
				[life_pInact_curTarget] call life_fnc_unrestrain;
				life_pInact_curTarget setVariable['restrained',false,true];
				life_pInact_curTarget setVariable['Escorting',false,true];
				life_pInact_curTarget setVariable['transporting',false,true];
				life_pInact_curTarget setVariable ['surrender', false, true];
			} else {
				titleText['The lockpick broke.','PLAIN'];
			};
			
			
		} else {
			hint 'You have no lockpicks.';
		};
		 ";

//Set Escort Button
if((_curTarget getVariable["Escorting",false])) then {
	_Btn3 ctrlSetText "Stop Escorting";
	_Btn3 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; closeDialog 0;";
} else {
	_Btn3 ctrlSetText "Escort";
	_Btn3 buttonSetAction "if(player distance life_pInact_curTarget > 4) exitWith {hint 'You are too far away.'}; [life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};

_Btn4 ctrlSetText "Put in car";
_Btn4 buttonSetAction "if(player distance life_pInact_curTarget > 4) exitWith {hint 'You are too far away.'}; [life_pInact_curTarget] call life_fnc_putInCar;";

_Btn5 ctrlSetText "Rob Player";
_Btn5 buttonSetAction "if(player distance life_pInact_curTarget > 4) exitWith {hint 'You are too far away.'}; [life_pInact_curTarget] call life_fnc_robAction;";

_Btn6 ctrlSetText "Send to Jail";
_Btn6 buttonSetAction "if(player distance life_pInact_curTarget > 4) exitWith {hint 'You are too far away.'}; [life_pInact_curTarget] call life_fnc_arrestAction; ";

//disable certain buttons depending on if the target is restrained or not
if((life_pInact_curTarget getVariable["restrained",false])) then
{
	_Btn1 ctrlEnable false;
}else {
	_Btn2 ctrlEnable false;
	_Btn5 ctrlEnable false;
	_Btn4 ctrlEnable false;
	_Btn3 ctrlEnable false;
	_Btn6 ctrlEnable false;
};

//if civ only allow restraining of surrendered targets
if(!(life_pInact_curTarget getVariable["surrender",false])) then 
{
	_Btn1 ctrlEnable false;
	if(!(license_civ_vigilante)) then {
		hint "This player has not yet surrendered.";
	};
};


//if no weapon is being held disable all actions except stop escort
if(currentWeapon player == "") then {
	_Btn1 ctrlEnable false;
	_Btn2 ctrlEnable false;
	if(!(_curTarget getVariable["Escorting",false])) then {
		_Btn3 ctrlEnable false;
	};
	_Btn4 ctrlEnable false;
	_Btn5 ctrlEnable false;
	hint "You're not very intimidating without a gun.";
};

//Check that you are near a place to jail them.
if(!((player distance (getMarkerPos "jail_marker") < 55) OR (player distance (getMarkerPos "jail_marker_1") < 55))) then 
{
	_Btn6 ctrlEnable false;
};

//Disabled due to bounty < $20,000
/*
if(!()) then {
	_Btn6 ctrlEnable false;
}*/

//if not vig, disable arrest button, if vig always enable restrain while target is not restrained.
if(!(license_civ_vigilante)) then {
	_Btn6 ctrlEnable false;
}else {
	if(!(life_pInact_curTarget getVariable["restrained",false]) && (currentWeapon player != "")) then
	{
		_Btn1 ctrlEnable true;
	};
	_Btn5 ctrlEnable false;
};

