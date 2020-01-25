#include <macro.h>
/*
	File: fn_craftMenu.sqf

	array numbers are:
	Silver / Steel / Metal / Wood / Oil
*/
disableSerialization;

_status = lbData[1113,lbCurSel (1113)];
_status = call compile format["%1", _status];

_mainMenus = ["Pistols","Illegal Pistols","Illegal SMGs","Mafia"];

_PistolClasses = ["KPFS_HKP7","KPFS_Mauser_Hsc","KPFS_Walther_M9","KPFS_P99","RH_g17","RH_g19","RH_g19t","RH_m9","RH_sw659","hgun_Rook40_F","hgun_P07_F","RH_gsh18","RH_kimber"];
_PricesPistolClasses = [[1,1,0,0,0],[1,0,1,0,0],[0,1,1,0,0],[0,2,0,0,0],[2,0,0,0,0],[1,2,0,0,0],[2,1,0,0,0],[1,1,2,0,0],[1,1,1,0,0],[2,1,1,0,0],[1,2,1,0,0],[1,2,2,0,0],[3,5,3,5,0]];
_PistolMags = [1,1,0,0,0];

_iPistolClasses = ["RH_vp70","RH_muzi","RH_tec9","RH_vz61","RH_fn57","RH_g18","RH_Deagleg","RH_Deaglem"];
_iPricesPistolClasses = [[1,3,1,3,0],[1,5,0,0,1],[4,1,1,3,0],[5,2,0,0,0],[2,2,3,8,0],[2,2,0,4,1],[4,2,0,0,2],[4,0,2,15,0]];
_iPistolMags = [1,1,0,0,1];

_iSMGClasses = ["hgun_PDW2000_F","SMG_02_F","chakFNP90_50rnd_skin1","SMG_01_F"];
_iPricesSMGClasses = [[2,2,10,0,0],[5,5,0,0,2],[3,1,1,35,1],[2,1,0,25,1]];
_iSMGMags = [1,1,1,1,1];

_iMafiaClasses = ["ej_Thompson","A3L_CZ550","A3L_AK47sgold","hlc_rifle_M1903A1","GG_Weaponpack_M1_Garand","hlc_rifle_M1903A1_unertl"];
_iPricesMafiaClasses = [[2,5,0,3,3],[2,2,10,0,4],[5,5,0,0,12],[2,2,0,0,9],[3,1,1,35,21],[2,1,0,25,25]];
_iMafiaMags = [1,0,0,1,3];












waitUntil {!isNull (findDisplay 1111)};

_display = findDisplay 1111;

if((_this select 0) == "REFRESH") exitwith {

	if(isNil "_status") exitwith {};

	if(_status IN _pistolClasses) then {
		_mySelect = 0;
		{
			if(_status == _x) exitwith {};
			_mySelect = _myselect + 1;
		} foreach _PistolClasses;
		_selectedWeapon = (configfile >> "CfgWeapons" >> _status >> "displayName") call BIS_fnc_getCfgData;
		if(isNil "_selectedWeapon") exitwith {}; //? how did we even get here.

		_myArray = _PricesPistolClasses select _mySelect;
		_mags = _PistolMags;
		_Btn4 = _display displayCtrl 1110;
		_Btn4 ctrlSetStructuredText parsetext format["<t color='#33CC33'> %1 <t color='#ffffff'> <br/> Silver: %2 <br/> Steel: %3 <br/> Metal: %4 <br/> Wood: %5 <br/> Oil: %6 <br/><br/><t color='#33CC33'>Magazine Cost <t color='#ffffff'> <br/> Silver: %7 <br/> Steel: %8 <br/> Metal: %9 <br/> Wood: %10 <br/> Oil: %11 ",_selectedWeapon,(_myArray select 0),(_myArray select 1),(_myArray select 2),(_myArray select 3),(_myArray select 4),(_Mags select 0),(_Mags select 1),(_Mags select 2),(_Mags select 3),(_Mags select 4)];
		_btn4 ctrlcommit 0;
	};

	if(_status IN _ipistolClasses) then {
		_mySelect = 0;
		{
			if(_status == _x) exitwith {};
			_mySelect = _myselect + 1;
		} foreach _iPistolClasses;
		_selectedWeapon = (configfile >> "CfgWeapons" >> _status >> "displayName") call BIS_fnc_getCfgData;
		if(isNil "_selectedWeapon") exitwith {}; //? how did we even get here.

		_myArray = _iPricesPistolClasses select _mySelect;
		_mags = _iPistolMags;
		_Btn4 = _display displayCtrl 1110;
		_Btn4 ctrlSetStructuredText parsetext format["<t color='#33CC33'> %1 <t color='#ffffff'> <br/> Silver: %2 <br/> Steel: %3 <br/> Metal: %4 <br/> Wood: %5 <br/> Oil: %6 <br/><br/><t color='#33CC33'>Magazine Cost <t color='#ffffff'> <br/> Silver: %7 <br/> Steel: %8 <br/> Metal: %9 <br/> Wood: %10 <br/> Oil: %11 ",_selectedWeapon,(_myArray select 0),(_myArray select 1),(_myArray select 2),(_myArray select 3),(_myArray select 4),(_Mags select 0),(_Mags select 1),(_Mags select 2),(_Mags select 3),(_Mags select 4)];
		_btn4 ctrlcommit 0;
	};

	if(_status IN _iSMGClasses) then {
		_mySelect = 0;
		{
			if(_status == _x) exitwith {};
			_mySelect = _myselect + 1;
		} foreach _iSMGClasses;
		_selectedWeapon = (configfile >> "CfgWeapons" >> _status >> "displayName") call BIS_fnc_getCfgData;
		if(isNil "_selectedWeapon") exitwith {}; //? how did we even get here.

		_myArray = _iPricesSMGClasses select _mySelect;
		_mags = _iSMGMags;
		_Btn4 = _display displayCtrl 1110;
		_Btn4 ctrlSetStructuredText parsetext format["<t color='#33CC33'> %1 <t color='#ffffff'> <br/> Silver: %2 <br/> Steel: %3 <br/> Metal: %4 <br/> Wood: %5 <br/> Oil: %6 <br/><br/><t color='#33CC33'>Magazine Cost <t color='#ffffff'> <br/> Silver: %7 <br/> Steel: %8 <br/> Metal: %9 <br/> Wood: %10 <br/> Oil: %11 ",_selectedWeapon,(_myArray select 0),(_myArray select 1),(_myArray select 2),(_myArray select 3),(_myArray select 4),(_Mags select 0),(_Mags select 1),(_Mags select 2),(_Mags select 3),(_Mags select 4)];
		_btn4 ctrlcommit 0;
	};

	if(_status IN _iMafiaClasses) then {
		_mySelect = 0;
		{
			if(_status == _x) exitwith {};
			_mySelect = _myselect + 1;
		} foreach _iMafiaClasses;
		_selectedWeapon = (configfile >> "CfgWeapons" >> _status >> "displayName") call BIS_fnc_getCfgData;
		if(isNil "_selectedWeapon") exitwith {}; //? how did we even get here.

		_myArray = _iPricesMafiaClasses select _mySelect;
		_mags = _iMafiaMags;
		_Btn4 = _display displayCtrl 1110;
		_Btn4 ctrlSetStructuredText parsetext format["<t color='#33CC33'> %1 <t color='#ffffff'> <br/> Silver: %2 <br/> Steel: %3 <br/> Metal: %4 <br/> Wood: %5 <br/> Oil: %6 <br/><br/><t color='#33CC33'>Magazine Cost <t color='#ffffff'> <br/> Silver: %7 <br/> Steel: %8 <br/> Metal: %9 <br/> Wood: %10 <br/> Oil: %11 ",_selectedWeapon,(_myArray select 0),(_myArray select 1),(_myArray select 2),(_myArray select 3),(_myArray select 4),(_Mags select 0),(_Mags select 1),(_Mags select 2),(_Mags select 3),(_Mags select 4)];
		_btn4 ctrlcommit 0;
	};

};





_Btn1 = _display displayCtrl 1115;
_Btn2 = _display displayCtrl 1116;
_Btn3 = _display displayCtrl 1117;
_Btn5 = _display displayCtrl 1118;

_btn1 ctrlShow false;
_btn2 ctrlShow false;
_btn3 ctrlShow false;
_btn5 ctrlShow false;

_list = _display displayCtrl 1113;

lbClear _list;

if((_this select 0) == "FRESH") exitwith {

	_btn3 ctrlShow true;

	{
		_list lbAdd _x;
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _mainMenus;


};

if(isNil "_status") exitwith { hint "Error with Selection!"; };

	_btn1 ctrlShow true;
	_btn2 ctrlShow true;
	_btn5 ctrlShow true;

if(_status == "Pistols") exitwith {

	{
		_selectedweapon = (configfile >> "CfgWeapons" >> _x >> "displayName") call BIS_fnc_getCfgData;
		_list lbAdd _selectedweapon;
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _pistolClasses;

};

if(_status == "Illegal Pistols") exitwith {

	{
		_selectedweapon = (configfile >> "CfgWeapons" >> _x >> "displayName") call BIS_fnc_getCfgData;
		_list lbAdd _selectedweapon;
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _ipistolClasses;

};

if(_status == "Illegal SMGs") exitwith {

	{
		_selectedweapon = (configfile >> "CfgWeapons" >> _x >> "displayName") call BIS_fnc_getCfgData;
		_list lbAdd _selectedweapon;
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _iSMGClasses;

};

if(_status == "Mafia") exitwith {

	{
		_selectedweapon = (configfile >> "CfgWeapons" >> _x >> "displayName") call BIS_fnc_getCfgData;
		_list lbAdd _selectedweapon;
		_list lbSetdata [(lbSize _list)-1,str(_x)];
	} foreach _iMafiaClasses;

};


if((_this select 0) == "CRAFT") exitwith {
	player addWeapon _status;
	hint format["You have crafted a %1",_status];
	closedialog 0;
};

if((_this select 0) == "CRAFTMAG") exitwith {
	_magazines = getArray (configFile / "CfgWeapons" / _status / "magazines");
	_magazineClass = _magazines select 0; 
	player addMagazine _magazineClass;
	player addMagazine _magazineClass;
	player addMagazine _magazineClass;
	player addMagazine _magazineClass;
	player addMagazine _magazineClass;
	hint format["You have crafted 5 mags for a %1",_status];
	closedialog 0;
};

closedialog 0;










