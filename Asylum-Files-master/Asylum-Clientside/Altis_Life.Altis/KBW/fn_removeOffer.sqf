/*
fn_removeOffer.sqf
Kevin Webb
Gives us back our item we decided not to sell
Copyright © 2015 Kevin Webb, All rights reserved
Written for Asylum Entertainment ™
*/
if(lbCurSel 2802 == -1) exitWith {hint "You did not select anything"};
_id = lbValue[2802,(lbCurSel 2802)];
_dataArr = lbData[2802,(lbCurSel 2802)];
_dataArr = call compile format["%1",_dataArr];
_price = _dataArr select 1;
_buySell = _dataArr select 2;
_className = _dataArr select 3;
_type = _dataArr select 4;
_amount = _dataArr select 5;
_vehicleID = _dataArr select 6;
_isHGUN = _type == "Weapon" && {["hgun",_classname select 0] call BIS_fnc_inString} && {!(["PDW",_classname select 0] call BIS_fnc_inString)};
if(_buySell == 0 && _type == "Weapon" && ((_isHGUN && handgunWeapon player != "") || (!_isHGUN && primaryWeapon player != ""))) exitWith {hint "You will need to have the relevant weapon slot free before reclaiming your weapon"};
[[3,_id,_className,_type,player,_amount,_buySell,_vehicleID,_price],"KBW_fnc_listing",false] call life_fnc_MP;
closeDialog 0;
hint "Your item/funds are being returned to you now.";