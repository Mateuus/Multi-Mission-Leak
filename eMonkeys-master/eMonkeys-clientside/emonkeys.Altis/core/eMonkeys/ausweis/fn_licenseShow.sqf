
/*
	Author: Christian "Cifon" Runggas
	E-mail: me@cifon.de
*/
_unit = cursorTarget;
_mode = _this select 0;

if(isNull _unit) exitWith {};
if((player distance _unit > 3)) exitWith {};
if(player == _unit) exitWith {};
if(!isPlayer _unit) exitWith {};
if(_unit getVariable "onkill") exitWith {hint "Man zeigt toten keine Führerscheine";};

switch (_mode) do
{
	case 0:	//PKW Führerschein
	{
		if(count eM_ausweis == 0) then
		{
			_bild = selectRandom ["0","1","2","3","4","5","6","7","8","9","10","11","12"];
			_nulAusweis = [0,name player,[name player,"","9.11.1931","Deutsch","Männlich","Altis",(parseNumber _bild)],"2016-06-04 22:20:03",getPlayerUID player];
			[[0,_nulAusweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		} else {
			[[0,eM_ausweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		};
	};
	case 1:	//LKW Führerschein
	{
		if(count eM_ausweis == 0) then
		{	
			_bild = selectRandom ["0","1","2","3","4","5","6","7","8","9","10","11","12"];
			_nulAusweis = [0,name player,[name player,"","9.11.1931","Deutsch","Männlich","Altis",(parseNumber _bild)],"2016-06-04 22:20:03",getPlayerUID player];
			[[1,_nulAusweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		} else {
			[[1,eM_ausweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		};
	};
	case 2:	//Pilotenschein
	{
		if(count eM_ausweis == 0) then
		{
			_bild = selectRandom ["0","1","2","3","4","5","6","7","8","9","10","11","12"];
			_nulAusweis = [0,name player,[name player,"","9.11.1931","Deutsch","Männlich","Altis",(parseNumber _bild)],"2016-06-04 22:20:03",getPlayerUID player];
			[[2,_nulAusweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		} else {
			[[2,eM_ausweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		};
	};
	case 3:	//Waffenschein
	{
		if(count eM_ausweis == 0) then
		{
			_bild = selectRandom ["0","1","2","3","4","5","6","7","8","9","10","11","12"];
			_nulAusweis = [0,name player,[name player,"","9.11.1931","Deutsch","Männlich","Altis",(parseNumber _bild)],"2016-06-04 22:20:03",getPlayerUID player];
			[[3,_nulAusweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		} else {
			[[3,eM_ausweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		};
	};
	case 4:	//Logistiklizenz
	{
		if(count eM_ausweis == 0) then
		{
			_bild = selectRandom ["0","1","2","3","4","5","6","7","8","9","10","11","12"];
			_nulAusweis = [0,name player,[name player,"","9.11.1931","Deutsch","Männlich","Altis",(parseNumber _bild)],"2016-06-04 22:20:03",getPlayerUID player];
			[[4,_nulAusweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		} else {
			[[4,eM_ausweis],"EMonkeys_fnc_licenseShown",_unit,false] call EMonkeys_fnc_mp;
		};
	};
};