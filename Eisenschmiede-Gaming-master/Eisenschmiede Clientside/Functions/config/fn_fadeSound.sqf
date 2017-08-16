switch (player getVariable["Earplugs",0]) do {

	case 0: { hintSilent "Deine Lautstärke wurde verringert um 90%"; 1 fadeSound 0.1; player setVariable ["Earplugs", 10]; };
	case 10: {hintSilent "Deine Lautstärke wurde verringert um 60%"; 1 fadeSound 0.4; player setVariable ["Earplugs", 40]; };
	case 40: { hintSilent "Deine Lautstärke wurde verringert um 30%"; 1 fadeSound 0.7; player setVariable ["Earplugs", 70]; };
	case 70: { hintSilent "Volle Lautstärke"; playSound "earplug"; 1 fadeSound 1; player setVariable ["Earplugs", 0]; };

};