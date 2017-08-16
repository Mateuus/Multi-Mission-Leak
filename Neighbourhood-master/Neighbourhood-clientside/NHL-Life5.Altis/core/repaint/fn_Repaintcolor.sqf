/*
File: fn_Repaintcolor.sqf
Author: MooN-Gaming

Description: Opens the display to recolor the vehicle

*/
private["_index","_veh","_c_arr","_id","_colorcost","_i","_text"];
if(!isNull (findDisplay 2300)) then {
_index = lbCurSel 2302;
lbClear 2303;
_veh = lbData[2302,_index];
_c_arr = [_veh] call life_fnc_vehicleColorCfg;
_id = switch(playerSide) do {case civilian: {"civ"}; case west:{"cop"}; default {"civ"};};
_colorcost = 100;
for "_i" from 0 to (count _c_arr)-1 do
{
if((_c_arr select _i) select 1 == _id) then
            {
_text = [_veh,_i] call life_fnc_vehicleColorStr;

lbAdd[2303,format["%1",_text]];
lbSetValue [2303,(lbSize 2303)-1,_i];
//lbSetData[2303, [_colorcost] call life_fnc_numberText];
};
};

lbSetCurSel [2303,0];
if((lbSize 2303)-1 != -1) then
{
    ctrlShow[2303,true];
}
    else
{
    ctrlShow[2303,false];
};

};
_haha = typeOf _x;
_vehicles lbSetData [(lbSize _vehicles)-1,_haha];