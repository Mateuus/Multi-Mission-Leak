#include <macro.h>
life_action_inUse = false;
private["_civ","_invs","_license","_robber","_guns","_gun"];
_civ = [_this,0,Objnull,[Objnull]] call BIS_fnc_param;
_invs = [_this,1,[],[[]]] call BIS_fnc_param;
_robber = [_this,2,false,[false]] call BIS_fnc_param;
if(isNull _civ) exitWith {};
_illegal = 0;
_inv = "";
if(count _invs > 0) then
{
	{
		_displayName = M_CONFIG(getText,"ANL_VItems",SEL(_x,0),"displayName");
		_inv = _inv + format["%1 %2<br/>",SEL(_x,1),(localize _displayName)];
		_price = M_CONFIG(getNumber,"ANL_VItems",SEL(_x,0),"sellPrice");		
		//_index = [_x select 0,GETC(sell_array)] call TON_fnc_index;
		//_index = [_x select 0,sell_array] call TON_fnc_index;
	if(!(EQUAL(_price,-1))) then {
			ADD(_illegal,(SEL(_x,1) * _price));
		};
	} foreach _invs;
	if(_illegal > 6000) then
	{
		[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"482"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	};	
	[[getPlayerUID _civ,_civ getVariable["realname",name _civ],"481"],"life_fnc_wantedAdd",false,false] spawn life_fnc_MP;
	[[0,format["%1 a pour %2€ de marchandise illégale sur lui !",(_civ getVariable["realname",name _civ]),[_illegal] call life_fnc_numberText]],"life_fnc_broadcast",west,false] spawn life_fnc_MP;
}
	else
{
	_inv = "Pas de marchandise illégale";
};
if(!alive _civ || player distance _civ > 5) exitWith {hint format["Ne peux pas fouiller %1",_civ getVariable["realname",name _civ]]};
//hint format["%1",_this];
hint parseText format["<t color='#FF0000'><t size='2'>%1</t></t><br/><t color='#FFD700'><t size='1.5'><br/>Objets illégals</t></t><br/>%2<br/><br/><br/><br/><t color='#FF0000'>%3</t>"
,(_civ getVariable["realname",name _civ]),_inv,if(_robber) then {"Robbed the bank"} else {""}];
if(_robber) then
{
	[[0,format["%1 est recherché comme voleur de banque !",(_civ getVariable["realname",name _civ])]],"life_fnc_broadcast",true,false] spawn life_fnc_MP;
};