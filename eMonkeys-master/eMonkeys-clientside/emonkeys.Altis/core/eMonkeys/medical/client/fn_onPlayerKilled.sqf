


setPlayerRespawnTime 0;
_unit = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;

eM_deadpos = getpos _unit;
eM_deadunit = _unit;

[] spawn {
sleep 0.01;
deleteVehicle eM_deadunit;
};






