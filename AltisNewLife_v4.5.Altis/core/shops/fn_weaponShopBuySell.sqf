#include <macro.h>
private["_price","_item","_itemInfo","_bad","_frais","_prixcb","_gangbank"];
if((lbCurSel 38403) == -1) exitWith {hint "Vous devez sélectionner un élément à acheter / vendre"};
_price = lbValue[38403,(lbCurSel 38403)]; if(isNil "_price") then {_price = 0;};
_item = lbData[38403,(lbCurSel 38403)];
_itemInfo = [_item] call life_fnc_fetchCfgDetails;
_bad = "";
_frais = _price * 0.05; //5% de frais bancaire
_prixcb = _price + _frais;
_gangbank = (grpPlayer GVAR "gang_bank");
if(isNil "_gangbank") then {_gangbank = 0;};
if((life_inv_cb == 0) && (argent_liquide < _price)) exitWith {hint "Vous n'avez pas assez de liquide et pas de carte bleue !"};
disableSerialization;
if((_itemInfo select 6) != "CfgVehicles") then
{
	if((_itemInfo select 4) in [4096,131072]) then
	{
		if(!(player canAdd _item) && (GVAR_UINS["Weapon_Shop_Filter",0]) != 1) exitWith {_bad = "Vous n'avez pas assez de place pour cet objet."};
	};
};
if(_bad != "") exitWith {hint _bad};
if((GVAR_UINS["Weapon_Shop_Filter",0]) == 1) then
{
	argent_liquide = argent_liquide + _price;
	[_item,false] call life_fnc_handleItem;
	hint parseText format["Vous avez vendu %1 pour <t color='#8cff9b'>%2€</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
	[nil,(GVAR_UINS["Weapon_Shop_Filter",0])] call life_fnc_weaponShopFilter; //Update the menu.
}
else
{
if((life_inv_cb == 0) && (argent_liquide < _price)) exitWith {hint "Vous n'avez pas assez de liquide et pas de carte bleue !"};
if((_gangbank >= _prixcb) && (GETC(life_reblevel) > 0) && (life_inv_cb > 0)) then {
		_action = [
			format["ARGENT DE LA FAMILLE : <t color='#8cff9b'>%1€</t><br/>COMPTE BANCAIRE : <t color='#8cff9b'>%5€</t><br/>VOTRE ARGENT : <t color='#8cff9b'>%2€</t><br/><br/>Prix Cash : <t color='#8cff9b'>%3€</t><br/>Prix Carte : <t color='#8cff9b'>%4€</t>",
				[(grpPlayer GVAR "gang_bank")] call life_fnc_numberText,
				[argent_liquide] call life_fnc_numberText,
				[_price] call life_fnc_numberText,
				[_prixcb] call life_fnc_numberText,
				[compte_banque] call life_fnc_numberText
			],
    "Acheter avec le compte de la famille ?",
    "Oui",
    "Mon argent"
		] call BIS_fnc_guiMessage;
		if(_action) then {
		_owner = (grpPlayer GVAR "gang_owner");
			hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€ + %3€</t> de frais avec le compte de la famille. Le chef a été averti de cet achat",_itemInfo select 1,[_price] call life_fnc_numberText,[_frais] call life_fnc_numberText];
            [[0,format["Une arme %1 a été acheté par %3 pour %2€ sur le compte du gang",_itemInfo select 1,[_prixcb] call life_fnc_numberText,name player]],"life_fnc_broadcast",_owner,false] spawn life_fnc_MP;
			_funds = grpPlayer GVAR "gang_bank";
			_funds = _funds - _prixcb;
			grpPlayer SVAR["gang_bank",_funds,true];
			[_item,true] spawn life_fnc_handleItem;
			[[1,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
	} else {
		_action = [format["COMPTE BANCAIRE : <t color='#8cff9b'>%1€</t><br/>ARGENT LIQUIDE : <t color='#8cff9b'>%2€</t><br/><br/>Prix Cash : <t color='#8cff9b'>%3€</t><br/>Prix Carte : <t color='#8cff9b'>%4€</t>",
					[compte_banque] call life_fnc_numberText,
					[argent_liquide] call life_fnc_numberText,
					[_price] call life_fnc_numberText,
					[_prixcb] call life_fnc_numberText
				],
					"Choisissez votre moyen de paiement",
					"Carte Bleue",
					"Cash"
				] call BIS_fnc_guiMessage;
		if(_action) then {

				if(_prixcb > compte_banque) exitWith {hint "Vous n'avez pas assez d'argent sur votre compte !"};
				compte_banque = compte_banque - _prixcb;
				hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€ + %3€</t> de frais bancaire",_itemInfo select 1,[_price] call life_fnc_numberText,[_frais] call life_fnc_numberText];
				[_item,true] spawn life_fnc_handleItem;
		} else {
				if(_price > argent_liquide) exitWith {hint "Vous n'avez pas assez d'argent sur vous !"};
				argent_liquide = argent_liquide - _price;
				hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
				[_item,true] spawn life_fnc_handleItem;
		};
	};
} else {
        if((life_inv_cb == 0)) then {
				if(_price > argent_liquide) exitWith {hint "Vous n'avez pas assez d'argent sur vous et pas de carte bleue !"};
				argent_liquide = argent_liquide - _price;
				hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
				[_item,true] spawn life_fnc_handleItem;
		} else {
		_action = [format["COMPTE BANCAIRE : <t color='#8cff9b'>%1€</t><br/>ARGENT LIQUIDE : <t color='#8cff9b'>%2€</t><br/><br/>Prix Cash : <t color='#8cff9b'>%3€</t><br/>Prix CB : <t color='#8cff9b'>%4€</t>",
					[compte_banque] call life_fnc_numberText,
					[argent_liquide] call life_fnc_numberText,
					[_price] call life_fnc_numberText,
					[_prixcb] call life_fnc_numberText
				],
					"Choisissez votre moyen de paiement",
					"Carte Bleue",
					"Cash"
				] call BIS_fnc_guiMessage;
		if(_action) then {
				if(_prixcb > compte_banque) exitWith {hint "Vous n'avez pas assez d'argent sur votre compte !"};
				compte_banque = compte_banque - _prixcb;
				hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€ + %3€</t> de frais bancaire",_itemInfo select 1,[_price] call life_fnc_numberText,[_frais] call life_fnc_numberText];
				[_item,true] spawn life_fnc_handleItem;
		} else {
				if(_price > argent_liquide) exitWith {hint "Vous n'avez pas assez d'argent sur vous !"};
				argent_liquide = argent_liquide - _price;
				hint parseText format["Vous avez acheté un %1 pour <t color='#8cff9b'>%2€</t>",_itemInfo select 1,[_price] call life_fnc_numberText];
				[_item,true] spawn life_fnc_handleItem;
		};
	};
	};
};
[] call life_fnc_saveGear;