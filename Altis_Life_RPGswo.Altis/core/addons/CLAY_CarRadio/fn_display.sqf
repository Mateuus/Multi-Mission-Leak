
disableSerialization;
_control = (findDisplay 666) displayCtrl 602;
_colorOrder = [[1,1,0], [0,1,1], [1,0.5,0.25], [0,0,1], [0,1,0], [0.5,0.5,0.5], [0.5,1,0], [1,0.5,0], [1,0,0], [0.25,0,0.5], [1,1,1], [0.5,0,0]];
_c = 11;

while {dialog && CLAY_RadioDisplay == 0} do
{
	_color = _colorOrder select _c;
	_c = _c + 1;
	if (_c > 11) then {_c = 0};
	_nextColor = _colorOrder select _c;

	_r = _color select 0;
	_g = _color select 1;
	_b = _color select 2;

	_rNext = _nextColor select 0;
	_gNext = _nextColor select 1;
	_bNext = _nextColor select 2;

	_rStep = (_rNext - _r) / 20;
	_gStep = (_gNext - _g) / 20;
	_bStep = (_bNext - _b) / 20;

	for "_i" from 0 to 20 do
	{
		scopeName "Loop";
		If (CLAY_RadioDisplay != 0) Then
		{
			breakOut "Loop";
		};

		_r = _r + _rStep;
		_g = _g + _gStep;
		_b = _b + _bStep;
		_control ctrlSetBackgroundColor [_r,_g,_b,1];
		sleep 0.1;
	};
	sleep 1;
};
