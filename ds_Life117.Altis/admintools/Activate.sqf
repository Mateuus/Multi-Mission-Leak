waituntil {!alive player ; !isnull (finddisplay 46)};

if ((getPlayerUID player) in DS_adminlist1) then {
	sleep 10;
	player addaction [("<t color=""#0074E8"">" + ("Tools Menu") +"</t>"),"admintools\Eexcute.sqf","",999999,false,true,"",""];
};

