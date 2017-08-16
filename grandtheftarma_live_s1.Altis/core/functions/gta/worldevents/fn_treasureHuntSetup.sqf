/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

params [
  ["_npc", objNull, [objNull]]
];

//--- Texture
_npc setObjectTexture [0, "textures\civilian\uniforms\easterbunny.paa"];

//--- Set face
_npc setFace "AfricanHead_01";

//---- Reset animation
_npc switchMove "";

//--- Collect reward action
_npc addAction ["<t color='#ff8800'>Collect Reward</t>", {[_this select 0] call GTA_fnc_treasureHuntCollect}, nil, 10, true, true, "", "_this distance _target < 4"];

//--- Santa's special powers
_npc spawn {
  waitUntil {
    sleep 1;

    if (vehicle player isKindOf "Air") then {
      if (!isObjectHidden _this) then {
        _this hideObject true;
      };
    } else {
      if (isObjectHidden _this) then {
        _this hideObject false;
      };
    };

    isNull _this
  };
};
