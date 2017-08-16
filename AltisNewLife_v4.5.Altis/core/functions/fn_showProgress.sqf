private["_text", "_ui", "_progress", "_pgText", "_progress", "_cP", "_inc"];
_text = [_this,0,"",[""]] call BIS_fnc_param;
_totalSpan = [_this,1,5,[0]] call BIS_fnc_param;
disableSerialization;
5 cutRsc ["life_progress","PLAIN"];
_ui = uiNameSpace getVariable "life_progress";
_progress = _ui displayCtrl 38201;
_pgText = _ui displayCtrl 38202;
_pgText ctrlSetText "";
_progress progressSetPosition 0.01;
_cP = 0.01;
_inc = (1 / _totalSpan * 0.1);
while{true} do
{
	uiSleep  0.1;
	_cP = _cP + _inc;
	_progress progressSetPosition _cP;
	_pgText ctrlSetText _text;
	if(_cP >= 1) exitWith {};
};
5 cutText ["","PLAIN"];