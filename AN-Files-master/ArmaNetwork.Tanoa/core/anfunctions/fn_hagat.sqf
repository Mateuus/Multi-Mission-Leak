/*
  ArmA.Network
  Rathbone
  (c) ArmA.Network 2016

  The usage of this file is restricted to ArmA.Network
  You're not allowed to modify this file!
  Licensed under the Arma EULA and Arma Tools EULA.
  For further questions contact the author!
*/
disableSerialization;
createdialog "identification_form";
_display = (finddisplay 90000);
if(isNil "identity_form_check") then {identity_form_check = false;};
_name = _display displayCtrl 1003; //Name
_c2 = _display displayCtrl 2100; //AgeDay
_c3 = _display displayCtrl 2101; //AgeMonth
_c4 = _display displayCtrl 2102; //AgeYear
_c5 = _display displayCtrl 2103; //Gender
_c6	=	_display displayCtrl 2104; //EyeColor
_c7 = _display displayCtrl 2105; //Residence
_c8 = _display displayCtrl 2106; //Height
_c9 = _display displayCtrl 2107; //Weight
_c10 = _display displayCtrl 2108; //Religion
_confirm = _display displayCtrl 2400; //Confirm

_religion = getArray(missionConfigFile >> "CfgIdentification" >> "religion");
_eyes = getArray(missionConfigFile >> "CfgIdentification" >> "eyes");
_residence = getArray(missionConfigFile >> "CfgIdentification" >> "residence");
_gender = getArray(missionConfigFile >> "CfgIdentification" >> "gender");

_name ctrlSetText format ["Full Name: %1",profileName];

for "_i" from 1 to 31 do {
	_c2 lbAdd format ["%1",_i];
};
for "_i" from 1 to 12 do {
	_c3 lbAdd format ["%1",_i];
};
for "_i" from 1940 to 1995 do {
	_c4 lbAdd format ["%1",_i];
};

{
	_c5 lbAdd _x;
} forEach _gender;

for "_i" from 160 to 230 do {
	_c8 lbAdd format ["%1",_i];
};

for "_i" from 60 to 180 do {
	_c9 lbAdd format ["%1",_i];
};

{
	_c6 lbAdd _x;
} forEach _eyes;

{
	_c7 lbAdd _x;
} forEach _residence;

{
	_c10 lbAdd _x;
} forEach _religion;

_c2 lbSetCurSel 0;
_c3 lbSetCurSel 0;
_c4 lbSetCurSel 0;
_c5 lbSetCurSel 0;
_c6 lbSetCurSel 0;
_c7 lbSetCurSel 0;
_c8 lbSetCurSel 0;
_c9 lbSetCurSel 0;
_c10 lbSetCurSel 0;
_c2temp = "";
_c3temp = "";
_c4temp = "";
_c5temp = "";
_c6temp = "";
_c7temp = "";
_c8temp = "";
_c9temp = "";
_c10temp = "";

_confirm ctrlSetText "Finish";
_confirm buttonSetAction "identity_form_check = true;";

_finish = true;
//systemChat format ["%1",_finish];
if (!isNil "identity_temp_save") then {
	_c2 lbSetCurSel (identity_temp_save select 0);
	_c3 lbSetCurSel (identity_temp_save select 1);
	_c4 lbSetCurSel (identity_temp_save select 2);
	_c5 lbSetCurSel (identity_temp_save select 3);
	_c6 lbSetCurSel (identity_temp_save select 4);
	_c7 lbSetCurSel (identity_temp_save select 5);
	_c8 lbSetCurSel (identity_temp_save select 6);
	_c9 lbSetCurSel (identity_temp_save select 7);
	_c10 lbSetCurSel (identity_temp_save select 8);
};

while {_finish} do {
  waituntil {(!identity_form_check && isNull (findDisplay 90000)) || identity_form_check};
	if(!identity_form_check) exitwith {};
  _c2temp = _c2 lbText (lbCurSel _c2);
	_c3temp = _c3 lbText (lbCurSel _c3);
	_c4temp = _c4 lbText (lbCurSel _c4);
	_c5temp = _c5 lbText (lbCurSel _c5);
	_c6temp = _c6 lbText (lbCurSel _c6);
	_c7temp = _c7 lbText (lbCurSel _c7);
	_c8temp = _c8 lbText (lbCurSel _c8);
	_c9temp = _c9 lbText (lbCurSel _c9);
	_c10temp = _c10 lbText (lbCurSel _c10);
  identity_temp_save = [(lbCurSel _c2),(lbCurSel _c3),(lbCurSel _c4),(lbCurSel _c5),(lbCurSel _c6),(lbCurSel _c7),(lbCurSel _c8),(lbCurSel _c9),(lbCurSel _c10)];
	if(identity_form_check) exitWith {};
};

if(!identity_form_check) exitwith {};
closedialog 0;
[profileName,_c2temp,_c3temp,_c4temp,_c5temp,_c6temp,_c7temp,_c8temp,_c9temp,_c10temp] spawn life_fnc_crasw;
