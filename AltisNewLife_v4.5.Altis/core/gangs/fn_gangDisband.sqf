#include <macro.h>
private["_action"];
_action = [
	"Vous êtes sur le point de démanteler le gang, il sera supprimé de la base et le groupe sera supprimé<br/><br/>Etes vous sur de vouloir dissoudre le gang ? Vous ne serez pas remboursé !",
	"Supprimer le gang",
	"Oui",
	"Non"
] call BIS_fnc_guiMessage;
if(_action) then {
	hint "Démantèlement du gang...";
	[[grpPlayer],"TON_fnc_removeGang",false,false] spawn life_fnc_MP;
} else {
	hint "Dissolution annulé";
};
closedialog 0;