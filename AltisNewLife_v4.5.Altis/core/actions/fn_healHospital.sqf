_mode = _this select 3;
switch (_mode) do 
{
	case "heilen":
					{
						if(argent_liquide < 100) exitWith {hint "Vous devez avoir 100€ pour etre soigne."};
						titleText["Docteur Dorian va vous guérir ... ne vous inquiétez pas ..","PLAIN"];
						uiSleep 2;
						titleText["Oups, je pense que j'ai mal inséré l'aiguille ...","PLAIN"];
						uiSleep 5;
						if(player distance (_this select 0) > 5) exitWith {titleText["Vous devez rester dans un rayon de 5 m, de sorte que le médecin puisse vous traiter.","PLAIN"]};
						titleText["Vous êtes maintenant en parfaite santé !","PLAIN"];
						player setdamage 0;
						[0] call life_fnc_setPain;
						argent_liquide = argent_liquide - 100;
					};						
	case "checken":
					{
						 if(life_checked == 1) exitWith { hint "Vous avez déjà fait un check up. Vous devriez être en pleine forme maintenant !"; };
						 if(life_sex_ill == 0) then
						 {
							 hint format["Diagnostique : \n\n Nom : %1 \n\n Maladie : aucun",name player];
							 life_checked = 0;
						 };
						 if(life_sex_ill == 1) then
						 {
							 hint format["Diagnostique : \n\n Nom : %1 \n\n Maladie : la Gonorrhée \n\n Vous devriez maintenant être traité",name player];
							 life_checked = 1;
						 };
						 if(life_sex_ill == 2) then
						 {
							hint format["Diagnostique : \n\n Nom : %1 \n\n Maladie : le Sida \n\n Vous devriez maintenant être traité",name player];
							life_checked = 1;
						 };
					 };
	case "behandeln":
					 {
						if(life_checked == 0) exitWith { hint "Comment dois-je vous traiter si je ne sais même pas ce que vous avez ? Nous allons vérifier par nous-même"; };
						if(life_sex_ill == 1) then
						{
							if(argent_liquide<200) exitWith { hint "J'ai trouvé une maladie sexuellement transmissible mais vous n'avez malheureusement pas assez d'argent pour qu'on puisse vous traiter... dommage ca coute 200€ !";};
							titleText["Malheureusement vous avez bien une MST, c'est la gonorrhée. Protegez vous mieux la prochaine fois ! Je vais vous guérir maintenant. \n Cela peut prendre jusqu'à 20 secondes.","PLAIN"];
							uiSleep 20;
							titleText["Voila vous êtes guéri ! Je penses que vous allez vous en sortir","PLAIN"];
							argent_liquide = argent_liquide - 200;
							player setDamage 0;
							life_sex_ill = 0;
							life_checked = 0;
						};
						
						if(life_sex_ill == 2) then
						{
							if(argent_liquide<400) exitWith { hint "J'ai trouvé une maladie sexuellement transmissible très grave mais vous n'avez malheureusement pas assez d'argent pour qu'on puisse vous traiter... c'est con ca coute 400€!";};
							titleText["Malheureusement vous avez bien une MST, et c'est le SIDA. Je vais essayer de vous guérir maintenant mais attention ou vous trainer la prochaine fois \n Cela peut prendre jusqu'à 45 secondes.","PLAIN"];
							uiSleep 45;
							titleText["Voila vous êtes guéri ! Je penses que vous allez vous en sortir mais c'est pas passez loin !","PLAIN"];
							argent_liquide = argent_liquide - 400;
							player setDamage 0;
							life_sex_ill = 0;
							life_checked = 0;
						};
					 };
};