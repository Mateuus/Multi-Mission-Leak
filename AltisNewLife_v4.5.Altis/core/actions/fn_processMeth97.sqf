#include <macro.h>
private ["_vendor","_oldItem1","_oldItem2","_oldItem3","_oldItem4","_newItem","_hasLicense","_itemName","_bomb"];
_vendor = [_this,0,ObjNull,[ObjNull]] call BIS_fnc_param;
if(life_action_in_use) exitWith {};
if(isNull _vendor OR (player distance _vendor > 10)) exitWith {};
_oldItem1 = "ephedrine";
_oldItem2 = "phosphore";
_oldItem3 = "metylamine";
_oldItem4 = "iode";
_newItem = "meth97";
//_hasLicense = GVAR_MNS (([_newItem,0] call life_fnc_licenseType) select 0);
_hasLicense = LICENSE_VALUE(_newItem,"civ");
_itemName = M_CONFIG(getText,"ANL_VItems",_newItem,"displayName");
	
life_is_processing = true;
if(_hasLicense) then
{
	["Concoction de Méthamphétamine", 20] call life_fnc_showProgress;
	if(player distance _vendor > 10) exitWith {hint "Tu dois rester a 10m pour fabriquer."; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem1,5] call life_fnc_handleInv)) exitWith {hint "Tu dois avoir au moins 5 produits de chaque !"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem2,5] call life_fnc_handleInv)) exitWith {hint "Tu dois avoir au moins 5 produits de chaque !"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem3,5] call life_fnc_handleInv)) exitWith {hint "Tu dois avoir au moins 5 produits de chaque !"; 5 cutText ["","PLAIN"]; life_is_processing = false;};
	if(!([false,_oldItem4,5] call life_fnc_handleInv)) exitWith {hint "Tu dois avoir au moins 5 produits de chaque !"; 5 cutText ["","PLAIN"]; life_is_processing = false;};   
	if(!([true,_newItem,5] call life_fnc_handleInv)) exitWith {
		[true,_oldItem1,5] call life_fnc_handleInv;
		[true,_oldItem2,5] call life_fnc_handleInv;
		[true,_oldItem3,5] call life_fnc_handleInv;
		[true,_oldItem4,5] call life_fnc_handleInv;
		life_is_processing = false;
	};
    titleText[format["Tu as fabriqué 5 doses de Méthamphétamine d'une pureté de 97%",localize _itemName],"PLAIN"];
	if(random(100) < 8) then
		{		
			_bomb = "HelicopterExploSmall"createvehiclelocal(getPos player);
			if(alive player) then {player setDamage 1;};
			[[0,format["%1 a sauté en concoctant de la Méthamphétamine",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
		};
	life_is_processing = false;
}
	else
{
	life_is_processing = false;
	hint "Il te faut la license de transformation Métamphetamine. BOUM !!!.";
			_bomb = "HelicopterExploSmall"createvehiclelocal(getPos player);
			if(alive player) then {player setDamage 1;};
	[[0,format["%1 a sauté en essayant de concocter de la méth sans formation..",name player]],"life_fnc_broadcast",civilian,false] spawn life_fnc_MP;
};