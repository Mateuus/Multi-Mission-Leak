/* 
 File: fn_AnimateTrawler.sqf 
 Author: CooliMC 
  
 Description: 
 Animate the Trawler and send the Actions to all Players including JIP. 
*/ 
private["_veh1","_veh2","_veh3","_veh4","_veh5","_veh6","_veh7","_veh8","_veh9","_veh10","_veh11","_veh12","_veh13","_veh14","_veh15","_veh16","_veh17","_vehChest1","_vehChest2"]; 
_veh2 = [_this,0,Objnull,[Objnull]] call BIS_fnc_param; 
 
_veh1 = "C_Boat_Civil_01_F" createvehicle (position _veh2); 
_veh1 allowDamage false; 
_veh1 setDamage 0; 
[ 
 [_veh1, _veh2],  
 { 
  { 
   _x allowDamage false; 
   _x setDamage 0; 
   _x lock 2; 
  } forEach _this; 
 } 
] remoteExec ["BIS_FNC_CALL", 0, true]; 
 
_veh2 attachto [_veh1,[0,0,5]]; 
 
_veh3 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh3 setDir (getDir _veh1 + 270); 
_veh3 setPos getPos _veh3; 
_veh3 attachto[_veh1 ,[1.6,-4.4,2.95]]; 
_veh3 setDir (getDir _veh1 + 270); 
_veh3 setPos getPos _veh3; 
_veh3 attachto[_veh1 ,[1.6,-4.4,2.95]]; 
_veh3 setObjectTextureGlobal[0,""]; 
_veh3 setObjectTextureGlobal[1,""]; 
 
_veh4 = "Land_Bench_F" createvehicle (position _veh2); 
_veh4 attachto[_veh1 ,[2.35,-4.9,2.1]]; 
 
_veh5 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh5 setDir (getDir _veh1 + 270); 
_veh5 setPos getPos _veh3; 
_veh5 attachto[_veh1 ,[1.6,-5.5,2.95]]; 
_veh5 setDir (getDir _veh1 + 270); 
_veh5 setPos getPos _veh3; 
_veh5 attachto[_veh1 ,[1.6,-5.5,2.95]]; 
_veh5 setObjectTextureGlobal[0,""]; 
_veh5 setObjectTextureGlobal[1,""]; 
 
_veh6 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh6 setDir (getDir _veh1 + 270); 
_veh6 setPos getPos _veh3; 
_veh6 attachto[_veh1 ,[1.6,-6.8,2.95]]; 
_veh6 setDir (getDir _veh1 + 270); 
_veh6 setPos getPos _veh3; 
_veh6 attachto[_veh1 ,[1.6,-6.8,2.95]]; 
_veh6 setObjectTextureGlobal[0,""]; 
_veh6 setObjectTextureGlobal[1,""]; 
 
_veh7 = "Land_Bench_F" createvehicle (position _veh2); 
_veh7 attachto[_veh1 ,[2.35,-7.3,2.1]]; 
 
_veh8 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh8 setDir (getDir _veh1 + 270); 
_veh8 setPos getPos _veh3; 
_veh8 attachto[_veh1 ,[1.6,-7.9,2.95]]; 
_veh8 setDir (getDir _veh1 + 270); 
_veh8 setPos getPos _veh3; 
_veh8 attachto[_veh1 ,[1.6,-7.9,2.95]]; 
_veh8 setObjectTextureGlobal[0,""]; 
_veh8 setObjectTextureGlobal[1,""]; 
 
_veh9 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh9 setDir (getDir _veh1 + 90); 
_veh9 setPos getPos _veh3; 
_veh9 attachto[_veh1 ,[-2.05,-4.4,2.95]]; 
_veh9 setDir (getDir _veh1 + 90); 
_veh9 setPos getPos _veh3; 
_veh9 attachto[_veh1 ,[-2.05,-4.4,2.95]]; 
_veh9 setObjectTextureGlobal[0,""]; 
_veh9 setObjectTextureGlobal[1,""]; 
 
_veh10 = "Land_Bench_F" createvehicle (position _veh2); 
_veh10 attachto[_veh1 ,[-2.8,-4.9,2.1]]; 
 
_veh11 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh11 setDir (getDir _veh1 + 90); 
_veh11 setPos getPos _veh3; 
_veh11 attachto[_veh1 ,[-2.05,-5.5,2.95]]; 
_veh11 setDir (getDir _veh1 + 90); 
_veh11 setPos getPos _veh3; 
_veh11 attachto[_veh1 ,[-2.05,-5.5,2.95]]; 
_veh11 setObjectTextureGlobal[0,""]; 
_veh11 setObjectTextureGlobal[1,""]; 
 
_veh12 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh12 setDir (getDir _veh1 + 90); 
_veh12 setPos getPos _veh3; 
_veh12 attachto[_veh1 ,[-2.05,-6.8,2.95]]; 
_veh12 setDir (getDir _veh1 + 90); 
_veh12 setPos getPos _veh3; 
_veh12 attachto[_veh1 ,[-2.05,-6.8,2.95]]; 
_veh12 setObjectTextureGlobal[0,""]; 
_veh12 setObjectTextureGlobal[1,""]; 
 
_veh13 = "Land_Bench_F" createvehicle (position _veh2); 
_veh13 attachto[_veh1 ,[-2.8,-7.3,2.1]]; 
 
_veh14 = "C_Quadbike_01_F" createvehicle (position _veh2); 
_veh14 setDir (getDir _veh1 + 90); 
_veh14 setPos getPos _veh3; 
_veh14 attachto[_veh1 ,[-2.05,-7.9,2.95]]; 
_veh14 setDir (getDir _veh1 + 90); 
_veh14 setPos getPos _veh3; 
_veh14 attachto[_veh1 ,[-2.05,-7.9,2.95]]; 
_veh14 setObjectTextureGlobal[0,""]; 
_veh14 setObjectTextureGlobal[1,""]; 
 
_veh15 = "B_CTRG_LSV_01_light_F" createvehicle (position _veh2); 
_veh15 setDir ((getDir _veh1) % 360); 
_veh15 setPos (getPos _veh3); 
_veh15 attachTo [_veh1, [-0.2,20.5,4.45]]; 
_veh15 setDir ((getDir _veh1) % 360); 
_veh15 setPos (getPos _veh3); 
_veh15 attachTo [_veh1, [-0.2,20.5,4.45]]; 
_veh15 setObjectTextureGlobal[0,""]; 
_veh15 setObjectTextureGlobal[1,""]; 
_veh15 setObjectTextureGlobal[2,""]; 
_veh15 setObjectTextureGlobal[3,""]; 
clearWeaponCargoGlobal _veh15; 
clearMagazineCargoGlobal _veh15; 
clearItemCargoGlobal _veh15; 
 
_veh16 = "B_CTRG_LSV_01_light_F" createvehicle (position _veh2); 
_veh16 setDir ((getDir _veh1) % 360); 
_veh16 setPos (getPos _veh3); 
_veh16 attachTo [_veh1, [-0.2,9.2,10.8]]; 
_veh16 setDir ((getDir _veh1) % 360); 
_veh16 setPos (getPos _veh3); 
_veh16 attachTo [_veh1, [-0.2,9.2,10.8]]; 
_veh16 setObjectTextureGlobal[0,""]; 
_veh16 setObjectTextureGlobal[1,""]; 
_veh16 setObjectTextureGlobal[2,""]; 
_veh16 setObjectTextureGlobal[3,""]; 
clearWeaponCargoGlobal _veh16; 
clearMagazineCargoGlobal _veh16; 
clearItemCargoGlobal _veh16; 
 
_veh17 = "B_CTRG_LSV_01_light_F" createvehicle (position _veh2); 
_veh17 setDir (((getDir _veh1) + 180) % 360);  
_veh17 setPos (getPos _veh3);  
_veh17 attachTo [_veh1, [-0.2,-15.5,11.35]]; 
_veh17 setDir (((getDir _veh1) + 180) % 360);  
_veh17 setPos (getPos _veh3);  
_veh17 attachTo [_veh1, [-0.2,-15.5,11.35]]; 
_veh17 setObjectTextureGlobal[0,""]; 
_veh17 setObjectTextureGlobal[1,""]; 
_veh17 setObjectTextureGlobal[2,""]; 
_veh17 setObjectTextureGlobal[3,""]; 
clearWeaponCargoGlobal _veh17; 
clearMagazineCargoGlobal _veh17; 
clearItemCargoGlobal _veh17; 
 
_vehChest1 = "Box_IND_AmmoVeh_F" createvehicle (position _veh2); 
_vehChest1 allowDamage false; 
_vehChest1 attachto [_veh1,[2.8,-15,2.7]]; 
 
_vehChest2 = "Box_IND_AmmoVeh_F" createvehicle (position _veh2); 
_vehChest2 allowDamage false; 
_vehChest2 attachto [_veh1,[-3.2,-15,2.7]]; 
 
_veh1 setVariable['Chests', [_vehChest1, _vehChest2], true]; 
_veh1 setVariable['Seats', [_veh3, _veh5, _veh6, _veh8, _veh9, _veh11, _veh12, _veh14], true]; 
_veh1 setVariable['FireSeats', [_veh15, _veh16, _veh17], true]; 
_veh1 setVariable['BB', _veh2, true]; 
_veh2 setVariable['lock', true, true]; 
 
_veh1 allowDamage false; 
_veh1 setDamage 0; 
[ 
 _veh1,  
 { 
  life_inPasSearch = false; 
  life_ausstiegID = -1; 
  life_inEinstieg = false; 
   
  _countingObjects = (_this getVariable ['Seats', []]); 
  { 
   _X lock 2; 
   _x allowDamage false; 
  } forEach _countingObjects; 
   
  _countingSeats = (_this getVariable ['FireSeats', []]); 
  { 
   _X lock 2; 
   _x allowDamage false; 
  } forEach _countingSeats; 
   
  _veh2 = (_this getVariable ['BB', ObjNull]); 
  _veh2 addAction["Als Kapit�n einsteigen",  
  { 
   if(!life_inEinstieg) then 
   { 
    life_inEinstieg = true; 
    _this spawn 
    { 
     (_this select 0) switchCamera "EXTERNAL"; 
     if((vehicle player) != player) then 
     { 
      player allowDamage false; 
      player action ['Eject', vehicle player]; 
      waitUntil { player == (vehicle player) }; 
     }; 
     player moveInDriver (_this select 3); 
     player allowDamage true; 
      
     hint "Du bist nun Kapit�n des Schiffs, dr�cke F10 zum verlassen des Boots oder F11 um zu versuchen auf einen Passagierplatz zu kommen"; 
     vehLocal = (_this select 3); 
     if(life_ausstiegID != (-1)) then 
     { 
      player removeAction life_ausstiegID; 
     }; 
     (_this select 0) switchCamera "EXTERNAL"; 
     
     AM_Exit = (findDisplay 46) displayAddEventHandler 
     [ 
      "KeyDown", 
      { 
       if((_this select 1) == 68) then  
       { 
        (findDisplay 46) displayRemoveEventHandler ['KeyDown',AM_Exit]; 
        vehLocal = ObjNull; 
        player switchCamera 'INTERNAL'; 
        [] spawn { 
         player allowDamage false; 
         sleep 5; 
         player allowDamage true; 
        }; 
        player action ['Eject', vehicle player]; 
        waitUntil { player == (vehicle player) }; 
        player setPos[(getPos player select 0) + 10, (getPos player select 1) + 10, getPos player select 2]; 
       }; 
        
       if((_this select 1) == 87) then  
       { 
        if(!life_inPasSearch) then 
        { 
         life_inPasSearch = true; 
         { 
          if((count crew _x) == 0) exitWith 
          { 
           (findDisplay 46) displayRemoveEventHandler ['KeyDown', AM_Exit]; 
           vehLocal = ObjNull; 
           player switchCamera 'INTERNAL'; 
           player allowDamage false; 
           player action ['Eject', vehicle player]; 
            
           waitUntil { player == (vehicle player) }; 
           player moveInCargo [_x, 1]; 
           player allowDamage true; 
           life_ausstiegID = player addAction["Aussteigen", 
           { 
            [] spawn { 
             player allowDamage false; 
             sleep 5; 
             player allowDamage true; 
            }; 
            player action ['Eject', vehicle player]; 
            waitUntil { player == (vehicle player) }; 
            player setPos[(getPos player select 0) + 10, (getPos player select 1) + 10, getPos player select 2]; 
            player removeAction (_this select 2); 
           }]; 
          }; 
         } foreach (vehLocal getVariable["Seats", []]); 
         life_inPasSearch = false; 
        }; 
       }; 
       false; 
      } 
     ]; 
    }; 
    life_inEinstieg = false; 
   }; 
  }, _this, 0, false, false, "", "(!(alive (driver (attachedTo _target))) && !(_target getVariable ['lock', true]));"]; 
   
  _veh2 addAction["Als Frontsch�tze (unten) einsteigen",  
  { 
   if(!life_inEinstieg) then 
   { 
    life_inEinstieg = true; 
    _this spawn 
    { 
     if(life_ausstiegID != (-1)) then 
     { 
      player removeAction life_ausstiegID; 
     }; 
      
     if((vehicle player) != player) then 
     { 
      player allowDamage false; 
      player action ['Eject', vehicle player]; 
      waitUntil { player == (vehicle player) }; 
     }; 
      
     if((count crew (((attachedTo (_this select 0)) getVariable['FireSeats', []]) select 0)) == 0) then 
     { 
      player moveInCargo [(((attachedTo (_this select 0)) getVariable['FireSeats', []]) select 0), 0]; 
      player allowDamage false; 
      life_ausstiegID = player addAction["Aussteigen", 
      { 
       [] spawn { 
        player allowDamage false; 
        sleep 5; 
        player allowDamage true; 
       }; 
       player action ['Eject', vehicle player]; 
       waitUntil { player == (vehicle player) }; 
       player setPos[(getPos player select 0) + 10, (getPos player select 1) + 10, getPos player select 2]; 
       player removeAction (_this select 2); 
      }]; 
     }; 
    }; 
    life_inEinstieg = false; 
   }; 
  }, _this, 0, false, false, "", "( 
    ((count crew (((attachedTo _target) getVariable['FireSeats', []]) select 0)) == 0) &&  
    ( 
     !(_this in ((attachedTo _target) getVariable['FireSeats', []])) && 
     !((vehicle _this) in ((attachedTo _target) getVariable['FireSeats', []])) && 
     !(_target getVariable ['lock', true]) 
    ) 
  );"]; 
   
  _veh2 addAction["Als Frontsch�tze (oben) einsteigen",  
  { 
   if(!life_inEinstieg) then 
   { 
    life_inEinstieg = true; 
    _this spawn 
    { 
     if(life_ausstiegID != (-1)) then 
     { 
      player removeAction life_ausstiegID; 
     }; 
     
     if((vehicle player) != player) then 
     { 
      player allowDamage false; 
      player action ['Eject', vehicle player]; 
      waitUntil { player == (vehicle player) }; 
     }; 
     
     if((count crew (((attachedTo (_this select 0)) getVariable['FireSeats', []]) select 1)) == 0) then 
     { 
      player moveInCargo [(((attachedTo (_this select 0)) getVariable['FireSeats', []]) select 1), 0]; 
      player allowDamage false; 
      life_ausstiegID = player addAction["Aussteigen", 
      { 
       [] spawn { 
        player allowDamage false; 
        sleep 5; 
        player allowDamage true; 
       }; 
       player action ['Eject', vehicle player]; 
       waitUntil { player == (vehicle player) }; 
       player setPos[(getPos player select 0) + 10, (getPos player select 1) + 10, getPos player select 2]; 
       player removeAction (_this select 2); 
      }]; 
     }; 
    }; 
    life_inEinstieg = false; 
   }; 
  }, _this, 0, false, false, "", "( 
    ((count crew (((attachedTo _target) getVariable['FireSeats', []]) select 1)) == 0) &&  
    ( 
     !(_this in ((attachedTo _target) getVariable['FireSeats', []])) && 
     !((vehicle _this) in ((attachedTo _target) getVariable['FireSeats', []])) && 
     !(_target getVariable ['lock', true]) 
    ) 
  );"]; 
   
  _veh2 addAction["Als Hecksch�tze einsteigen",  
  { 
   if(!life_inEinstieg) then 
   { 
    life_inEinstieg = true; 
    _this spawn 
    { 
     if(life_ausstiegID != (-1)) then 
     { 
      player removeAction life_ausstiegID; 
     }; 
     
     if((vehicle player) != player) then 
     { 
      player allowDamage false; 
      player action ['Eject', vehicle player]; 
      waitUntil { player == (vehicle player) }; 
     }; 
     
     if((count crew (((attachedTo (_this select 0)) getVariable['FireSeats', []]) select 2)) == 0) then 
     { 
      player moveInCargo [(((attachedTo (_this select 0)) getVariable['FireSeats', []]) select 2), 0]; 
      player allowDamage false; 
      life_ausstiegID = player addAction["Aussteigen", 
      { 
       [] spawn { 
        player allowDamage false; 
        sleep 5; 
        player allowDamage true; 
       }; 
       player action ['Eject', vehicle player]; 
       waitUntil { player == (vehicle player) }; 
       player setPos[(getPos player select 0) + 10, (getPos player select 1) + 10, getPos player select 2]; 
       player removeAction (_this select 2); 
      }]; 
     }; 
    }; 
    life_inEinstieg = false; 
   }; 
  }, _this, 0, false, false, "", "( 
    ((count crew (((attachedTo _target) getVariable['FireSeats', []]) select 2)) == 0) &&  
    ( 
     !(_this in ((attachedTo _target) getVariable['FireSeats', []])) && 
     !((vehicle _this) in ((attachedTo _target) getVariable['FireSeats', []])) && 
     !(_target getVariable ['lock', true]) 
    ) 
  );"]; 
   
  _veh2 addAction["Als Passagier einsteigen",  
  { 
   if(!life_inEinstieg) then 
   { 
    life_inEinstieg = true; 
    _this spawn 
    { 
     { 
      if((count crew _x) == 0) exitWith 
      { 
       player moveInCargo [_x, 1]; 
       life_ausstiegID = player addAction["Aussteigen", 
       { 
        [] spawn { 
         player allowDamage false; 
         sleep 5; 
         player allowDamage true; 
        }; 
        player action ['Eject', vehicle player]; 
        waitUntil { player == (vehicle player) }; 
        player setPos[(getPos player select 0) + 10, (getPos player select 1) + 10, getPos player select 2]; 
        player removeAction (_this select 2); 
       }]; 
      }; 
     } foreach ((attachedTo (_this select 0)) getVariable["Seats", []]); 
    }; 
    life_inEinstieg = false; 
   }; 
  }, _this, 0, false, false, "", "( 
   ( 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 0)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 1)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 2)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 3)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 4)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 5)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 6)) == 0) || 
    ((count crew (((attachedTo _target) getVariable['Seats', []]) select 7)) == 0) 
   ) &&  
    ( 
     !(_this in ((attachedTo _target) getVariable['Seats', []])) && 
     !((vehicle _this) in ((attachedTo _target) getVariable['Seats', []])) && 
     !(_target getVariable ['lock', true]) 
    ) 
  );"]; 
 
  _veh2 addAction["Aufsperren",  
  { 
   (_this select 0) setVariable ['lock', false, true]; 
   systemChat "Du hast Dein Fahrzeug aufgeschlossen."; 
   [(_this select 0), "unlock"] remoteExec ["tanoarpg_fnc_playSound3D", -2]; 
   hint composeText [image "icons\unlock.paa", " Fahrzeug aufgeschlossen"]; 
  }, "", 0, false, false, "", "((_target getVariable ['lock', true]) && (_target in life_vehicles));"]; 
 
  _veh2 addAction["Zusperren",  
  { 
   (_this select 0) setVariable ['lock', true, true]; 
   systemChat "Du hast Dein Fahrzeug abgeschlossen."; 
   [(_this select 0), "car_lock"] remoteExec ["tanoarpg_fnc_playSound3D", -2]; 
   hint composeText [image "icons\lock.paa", " Fahrzeug abgeschlossen"]; 
  }, "", 0, false, false, "", "(!(_target getVariable ['lock', true]) && (_target in life_vehicles));"]; 
 
  _bootChests = (_this getVariable['Chests', []]); 
  { 
   _X addAction["Laderaum �ffnen",  
   { 
    [(_this select 3)] call tanoarpg_fnc_openInventory; 
   }, _veh2, 0, false, false, "", "(((attachedTo _target) getVariable['BB', null]) in life_vehicles);"]; 
  } forEach _bootChests; 
 } 
] remoteExec ["BIS_FNC_CALL", 0, true]; 
 
[_veh1, _veh2, _veh3, _veh4, _veh5, _veh6, _veh7, _veh8, _veh9, _veh10, _veh11, _veh12, _veh13, _veh14, _veh15, _veh16, _veh17, _vehChest1, _vehChest2] spawn { 
 private["_vehHaupt0","_vehHaupt1","_vehNeben"]; 
  
 _vehHaupt0 = (_this select 0); 
 _vehHaupt1 = (_this select 1); 
 _vehNeben = _this - [_vehHaupt0, _vehHaupt1]; 
 waitUntil{ ((isNull _vehHaupt0) || (isNull _vehHaupt1) || ((getDammage _vehHaupt0) >= 1) || ((getDammage _vehHaupt1) >= 1)) }; 
 if(!isNull _vehHaupt0) then { deleteVehicle _vehHaupt0; }; 
 if(!isNull _vehHaupt1) then { deleteVehicle _vehHaupt1; }; 
 { 
  deleteVehicle _x; 
 } forEach _vehNeben; 
};