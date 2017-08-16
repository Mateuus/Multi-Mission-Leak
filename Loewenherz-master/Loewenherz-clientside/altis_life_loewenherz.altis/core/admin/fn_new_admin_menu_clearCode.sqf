
private ["_lvl","_display","_Code_input","_code"];

disableSerialization;

_lvl = (call LHM_adminlevel);
if (_lvl < 3) exitWith {hint "Das kannst du noch nicht, Ätschie Bätsch :D ";};
if(isnull (findDisplay 9858)) exitWith {};

_display = findDisplay 9858;
_Code_input = _display displayCtrl 1401;

_Code_input ctrlsettext "";


