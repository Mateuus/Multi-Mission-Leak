if(count _this > 2) then {
	_handle = [
		format["<t size='1.3' color='#FF0000'>%1</t><br/>%2",_this select 0, _this select 1],
		0,
		0.2,
		_this select 2,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
} else {
	_handle = [
		format["<t size='1.3' color='#FF0000'>%1</t><br/>%2",_this select 0, _this select 1],
		0,
		0.2,
		99999999999999,
		0,
		0,
		8
	] spawn BIS_fnc_dynamicText;
};

//waitUntil {scriptDone _handle};
true