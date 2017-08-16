/*
	File: fn_revivePlayer.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Starts the revive process on the player.
*/
private ["_hit_selection","_damage","_projectile","_rnd"];


//if(AWS_HD_Running) exitWith {};
//AWS_HD_Running = true;
_hit_selection = param[1,"",[""]];
_damage = param[2,0,[0]];
if(_damage < 0.2) exitWith {};
_projectile = param[4,"",[""]];
if(!alive player) exitWith {AWS_HD_Running = false;};


switch (true) do
{
      case ((_hit_selection in ["head","face_hub","neck"])):
      {
            player setVariable["traumatic_brain_injury",true,true];
            AWS_CONFIG set[14,true];
      };

      case ((_hit_selection in ["pelvis","spine1","spine2","spine3","body"]) && _projectile == ""):
      {
            player setVariable["big_wound_torso",true,true];
            AWS_CONFIG set[9,true];
      };

       case ((_hit_selection in ["arms","hands"]) && _projectile == ""):
      {
            _rnd = random 100;
            if(_rnd > 50) then {
                  _rnd = random 100;
                  if(_rnd > 50) then {
                        player setVariable["big_wound_left_arm",true,true];
                         AWS_CONFIG set[10,true];
                  } else {
                        player setVariable["big_wound_right_arm",true,true];
                         AWS_CONFIG set[11,true];

                  };
            } else {
                  _rnd = random 100;
                  if(_rnd > 50) then {
                        player setVariable["broken_left_arm",true,true];
                         AWS_CONFIG set[2,true];
                  } else {
                        player setVariable["broken_right_arm",true,true];
                         AWS_CONFIG set[3,true];

                  };
            };
      };

       case ((_hit_selection in ["legs"]) && _projectile == ""):
      {
            _rnd = random 100;
            if(_rnd > 50) then {
                  _rnd = random 100;
                  if(_rnd > 50) then {
                        player setVariable["big_wound_left_leg",true,true];
                         AWS_CONFIG set[12,true];
                  } else {
                        player setVariable["big_wound_right_leg",true,true];
                         AWS_CONFIG set[13,true];
                  };
            } else {
                  _rnd = random 100;
                  if(_rnd > 50) then {
                        player setVariable["broken_left_leg",true,true];
                         AWS_CONFIG set[0,true];
                  } else {
                        player setVariable["broken_right_leg",true,true];
                         AWS_CONFIG set[1,true];

                  };
            };
      };


      case ((_hit_selection in ["pelvis","spine1","spine2","spine3","body"]) && _projectile != ""):
      {
           player setVariable["bullet_wound_torso",true,true];
            AWS_CONFIG set[8,true];
      };

       case ((_hit_selection in ["arms","hands"]) && _projectile != ""):
      {
            _rnd = random 100;
            if(_rnd > 50) then {
                  player setVariable["bullet_wound_left_arm",true,true];
                   AWS_CONFIG set[4,true];
            } else {
                  player setVariable["Bullet_wound_right_arm",true,true];
                   AWS_CONFIG set[5,true];

            };
      };

       case ((_hit_selection in ["legs"]) && _projectile != ""):
      {
            _rnd = random 100;
            if(_rnd > 50) then {
                  player setVariable["bullet_wound_left_leg",true,true];
                   AWS_CONFIG set[6,true];
            } else {
                  player setVariable["bullet_wound_right_leg",true,true];
                   AWS_CONFIG set[7,true];

            };
      };

      default
      {
          _rnd = random 100;
          if(_rnd > 50) then {
                 _rnd = random 100;
                if(_rnd > 50) then {
                      _rnd = random 100;
                      if(_rnd > 50) then {
                            player setVariable["big_wound_left_arm",true,true];
                             AWS_CONFIG set[10,true];
                      } else {
                            player setVariable["big_wound_right_arm",true,true];
                             AWS_CONFIG set[11,true];

                      };
                } else {
                      _rnd = random 100;
                      if(_rnd > 50) then {
                            player setVariable["broken_left_arm",true,true];
                             AWS_CONFIG set[2,true];
                      } else {
                            player setVariable["broken_right_arm",true,true];
                             AWS_CONFIG set[3,true];

                      };
                };
      };
      } else {
               _rnd = random 100;
            if(_rnd > 50) then {
                  _rnd = random 100;
                  if(_rnd > 50) then {
                        player setVariable["big_wound_left_leg",true,true];
                         AWS_CONFIG set[12,true];
                  } else {
                        player setVariable["big_wound_right_leg",true,true];
                         AWS_CONFIG set[13,true];
                  };
            } else {
                  _rnd = random 100;
                  if(_rnd > 50) then {
                        player setVariable["broken_left_leg",true,true];
                         AWS_CONFIG set[0,true];
                  } else {
                        player setVariable["broken_right_leg",true,true];
                         AWS_CONFIG set[1,true];

                  };
            };


      };
};



//AWS_HD_Running = false;