private["_unit","_vdmer"];
_unit = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_vdmer = [_this,1,Objnull,[Objnull]] call BIS_fnc_param;
if(isNull _unit OR isNull _vdmer) exitWith {player allowDamage true; life_istazed = false;};

if(_vdmer isKindOf "Man" && alive player) then
{
    if(!life_istazed) then
    {
        life_istazed = true;
        _obj = "Land_ClutterCutter_small_F" createVehicle (getPosATL _unit);
        _obj setPosATL (getPosATL _unit);
        [[player,"AinjPfalMstpSnonWnonDf_carried_fallwc"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
        [[0,format[localize "STR_NOTF_Vdmed", _unit getVariable["realname",name _unit], _vdmer getVariable["realname",name _vdmer]]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
//       [[getPlayerUID _vdmer,name _vdmer,"13"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
        _unit attachTo [_obj,[0,0,0]];
        sleep 5;
        [[player,"amovppnemstpsraswrfldnon"],"life_fnc_animSync",true,false] spawn life_fnc_MP;
        if(!(player getVariable["Escorting",false])) then {
            detach player;
        };
        life_istazed = false;
        player allowDamage true;
        disableUserInput false;
		player setDamage 0.95;
		
    };
}
    else
{
    _unit allowDamage true;
    life_istazed = false;
	player setDamage 0.95;
};