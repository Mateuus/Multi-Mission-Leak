/*
		fn_funknetz.sqf
		Author: G00golplexian
		
		Description: Funny easter-egg script :D
*/

_penner = _this select 0;

if(life_beatgeld < 500) exitWith {hint "Der Penner will nicht mit dir reden."};
_penner setRandomLip true; 
_penner say3d "penner1";
titleText ["Schätzelein, wie kann ich dir behilflich sein?!", "PLAIN DOWN"];
sleep 5;
_penner say3d "penner2";
titletext ["Ach Scheiße, is dat wieder kalt hier bei mich zu Hause!", "PLAIN DOWN"];
sleep 5;
_penner say3d "penner3";
titletext ["Schätzelein, weisse, ich bin ja nicht der Reichste aber hasse mal ne Mark für mich?", "PLAIN DOWN"];
sleep 7;
_penner say3d "penner4";
titletext ["Setz dich einfach zu mir und dann nimm dir ne Flasche Bier!", "PLAIN DOWN"];
sleep 7;
_penner say3d "penner5";
titletext ["Wer is dat denn jetz hinter dir, is dat etwa der Franz Beckenbauer?!", "PLAIN DOWN"];
sleep 3;
_penner say3d "penner6";
if(player distance _penner > 5) exitWith {hint "Glück gehabt, beinahe hätte der Penner dich bestohlen."};
life_beatgeld = life_beatgeld - 500;
hint "Der Penner hat dich um 500€ bestohlen.";
_penner setRandomLip false; 