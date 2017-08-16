removeAllWeapons _this; 
_this allowDamage false; 
_this enableSimulation false;
_this addAction["Revendre la Drogue",life_fnc_virt_menu,"heroin",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == civilian '];
_this addAction["Interroger le dealer",life_fnc_questionDealer,"",0,false,false,"",' vehicle player == player && player distance _target < 5 && playerSide == west && !life_action_inUse '];