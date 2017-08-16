#include <macro.h>
private["_dialog","_inv","_lic","_licenses","_near","_near_units","_mstatus","_shrt","_side","_icon"];
disableSerialization;
if(GETC(bitch_level) < 1) then
{
	ctrlShow[2020,false];
	ctrlShow[2021,false];
	ctrlShow[9800,false]; // <<< this Button add
};
_side = switch(playerSide) do {case west:{"cop"}; case civilian:{"civ"}; case independent:{"med"};case east:{"adac"};};
_dialog = findDisplay 2001;
_inv = _dialog displayCtrl 2005;
_lic = _dialog displayCtrl 2014;
_near = _dialog displayCtrl 2022;
_near_i = _dialog displayCtrl 2023;
_mstatus = _dialog displayCtrl 2015;
_struct = "";
lbClear _inv;
lbClear _near;
lbClear _near_i;
//Near players
_near_units = [];
{ if(player distance _x < 10) then {_near_units pushBack _x};} foreach playableUnits;
{
	if(!isNull _x && alive _x && player distance _x < 10 && _x != player) then
	{
		_near lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near lbSetData [(lbSize _near)-1,str(_x)];
		_near_i lbAdd format["%1 - %2",_x getVariable["realname",name _x], side _x];
		_near_i lbSetData [(lbSize _near)-1,str(_x)];
	};
} foreach _near_units;
_mstatus ctrlSetStructuredText parseText format["<img size='1.3' image='images\icons\bank.paa'/> <t size='0.8px'>%1€</t><br/><img size='1.2' image='images\icons\money.paa'/> <t size='0.8'>%2€</t>",[compte_banque] call life_fnc_numberText,[argent_liquide] call life_fnc_numberText];
ctrlSetText[2009,format["Poids en kg : %1 / %2", life_carryWeight, life_maxWeight]];

{
if(ITEM_VALUE(configName _x) > 0) then {
		_inv lbAdd format["%2 [x%1]",ITEM_VALUE(configName _x),localize (getText(_x >> "displayName"))];
		_inv lbSetData [(lbSize _inv)-1,configName _x];
		_icon = M_CONFIG(getText,"ANL_VItems",configName _x,"icon");
		if(!(EQUAL(_icon,""))) then {
			_inv lbSetPicture [(lbSize _inv)-1,_icon];
		};
		lbSort _inv;
	};
} foreach ("true" configClasses (missionConfigFile >> "ANL_VItems"));

{
	_displayName = getText(_x >> "displayName");
	
	if(LICENSE_VALUE(configName _x,_side)) then {
		_struct = _struct + format["%1<br/>",localize _displayName];
	};
} foreach (format["getText(_x >> 'side') isEqualTo '%1'",_side] configClasses (missionConfigFile >> "Licenses"));



if(_struct == "") then
{
	_struct = "Pas de Licences";
};

_lic ctrlSetStructuredText parseText format["
<t size='0.7px'>
%1
</t>
",_struct];