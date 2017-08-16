"BIS_fnc_MP_packet" addPublicVariableEventHandler {_this call ES_fnc_MPexec};

if(isServer) then {} else { [] spawn ES_fnc_init; [] spawn ES_fnc_jip; [] call ES_fnc_KRON; };