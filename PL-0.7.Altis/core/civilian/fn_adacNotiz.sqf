/*---------------------------------------------------------------------------
	File: fn_adacNotiz.sqf
	Auteur: Skrow & Skyfezzer
---------------------------------------------------------------------------*/
private["_mode","_unit","_name"];
_mode = [_this,0,0,[0]] call BIS_fnc_param;
_name = [_this,1,"",[""]] call BIS_fnc_param;

switch (_mode) do {
case 1:
	{
		["TextMessage",[format["Un dépanneur est en chemin."]]] call bis_fnc_showNotification;
		player setvariable["adacweg",true,true];
		player setvariable["adacname",_name,true];
	};
case 2: 
	{
		["TextMessage",[format["Le dépanneur à interrompu on trajet."]]] call bis_fnc_showNotification;
		player setvariable["adacweg",false,true];
	};
};

