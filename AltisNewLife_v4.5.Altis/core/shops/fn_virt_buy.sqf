#include <macro.h>
private["_type","_price","_amount","_diff","_name","_hideout"];
if((life_nottoofast != 0) && ((time - life_nottoofast) < 2)) exitWith {hint "TU T'ES PRIS POUR FLASH !!! Merci de ralentir un peu...";};
life_nottoofast = time;
if((lbCurSel 2401) == -1) exitWith {hint "Vous devez sélectionner un élément à acheter."};
_type = lbData[2401,(lbCurSel 2401)];
_price = lbValue[2401,(lbCurSel 2401)];
_amount = ctrlText 2404;
if(!([_amount] call TON_fnc_isnumber)) exitWith {hint "Vous n'avez pas saisi un nombre correct";};
_diff = 0;
_diff = [_type,parseNumber(_amount),life_carryWeight,life_maxWeight] call life_fnc_calWeightDiff;
_amount = parseNumber(_amount);
if(_diff <= 0) exitWith {hint "Vous n'avez pas assez de place pour ce montant"};
_amount = _diff;
_hideout = (nearestObjects[getPosATL player,["Land_u_Barracks_V2_F","Land_i_Barracks_V2_F"],25]) select 0;
if((_price * _amount) > argent_liquide && {!isNil "_hideout" && {!isNil {grpPlayer GVAR "gang_bank"}} && {(grpPlayer GVAR "gang_bank") <= _price * _amount}}) exitWith {hint "Vous n'avez pas beaucoup d'argent !"};
if((_price * _amount) > argent_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Vous n'avez pas beaucoup d'argent !";};

_name = M_CONFIG(getText,"ANL_VItems",_type,"displayName");

if(([true,_type,_amount] call life_fnc_handleInv)) then
{
	if(!isNil "_hideout" && {!isNil {grpPlayer GVAR "gang_bank"}} && {(grpPlayer GVAR "gang_bank") >= _price}  && (GETC(life_reblevel) > 0)) then {
		_action = [
			format["Le gang a suffisamment d'argent pour payer, voulez-vous payer avec les fonds du gang ou le votre ?<br/><br/>Argent du Gang : <t color='#8cff9b'>%1€</t><br/>Votre argent : <t color='#8cff9b'>%2€</t>",
				[(grpPlayer GVAR "gang_bank")] call life_fnc_numberText,
				[argent_liquide] call life_fnc_numberText
			],
    "Payer avec votre argent ou l'argent du gang",
    "Fond du gang",
    "Mon argent"
		] call BIS_fnc_guiMessage;
		if(_action) then {
			hint format["Tu as acheté %1 %2 pour %3€ avec l'argent du gang",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
			_funds = grpPlayer GVAR "gang_bank";
			_funds = _funds - (_price * _amount);
			grpPlayer SVAR["gang_bank",_funds,true];
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
		} else {
			if((_price * _amount) > argent_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Vous n'avez pas beaucoup d'argent !";};
			hint format["Tu as acheté %1 %2 pour %3€",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
			SUB(argent_liquide,_price);
		};
	} else {
		if((_price * _amount) > argent_liquide) exitWith {[false,_type,_amount] call life_fnc_handleInv; hint "Vous n'avez pas beaucoup d'argent !";};
		hint format["Tu as acheté %1 %2 pour %3€",_amount,(localize _name),[(_price * _amount)] call life_fnc_numberText];
		SUB(argent_liquide,(_price * _amount));
	};
	[] call life_fnc_virt_update;
	playSound "caching";
};
[0] call SOCK_fnc_updatePartial;
[3] call SOCK_fnc_updatePartial;