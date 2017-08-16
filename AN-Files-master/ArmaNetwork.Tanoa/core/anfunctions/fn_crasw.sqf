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
params [
  ["_name","",[""]],
  ["_c2temp","",[""]],
  ["_c3temp","",[""]],
  ["_c4temp","",[""]],
  ["_c5temp","",[""]],
  ["_c6temp","",[""]],
  ["_c7temp","",[""]],
  ["_c8temp","",[""]],
  ["_c9temp","",[""]],
  ["_c10temp","",[""]]
];
disableSerialization;
createDialog "identification_check";
_display = (finddisplay 90001);
identity_form_check = false;
_finish = false;
_d1 = _display displayCtrl 1100;
_d2 = _display displayCtrl 2400;
_d3 = _display displayCtrl 2401;

_d2 ctrlsettext "Back";
_d2 buttonSetAction "closeDialog 0";
_d3 ctrlsettext "Sign";
_d3 buttonSetAction "identity_form_check = true;";

_d1 ctrlSetStructuredText parseText format ["<t size='2' align='center'>Your ID</t><br/>Full Name: %1<br/>Date of Birth(DD/MM/YY): %2-%3-%4<br/>Gender: %5<br/>Eye Colour: %6<br/>Residence: %7<br/>Height(cm): %8<br/>Weight (kg): %9<br/>Religion: %10",_name,_c2temp,_c3temp,_c4temp,_c5temp,_c6temp,_c7temp,_c8temp,_c9temp,_c10temp];

waituntil {(!identity_form_check && isNull (finddisplay 90001)) || identity_form_check};

if(!identity_form_check) exitwith {[] spawn life_fnc_hagat;};
closedialog 0;
_array = [];
_array pushBack _name;
_array pushBack _c2temp;
_array pushBack _c3temp;
_array pushBack _c4temp;
_array pushBack _c5temp;
_array pushBack _c6temp;
_array pushBack _c7temp;
_array pushBack _c8temp;
_array pushBack _c9temp;
_array pushBack _c10temp;
[_array,(getPlayerUID player),player] remoteExecCall ["life_fnc_identificationDB",2];
PlayerIDArray = _array;
identity_form_check = nil;
identity_temp_save = nil;
