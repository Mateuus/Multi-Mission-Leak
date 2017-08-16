_this enableSimulation false;
_this allowDamage false;
_this addAction["Vendeur Alcool",life_fnc_virt_menu,"speakeasy"];
_this addAction["Vendeur Tortue",life_fnc_virt_menu,"wongs"];
_this addAction["Interroger le dealer",life_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];