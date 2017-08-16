Private ["_name","_lhm_satphone"];
_lhm_satphone = _this select 0;
_name = [(["LHM_Satellite",0] call lhm_fnc_varHandle)] call lhm_fnc_varToStr;

if(([true,"LHM_Satellite",1] call lhm_fnc_handleInv)) then
{
	hint format["Du hast einen Satellite Uplink aufgehoben."];
	//[] call lhm_fnc_virt_update;
	deleteVehicle _lhm_satphone;
};