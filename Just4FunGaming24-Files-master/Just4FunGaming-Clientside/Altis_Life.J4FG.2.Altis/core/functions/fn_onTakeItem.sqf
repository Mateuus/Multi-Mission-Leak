params[
    [ "_unit"     , objNull, [objNull] ],
    [ "_container", objNull, [objNull] ],
    [ "_item"     , "",      [""]      ]
];

format [ "<TAKE> %1 (%2) TAKE %3 FROM %4", profileName, getPlayerUID player, _item, _container] remoteExec ["XY_fnc_log", 2];