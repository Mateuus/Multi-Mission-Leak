/* 
 File: fn_vehShopLicenses.sqf 
 Author: Bryan "Tonic" Boardwine 
 
 Description: 
 Checks what shop it is and sometimes the vehicle to determine whether or not they have the license. 
 
 Returns: 
 TRUE if they have the license or are allowed to get that specific vehicle without having that license. 
 FALSE if they don't have the license or are not allowed to obtain that vehicle. 
*/ 
private["_veh","_ret"]; 
_veh = _this select 0; 
_ret = false; 
 
if(_veh == "B_Quadbike_01_F") exitWith {true}; //ATV's don't need to require a license anymore. 
 
switch (lhm_veh_shop select 0) do 
{ 
 case "donator_1": {_ret = license_civ_driver;}; 
 case "donator_2": {_ret = license_civ_air;}; 
}; 
 
_ret;