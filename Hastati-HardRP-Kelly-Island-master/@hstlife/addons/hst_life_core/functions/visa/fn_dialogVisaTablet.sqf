#include "\hst_life_core\script_macros.hpp"
/*
	Author: Kajetan "Kruk" Mruk
	

	Description:
	Execute received remote execution

	Parameter(s):
	_this select 0: STRING - Packet variable name (always "life_fnc_MP_packet")
	_this select 1: ARRAY - Packet value (sent by life_fnc_MP function; see it's description for more details)
	
	Returns:
	BOOL - true if function was executed successfully
*/
#define DISPLAY 61304
#define VISA_LIST 3001
#define VISA_INFO 3002
#define PREVIEW_BUTTON 3003
#define GIVE_BUTTON 3004
disableSerialization;



_mode = _this select 0;
_target = _this select 1;
if(!alive player || dialog) exitWith {}; //Prevent them from opening this for exploits while dead.
createDialog "hst_life_core_tabletVisaSelect";
_display = findDisplay DISPLAY;
_list = _display displayCtrl VISA_LIST;
_info = _display displayCtrl VISA_INFO;
_previewButton = _display displayCtrl PREVIEW_BUTTON;
_giveButton = _display displayCtrl GIVE_BUTTON;
if(_mode == 1) then {
	if(isNil "_target") exitWith {};
} else {
	_giveButton ctrlShow false;
};
{
	_index = _list lbAdd format ["%1 %2 - %3", (_x select 2), (_x select 1), (_x select 8)];
	_list lbSetData [_index, str(_x select 0)];

} forEach hst_life_core_idCards;

hst_life_core_dialogVisaTablet_onLBChange = {
	disableSerialization;
	_dialog = findDisplay 61304;
	_ctr = _dialog displayCtrl 3002;
	_ctr2 = _dialog displayCtrl 3001;
	_index = (lbCurSel _ctr2);
	_data = (_ctr2 lbData _index);
	_visaID = parseNumber _data;
	{
		_id = _x select 0;
		if(_id == _visaID) exitWith {
			_name = _x select 1;
			_surname = _x select 2;
			_gender = _x select 3;
			_birthDate = _x select 4;
			_fatherName = _x select 5;
			_motherName = _x select 6;
			_motherSurname = _x select 7;
			_pesel = _x select 8;
			
			_str = format ["%1 %2\nPESEL: %3\nData urodzenia: %4\nImiona rodzicow: %5 %6(z d. %7)", _surname, _name, _pesel, _birthDate, _fatherName, _motherName, _motherSurname];
			_ctr ctrlSetText _str;
		};
	} foreach hst_life_core_idCards;
};
//[] spawn life_fnc_phoneGetActiveNumber;
_list ctrlSetEventHandler ["LBSelChanged", "[] spawn hst_life_core_dialogVisaTablet_onLBChange"];
_list lbSetCurSel 0;
