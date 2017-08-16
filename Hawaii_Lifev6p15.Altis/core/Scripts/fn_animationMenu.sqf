	/*
		File: fn_animationMenu.sqf
		Author: Warnerm14's barrier Script edited by Larry
		Desc: Setup Animations
	*/
	player removeAction kniebeugen;
	player removeAction liegestz;
	player removeAction kata;
	player removeAction pee;
	player removeaction cancelAnimations;
	player removeAction headerAnimations;
	
	headerAnimations = player addaction [("<t color=""#FF3300"">" + ("### ANIMATIONEN ###") +"</t>"),""];
	
	kniebeugen = player addaction [("<t color=""#00ced1"">" + ("Kniebeugen") +"</t>"),{
		if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
		{
		player playMove "AmovPercMstpSnonWnonDnon_exercisekneeBendB";
		sleep 2;
		};
	}];
	
	liegestz = player addaction [("<t color=""#00ced1"">" + ("Liegestueze") +"</t>"),{
		if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
        {
        player playMove "AmovPercMstpSnonWnonDnon_exercisePushup";
        sleep 2;
        };
	}];
	
	kata = player addaction [("<t color=""#00ced1"">" + ("Karate") +"</t>"),{
		if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
        {
        player playMove "AmovPercMstpSnonWnonDnon_exerciseKata";
        sleep 2;
        };
	}];
	
	pee = player addaction [("<t color=""#00ced1"">" + ("Pinkeln") +"</t>"),{
		if (vehicle player == player && !(player getVariable ["restrained", false]) && (animationState player) != "Incapacitated" && !life_istazed) then
        {
			[] spawn life_fnc_pee;
        };
	}];
	
	cancelAnimations = player addaction [("<t color=""#FF3300"">" + ("### Close ###") +"</t>"),{
		player removeAction kniebeugen;
		player removeAction liegestz;
		player removeAction kata;
		player removeAction pee;
		player removeaction cancelAnimations;
		player removeAction headerAnimations;
	}];