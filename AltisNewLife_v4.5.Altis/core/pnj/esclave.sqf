removeallWeapons _this; 
_this enableSimulation false; 
_this allowDamage false; 
_this addAction["Recuperer sa liberté", life_fnc_getoutofSlavery,"",0,false,false,"",' life_enslaved ']; 
_this addAction["Rouler des cigarettes",life_fnc_processAction,"tobacco",0,false,false,"",' life_inv_tobacco > 0 && !life_is_processing && life_enslaved'];