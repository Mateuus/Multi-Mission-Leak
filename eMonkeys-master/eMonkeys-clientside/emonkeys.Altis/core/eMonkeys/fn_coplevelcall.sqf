
if(!hasInterface && isServer) exitWith {};
private["_this","_coplevelarr","_return","_aab1","_aab2","_aab3","_aab4","_aab5","_aab6","_aab7"];

if(count _this == 0) exitWith { };

_aab1 = false;
_aab2 = false;
_aab3 = false;
_aab4 = false;
_aab5 = false;
_aab6 = false;
_aab7 = false;
_aab = false;


_coplevelarr = [];

{
if ((Side _x) == west) then {

		_coplevel = _x getVariable "EMonkeys_coplevel";
		if ((call _coplevel) != 0) then {
			_coplevel1 = (call _coplevel);
			_coplevelarr pushBack _coplevel1;
		};

};

} forEach allPlayers;


if(count _coplevelarr > _this select 0 || count _coplevelarr == _this select 0 ) then {_aab = true;} else { _aab = false;};



if (({_x >= 1} count _coplevelarr ) >= (_this select 1 select 0)) then {_aab1 = true;} else { _aab1 = false;};
if (({_x >= 2} count _coplevelarr ) >= (_this select 1 select 1)) then {_aab2 = true;} else { _aab2 = false;};
if (({_x >= 3} count _coplevelarr ) >= (_this select 1 select 2)) then {_aab3 = true;} else { _aab3 = false;};
if (({_x >= 4} count _coplevelarr ) >= (_this select 1 select 3)) then {_aab4 = true;} else { _aab4 = false;};
if (({_x >= 5} count _coplevelarr ) >= (_this select 1 select 4)) then {_aab5 = true;} else { _aab5 = false;};
if (({_x >= 6} count _coplevelarr ) >= (_this select 1 select 5)) then {_aab6 = true;} else { _aab6 = false;};
if (({_x >= 7} count _coplevelarr ) >= (_this select 1 select 6)) then {_aab7 = true;} else { _aab7 = false;};



if (_aab1 && _aab2 && _aab3 && _aab4 && _aab5 && _aab6 && _aab7 && _aab) then {_return = true;} else { _return = false;};
_return;

