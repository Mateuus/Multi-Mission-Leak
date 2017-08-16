//diag_log format["DEBUG: Running Donator Item Shop Server Init: _this = %1",_this]; 
if (isServer) then { 
 
[ 
  "lhm_fnc_virt_don_menu", 
  "lhm_fnc_virt_don_update", 
  "lhm_fnc_virt_don_shops", 
  "lhm_fnc_virt_don_buy", 
  "lhm_fnc_virt_don_sell", 
  "lhm_fnc_don_varHandle", 
  "lhm_fnc_don_varToStr", 
  "lhm_fnc_don_handleInv", 
  "lhm_fnc_don_calWeightDiff", 
  "lhm_fnc_don_itemWeight" 
] spawn lhm_fnc_streamFunction; 
 
// Creating LHM Donator Units 
 [] spawn { 
  waituntil {time > 1}; 
  [] spawn { 
 
   // Kavala 
   "B_RangeMaster_F" createUnit [[3270.25,12971.6,0.2],(group master_group)," 
    removeallWeapons this; 
    this setDir 88.923; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""cop""]; 
   "]; 
 
   // Athira 
   "B_RangeMaster_F" createUnit [[13819.5,18983.6,0.00154877],(group master_group)," 
    removeallWeapons this; 
    this setDir 156.419; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""cop""]; 
   "]; 
   // Pyrgos 
   "B_RangeMaster_F" createUnit [[16594.5,12718.2,0.00143909],(group master_group)," 
    removeallWeapons this; 
    this setDir 327.911; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""cop""]; 
   "]; 
   // Border Patrol North 
   "B_RangeMaster_F" createUnit [[18347.1,17423.7,-0.0302086],(group master_group)," 
    removeallWeapons this; 
    this setDir 154.952; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""cop""]; 
   "]; 
   // HWP 
   "B_RangeMaster_F" createUnit [[23540.2,19953,0.0014534],(group master_group)," 
    removeallWeapons this; 
    this setDir 209.993; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""cop""]; 
   "]; 
 
   // Neochori 
   "B_RangeMaster_F" createUnit [[12334.8,14343.2,0.00139713],(group master_group)," 
    removeallWeapons this; 
    this setDir 66.1745; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""cop""]; 
   "]; 
 
   // Sec Buffs Athira HQ 
   "B_RangeMaster_F" createUnit [[13494.2,17088.9,0.00139427],(group master_group)," 
    removeallWeapons this; 
    this setDir 213.555; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""sec""]; 
   "]; 
 
   // Sec Buffs kavala HQ 
   "B_RangeMaster_F" createUnit [[3718.21,13396.9,0.00144005],(group master_group)," 
    removeallWeapons this; 
    this setDir 308.264; 
    this setposAtl [3718.27,13396.9,0.823326]; 
    this enableSimulation false; 
    this allowDamage false; 
    this setVariable[""realname"", ""LH Item Shop""]; 
    this addAction[""LH Item Shop"",lhm_fnc_virt_don_menu,""sec""]; 
   "]; 
 
 
   //call lhm_fnc_itemshop_config; 
   diag_log format["LHM Donator Item Shop Units created!"]; 
  }; 
 }; 
}; 
 
 
