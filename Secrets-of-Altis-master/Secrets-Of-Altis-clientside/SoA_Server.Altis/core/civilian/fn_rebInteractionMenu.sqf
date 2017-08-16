/*
	File: fn_civInteractionMenu.sqf
	Author: Audacious
	
	Description:
	Replaces the mass addactions for various civ actions towards another player.
*/
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10","_hudsmall"];
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {hint "Kein Ziel!"}; //Bad target
if(!isPlayer _curTarget) exitWith {hint "Kein Ziel!"}; //Bad side check?
if(!((currentWeapon player == primaryWeapon player OR currentWeapon player == handgunWeapon player) && currentWeapon player != "" && !life_knockout && !(player getVariable["hostage",false]) && !life_istazed)) exitWith {hint "Das geht jetzt nicht!"}; //Bad side check?

_display = findDisplay 37400;
_hudsmall = _display displayCtrl 37402;
_hudsmall ctrlSetTextColor [1,1,1,1];

_hudselection = [] call life_fnc_hudcfg;
switch(((_hudselection select hudselection) select 3)) do {
	case 0: {_hudsmall ctrlSetText "images\hud\hudleftbig.paa"};
	case 1: {_hudsmall ctrlSetText "images\hud\hudleftbig2.paa"};
	case 2: {_hudsmall ctrlSetText ""};
};

playsound "woosh";
_hudsmall ctrlSetPosition [0.102969 * safezoneW + safezoneX,0.511 * safezoneH + safezoneY,0.0979687 * safezoneW,0.385 * safezoneH];
_hudsmall ctrlCommit 0.3;

life_pInact_curTarget = _curTarget;

WaitUntil{ctrlCommitted _hudsmall};

_Btn1 = _display ctrlCreate ["RscButtonMenu",37460];
_Btn2 = _display ctrlCreate ["RscButtonMenu",37461];
_Btn3 = _display ctrlCreate ["RscButtonMenu",37462];
_Btn4 = _display ctrlCreate ["RscButtonMenu",37463];
_Btn5 = _display ctrlCreate ["RscButtonMenu",37464];
_Btn6 = _display ctrlCreate ["RscButtonMenu",37465];

_Btn1 ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.555 * safezoneH + safezoneY,0.0721875 * safezoneW,0.022 * safezoneH];
_Btn2 ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.599 * safezoneH + safezoneY,0.0721875 * safezoneW,0.022 * safezoneH];
_Btn3 ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.643 * safezoneH + safezoneY,0.0721875 * safezoneW,0.022 * safezoneH];
_Btn4 ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.687 * safezoneH + safezoneY,0.0721875 * safezoneW,0.022 * safezoneH];
_Btn5 ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.731 * safezoneH + safezoneY,0.0721875 * safezoneW,0.022 * safezoneH];
_Btn6 ctrlSetPosition [0.113281 * safezoneW + safezoneX,0.775 * safezoneH + safezoneY,0.0721875 * safezoneW,0.022 * safezoneH];

_btn1 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Schlagen</t>";
_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_TorturePlayer;";

_btn2 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Elektroschock</t>";
_Btn2 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_elektroschock;";

_btn3 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Waterboarding</t>";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_waterboarding;";

/*_btn4 ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Menü einklappen</t>";
_Btn4 buttonSetAction "
	_display = findDisplay 37400;

	_hudsmall = _display displayCtrl 37402;
	_Btn1 = _display displayCtrl 37460;
	_Btn2 = _display displayCtrl 37461;
	_Btn3 = _display displayCtrl 37462;
	_Btn4 = _display displayCtrl 37463;
	_Btn5 = _display displayCtrl 37464;
	_Btn6 = _display displayCtrl 37465;


	_hudsmall ctrlSetPosition [-0.000156274 * safezoneW + safezoneX,0.456 * safezoneH + safezoneY,0.103125 * safezoneW,0.495 * safezoneH];
	_hudsmall ctrlSetTextColor [1,1,1,0]; 
	_hudsmall ctrlCommit 1; 
	{ctrlDelete _x} foreach [_Btn1,_Btn2,_Btn3,_Btn4,_Btn5,_Btn6];
";*/


{_x ctrlEnable false; _x ctrlSetStructuredText parseText "<t size='0.9' valign='middle' align='center'>Nicht verfügbar</t>";} foreach [_btn4,_Btn5,_Btn6];
{_x ctrlCommit 0} foreach [_btn1,_btn2,_btn3,_btn4,_Btn5,_Btn6];