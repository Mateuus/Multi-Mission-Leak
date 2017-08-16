_mode = _this select 3;
switch (_mode) do 
{
	case "ficken": 
				{
						//Prices
							_number = ceil(random 5);
							if(_number == 0) then { hookerprice = 10;};
							if(_number == 1) then { hookerprice = 100;};
							if(_number == 2) then { hookerprice = 200;};
							if(_number == 3) then { hookerprice = 500;};
							if(_number == 4) then { hookerprice = 1000;};
							if(_number == 5) then { hookerprice = 2000;};
							_pplayer = _this select 0;					
							//Chance of get some sexualill
							_number1 = ceil(random 100);
							if(_number1<33) then { sexualill = 0;};
							if(_number1>33) then { sexualill = 1;};
							if(_number1>66) then { sexualill = 2;};					
					uiSleep 1;
					_playercosts = hookerprice;
					_playersexill = sexualill;						
						if(argent_liquide < hookerprice) exitWith 
						{
							hint "Vous n'avez pas assez d'argent pour vous payer ce service !";
						};
						if(life_sex_ill > 0) exitWith
						{
							hint "La prostitué ne veut pas de toi comme client. Apparement tu as deja transmis des maladies aux filles ! Va chez le médecin avant !";
						};
						hint format["Tu te sens vidé et detentu... ca fait du bien... Ca ta couté %1€. \n\n ...Par contre avec ce genre de fille tu devrais sans doute passer chez le medecin",_playercosts];
						argent_liquide = argent_liquide - _playercosts;
						life_sex_ill = life_sex_ill + _playersexill;

						if(_playersexill == 0) then
						{
							player setDamage 0;
							life_thirst =200;
							life_hunger = 200;
						};
						if(_playersexill == 1) then
						{
							player setDamage 0.25;
						};
						if(_playersexill == 2) then
						{
							player setDamage 0.50;
						};		
				};
};