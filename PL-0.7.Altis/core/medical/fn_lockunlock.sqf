_veh = cursorTarget;

if(_veh isKindOf "Car") then {
  _locked = locked _veh;
    if(_locked == 2) then {
      for "_i" from 0 to 5 do
      {
        player playMove "AinvPknlMstpsnonWnonDnon_medic_1";
        sleep 2;
      };
      if(local _veh) then {
        _veh lock 0;
                      _veh animateDoor ["door_back_R",1];
                      _veh animateDoor ["door_back_L",1];
                      _veh animateDoor ['door_R',1];
                      _veh animateDoor ['door_L',1];
                      _veh animateDoor ['Door_rear',1];
                      _veh animateDoor ['Door_LM',1];
                      _veh animateDoor ['Door_RM',1];
                      _veh animateDoor ['Door_LF',1];
                      _veh animateDoor ['Door_RF',1];
                      _veh animateDoor ['Door_LB',1];
                      _veh animateDoor ['Door_RB',1];
      } else {
        [[_veh,0],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
        _veh animateDoor ["door_back_R",1];
        _veh animateDoor ["door_back_L",1];
                      _veh animateDoor ['door_R',1];
                      _veh animateDoor ['door_L',1];
                      _veh animateDoor ['Door_rear',1];
                      _veh animateDoor ['Door_LM',1];
                      _veh animateDoor ['Door_RM',1];
                      _veh animateDoor ['Door_LF',1];
                      _veh animateDoor ['Door_RF',1];
                      _veh animateDoor ['Door_LB',1];
                      _veh animateDoor ['Door_RB',1];
      };
      if (_veh getVariable ["hooks",false]) then {
        [[_veh,true],"TON_fnc_changeSligLoad",false,false] spawn life_fnc_MP;
      };
      hint composeText [ image "icons\unlock.paa", " Véhicule ouvert" ];
      player say3D "unlock";
    } else
    {
      if(local _veh) then
      {
        _veh lock 2;
        _veh animateDoor ["door_back_R",0];
        _veh animateDoor ["door_back_L",0];
                      _veh animateDoor ['door_R',0];
                      _veh animateDoor ['door_L',0];
                      _veh animateDoor ['Door_rear',0];
                      _veh animateDoor ['Door_LM',0];
                      _veh animateDoor ['Door_RM',0];
                      _veh animateDoor ['Door_LF',0];
                      _veh animateDoor ['Door_RF',0];
                      _veh animateDoor ['Door_LB',0];
                      _veh animateDoor ['Door_RB',0];
      } else
      {
        [[_veh,2],"life_fnc_lockVehicle",_veh,false] spawn life_fnc_MP;
        _veh animateDoor ["door_back_R",0];
        _veh animateDoor ["door_back_L",0];
                      _veh animateDoor ['door_R',0];
                      _veh animateDoor ['door_L',0];
                      _veh animateDoor ['Door_rear',0];
                      _veh animateDoor ['Door_LM',0];
                      _veh animateDoor ['Door_RM',0];
                      _veh animateDoor ['Door_LF',0];
                      _veh animateDoor ['Door_RF',0];
                      _veh animateDoor ['Door_LB',0];
                      _veh animateDoor ['Door_RB',0];
      };
      if (_veh getVariable ["hooks",false]) then {
        [[_veh,false],"TON_fnc_changeSligLoad",false,false] spawn life_fnc_MP;
      };
      hint composeText [ image "icons\lock.paa", " Véhicule fermé" ];
      player say3D "unlock";
    };
};
