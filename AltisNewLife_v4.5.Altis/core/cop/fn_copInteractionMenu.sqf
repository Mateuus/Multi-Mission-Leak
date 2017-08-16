#define Btn1 37450
#define Btn2 37451
#define Btn3 37452
#define Btn4 37453
#define Btn5 37454
#define Btn6 37455
#define Btn7 37456
#define Btn8 37457
#define Btn9 37458
#define Btn10 37459
#define Title 37401
private["_display","_curTarget","_Btn1","_Btn2","_Btn3","_Btn4","_Btn5","_Btn6","_Btn7","_Btn8","_Btn9","_Btn10"];
if(!dialog) then {
	createDialog "pInteraction_Menu";
};
disableSerialization;
_curTarget = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(isNull _curTarget) exitWith {closeDialog 0;};
if(_curTarget isKindOf "House_F") exitWith {
	if((nearestObject [[16019.5,16952.9,0],"Land_Dome_Big_F"]) == _curTarget OR (nearestObject [[16019.5,16952.9,0],"Land_Research_house_V1_F"]) == _curTarget) then {
		_display = findDisplay 37400;
		_Btn1 = _display displayCtrl Btn1;
		_Btn2 = _display displayCtrl Btn2;
		_Btn3 = _display displayCtrl Btn3;
		_Btn4 = _display displayCtrl Btn4;
		_Btn5 = _display displayCtrl Btn5;
		_Btn6 = _display displayCtrl Btn6;
		_Btn7 = _display displayCtrl Btn7;
		_Btn8 = _display displayCtrl Btn8;
		_Btn9 = _display displayCtrl Btn9;
		life_pInact_curTarget = _curTarget;
		_Btn1 ctrlSetText "Reparer Porte";
		_Btn1 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_repairDoor;";
		_Btn2 ctrlSetText "Ouvrir / Fermer";
		_Btn2 buttonSetAction "[life_pInact_curTarget] call life_fnc_doorAnimate;";
		_Btn3 ctrlShow false;
		_Btn4 ctrlShow false;
		_Btn5 ctrlShow false;
		_Btn6 ctrlShow false;
		_Btn7 ctrlShow false;
		_Btn8 ctrlShow false;
		_Btn9 ctrlShow false;
		_Btn10 ctrlShow false;
	} else {
		closeDialog 0;
	};
};
if(!isPlayer _curTarget && side _curTarget == civilian) exitWith {closeDialog 0;}; //Bad side check?
_display = findDisplay 37400;
_Btn1 = _display displayCtrl Btn1;
_Btn2 = _display displayCtrl Btn2;
_Btn3 = _display displayCtrl Btn3;
_Btn4 = _display displayCtrl Btn4;
_Btn5 = _display displayCtrl Btn5;
_Btn6 = _display displayCtrl Btn6;
_Btn7 = _display displayCtrl Btn7;
_Btn8 = _display displayCtrl Btn8;
_Btn9 = _display displayCtrl Btn9;
_Btn10 = _display displayCtrl Btn10;
life_pInact_curTarget = _curTarget;
_Btn1 ctrlSetText "Démenotter le suspect";
_Btn1 buttonSetAction "[life_pInact_curTarget] call life_fnc_unrestrain; closeDialog 0;";
_Btn2 ctrlSetText "Verifier ces licences";
_Btn2 buttonSetAction "[[player],""life_fnc_licenseCheck"",life_pInact_curTarget,FALSE] spawn life_fnc_MP";
_Btn3 ctrlSetText "Fouiller cette personne";
_Btn3 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_searchAction; closeDialog 0;";
if((_curTarget getVariable["Escorting",false])) then {
	_Btn4 ctrlSetText "Arreter l'escort";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_stopEscorting; [life_pInact_curTarget] call life_fnc_copInteractionMenu;";
} else {
	_Btn4 ctrlSetText "Escorter cet individu";
	_Btn4 buttonSetAction "[life_pInact_curTarget] call life_fnc_escortAction; closeDialog 0;";
};
_Btn5 ctrlSetText "Donner une amende";
_Btn5 buttonSetAction "[life_pInact_curTarget] call life_fnc_ticketAction;";
_Btn6 ctrlSetText "Mettre en prison";
_Btn6 buttonSetAction "closeDialog 0; [] call life_fnc_showArrestDialog;";
_Btn7 ctrlSetText "Embarquer";
_Btn7 buttonSetAction "[life_pInact_curTarget] call life_fnc_putInCar;";
_Btn8 ctrlSetText "Retirer armement";
_Btn8 buttonSetAction "[life_pInact_curTarget] spawn life_fnc_removeWeaponAction; closeDialog 0;";
_Btn9 ctrlSetText "Contrôle Alcool/Drogue";
_Btn9 buttonSetAction "[[player],""life_fnc_breathalyzer"",life_pInact_curTarget,FALSE] spawn life_fnc_MP;closeDialog 0";
_Btn10 ctrlSetText "Retirer des permis";
_Btn10 buttonSetAction "[life_pInact_curTarget] call life_fnc_revokeLicense;";
if(life_inv_cle > 0) then {_Btn1 ctrlEnable true;} else {_Btn1 ctrlEnable false;};
if(!((player distance (getMarkerPos "cop_spawn_1") < 90) OR
(player distance (getMarkerPos "cop_spawn_2") < 90) OR
(player distance (getMarkerPos "cop_spawn_3") < 90) OR
(player distance (getMarkerPos "cop_spawn_5") < 90) OR
(player distance (getMarkerPos "cop_spawn_6") < 90))) then {_Btn6 ctrlEnable false;};