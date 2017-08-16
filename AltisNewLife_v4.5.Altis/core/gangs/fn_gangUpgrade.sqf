#include <macro.h>
private["_maxMembers","_slotUpgrade","_upgradePrice"];
_maxMembers = grpPlayer getVariable ["gang_maxMembers",8];
_slotUpgrade = _maxMembers + 4;
_upgradePrice = round(_slotUpgrade * 10000 / 2.5);
_action = [
	format["Vous êtes sur le point d'augmenter le nombre maximum de membres autorisés.<br/><br/>Actuellement : %1<br/>Augmentation Max : %2<br/>Prix: <t color='#8cff9b'>%3€</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText],
	"Augementer la capacité de votre gang",
	"Oui",
	"Annulé"
] call BIS_fnc_guiMessage;
if(_action) then {
	if(compte_banque < _upgradePrice) exitWith {
		hint parseText format[
			"Vous n'avez pas assez d'argent sur votre compte pour augmenter la limite maximale de membre.<br/><br/>Current: <t color='#8cff9b'>%1€</t><br/>Il vous manque : <t color='#FF0000'>%2€</t>",
			[compte_banque] call life_fnc_numberText,
			[_upgradePrice - compte_banque] call life_fnc_numberText
		];
	};
	SUB(compte_banque,_upgradePrice);
	grpPlayer SVAR["gang_maxMembers",_slotUpgrade,true];
	hint parseText format["Vous avez augmenter la capacité de votre gang de %1 à %2 pour <t color='#8cff9b'>%3€</t>",_maxMembers,_slotUpgrade,[_upgradePrice] call life_fnc_numberText];
	[[2,grpPlayer],"TON_fnc_updateGang",false,false] spawn life_fnc_MP;
} else {
	hint "Augmentation annulé";
};