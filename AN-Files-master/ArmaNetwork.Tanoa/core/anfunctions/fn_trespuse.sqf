
_isVote = param[0];
_info = param[1,""];

if(_isVote) then {
	_data = call compile format["%1",_info];
	[getPlayerUid player,_data select 2] remoteExecCall ["life_fnc_vote",2];
	hintSilent format["You have voted for %1!",_data select 1];
} else {
	_data = call compile format["%1",(_info select 0) lbData (_info select 1)];
	_display = findDisplay 6900;
	_text = _display displayCtrl 6903; 
	_text ctrlSetStructuredText parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><br/><t size='0.75'>%2</t>", _data select 1, _data select 0];
	ctrlEnable [6905, true];
};
