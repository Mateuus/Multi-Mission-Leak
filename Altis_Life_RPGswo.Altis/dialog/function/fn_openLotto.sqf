/*
	Autor: Taranis (Chris)
	Script: fn_openLotto.sqf

	Parameter:
		keine
*/
private["_nums","_name","_idc"];
disableSerialization;

_name = "";
lottoDialog = [[],nil];
lottoEdit = nil;
_nums = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25];
_checkBox = [[[0.7,0.26,0.03,0.04],true],[[0.7,0.30,0.03,0.04],false],[[0.7,0.34,0.03,0.04],false],[[0.7,0.5,0.03,0.04],true],[[0.7,0.54,0.03,0.04],false]];

if (!createDialog "lottoMain") exitWith {systemChat "Dialog kann nicht geöffnet werden."};

_display = findDisplay 52500;

{
	_idc = parseNumber format["5256%1",_forEachIndex];

	_ctrl = _display ctrlCreate["RscCheckBox",_idc];
	_ctrl ctrlSetPosition (_x select 0);
	_ctrl ctrlCommit 0;
	_ctrl cbSetChecked (_x select 1);
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetEventHandler ["CheckedChanged","_this call DWEV_fnc_lottoCheckBox"];
	_ctrl ctrlCommit 0;
} forEach _checkBox;

{
	if(_x < 10) then
	{
		_name = format["0%1",_x];
	} 
	else 
	{
		_name = format["%1",_x];
	};
	_idc = parseNumber format["525%1",_name];
	_pos = ctrlPosition (_display displayCtrl _idc);

	buttonSetAction[(_idc * 10),format["[%1] call DWEV_fnc_lottoButton",_x]];

	_ctrl = _display ctrlCreate["RscPicture",(_idc * 100)];
	_ctrl ctrlSetPosition _pos;
	_ctrl ctrlCommit 0;
	_ctrl ctrlSetText "";
	false;
} count _nums;

//Scheinnummer
//_idText = str floor(((log (1.0000025 + random 4000000/444445)))*1000000);
//_idNum = _idText select [count _idText - 6,6];

_idNum = round(random(50000));
_idText = str _idNum;

lottoDialog set[1,_idNum];
(_display displayCtrl 52531) ctrlSetText format["%1",_idNum];
(_display displayCtrl 52532) ctrlSetText "Noch 5 Zahlen";
(_display displayCtrl 52534) ctrlSetText format ["Jackpot: %1 €", [(DWEV_lotto_Serverpot * 0.8)] call DWEV_fnc_numberText];