/*
	Darkside Life

	Author: Shawn "Huntah" Macgillivray

	Description:
	Returns market information
*/

private["_price","_title","_textArea","_job1","_display","_list","_name","_crimes","_bounty","_units","_players","_jobsList"];

_jobsList = ["Apple Picker","Peach Picker","Baker","Salt Trader","Oil Trader","Diamond Trader","Copper Trader","Cement Trader","Iron Trader","Glass Trader","Lumber Trading","Relic Collector","Fuel Delivery","Truck Driver","Chopper Pilot","Crop Dusting","Heroin Dealer","Weed Dealer","Cocaine Dealer","Crystal Meth Dealer","Drug Convoy Driver","Illegal Relic Collector","Police Bank","Air Taxi","Land Taxi"];

switch(_this select 0)do
	{
	case 0:
		{
		_price = format ["$%1",[(DS_sellArray select 11)] call DS_fnc_numberText];
		_jobsList = ["Apple Picker","Sell Price Per Processed Unit:    ",_price,"Apples can be picked at any apple field, once picked they can be sold directly to any market","The apple price on Altis
		 is normally stable, however when there are shortages the rich will pay a high price for fresh fruit","Apple picking is very low risk, however if the price is high you can expect for people to try and rob you"];
		};
	case 1:
		{
		_price = format ["$%1",[(DS_sellArray select 21)] call DS_fnc_numberText];
		_jobsList = ["Peach Picker","Sell Price Per Processed Unit:    ",_price,"Peaches can be picked at any peach field, once picked they can be sold directly to any market","The peach price on Altis is normally stable, however when there are shortages the rich will pay a high price for fresh fruit","Peach picking is very low risk, however if the price is high you can expect for people to try and rob you"];
		};
	case 2:
		{
		_price = format ["$%1",[(DS_sellArray select 113)] call DS_fnc_numberText];
		_jobsList = ["Baker","Sell Price Per Processed Unit:    ",_price,"Wheat can be harvested in the wheat fields by pressing tab while you have a pickaxe in your inventory. It can then be processed at a bakery and sold at any market","The wheat price on Altis is very stable and never changes no matter how much is sold","The entire process of baking bread is done inside a safezone, because of this the reward is lower than other jobs"];
		};
	case 3:
		{
		_price = format ["$%1",[(DS_sellArray select 54)] call DS_fnc_numberText];
		_jobsList = ["Salt Trader","Sell Price Per Processed Unit:    ",_price,"Salt can be mined in the salt mine field by pressing tab while you have a pickaxe in your inventory. It can then be processed at the salt processor and sold at any factory","The price of salt will rise and lower depending on demand, when other resources are sold the salt price will increase, it will lower when salt is sold","Salt is a relatively low risk job, your only threat is from people who will attempt to rob you"]
		};
	case 4:
		{
		_price = format ["$%1",[(DS_sellArray select 50)] call DS_fnc_numberText];
		_jobsList = ["Oil Trader","Sell Price Per Processed Unit:    ",_price,"Oil can be mined at any oil mine by pressing tab while you have a pickaxe in your inventory. It can then be processed at the oil processor and sold at any factory. Oil is also an ingredient for many craft-able items at the factory","The price of oil will rise and lower depending on demand, when fuel prices are high due to gas station robberies the price will rise, it will lower when oil is sold","Oil is a relatively low risk job, your only threat is from people who will attempt to rob you"]
		};
	case 5:
		{
		_price = format ["$%1",[(DS_sellArray select 51)] call DS_fnc_numberText];
		_jobsList = ["Diamond Trader","Sell Price Per Processed Unit:    ",_price,"Diamonds can be mined at the diamond mine by pressing tab while you have a pickaxe in your inventory. They can then be processed at the diamond processor and sold at any factory.","The price of diamonds will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when diamonds are sold","Diamonds is a relatively low risk job, your only threat is from people who will attempt to rob you"]
		};
	case 6:
		{
		_price = format ["$%1",[(DS_sellArray select 52)] call DS_fnc_numberText];
		_jobsList = ["Copper Trader","Sell Price Per Processed Unit:    ",_price,"Copper can be mined at the copper mine by pressing tab while you have a pickaxe in your inventory. They can then be processed at the copper processor and sold at any factory. Copper is also a highly sort after ingredient used for many craft-ables at the factory","The price of copper will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when copper is sold","Copper is a moderately risky job, purely based on its crafting uses many people will attempt to get their hands on copper without doing the mining themselves"]
		};
	case 7:
		{
		_price = format ["$%1",[(DS_sellArray select 53)] call DS_fnc_numberText];
		_jobsList = ["Cement Trader","Sell Price Per Processed Unit:    ",_price,"Rocks can be mined at the rock mine by pressing tab while you have a pickaxe in your inventory. They can then be processed at the cement processor and sold at any factory.","The price of cement will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when cement is sold","Rock mining is a relatively low risk job, your only threat is from people who will attempt to rob you"]
		};
	case 8:
		{
		_price = format ["$%1",[(DS_sellArray select 55)] call DS_fnc_numberText];
		_jobsList = ["Iron Trader","Sell Price Per Processed Unit:    ",_price,"Iron can be mined at the iron mine by pressing tab while you have a pickaxe in your inventory. They can then be processed at the iron processor and sold at any factory. Iron is also a highly sort after ingredient used in many craft-ables","The price of iron will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when iron is sold","Iron mining is a moderately risky job, purely based on its crafting uses many people will attempt to get their hands on iron without doing the mining themselves"]
		};
	case 9:
		{
		_price = format ["$%1",[(DS_sellArray select 56)] call DS_fnc_numberText];
		_jobsList = ["Glass Trader","Sell Price Per Processed Unit:    ",_price,"Sand can be mined at the sand mine by pressing tab while you have a pickaxe in your inventory. It can then be processed at the sand processor and sold at any factory. Glass is also used at the factory for crafting items","The price of glass will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when glass is sold","Glass mining is a moderately risky job, purely based on its crafting uses some people may attempt to get their hands on glass without doing the mining themselves"]
		};
	case 10:
		{
		_price = format ["$%1",[(DS_sellArray select 75)] call DS_fnc_numberText];
		_jobsList = ["Lumberjack","Sell Price Per Processed Unit:    ",_price,"Lumber can be collected at the lumber mine by pressing tab while you have a pickaxe in your inventory. It can then be processed at the lumber processor and sold at any factory. Treated Lumber is also used at the factory for crafting items","The price of lumber will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when lumber is sold","Lumber mining is a moderately risky job, purely based on its crafting uses some people may attempt to get their hands on lumber without doing the mining themselves"]
		};
	case 11:
		{
		_price = format ["$%1",[(DS_sellArray select 57)] call DS_fnc_numberText];
		_jobsList = ["Relic Collector","Sell Price Per Processed Unit:    ",_price,"Legal Relics can be collected at the ship wrecks marked in the ocean (Legal Relics). Simply swim under the water below 10m and press tab (A wetsuit and re-breather is recommended). Relics do not need to be processed so once collected they can be sold to a factory.","The price of legal relics will rise and lower depending on demand, the price will rise when other resources are sold, it will lower when legal relics are sold","Legal Relic collecting is a moderately risky job, being in the ocean you may catch the attention of rebels flying over"]
		};
	case 12:
		{
		_price = "";
		_jobsList = ["Fuel Delivery","Depends on distance travelled and quest completed",_price,"Fuel delivery jobs can be started any any jobs depot, you will need your own fuel truck to begin the job. You will then be asked to drive to three locations to deliver fuel (Stay in your truck) then return to the depot for payment","The payout for delivering fuel is affected by the current fuel price, the higher the price the more you will be paid for deliveries","Fuel Delivery is a moderately risky job, thugs may attempt to rob you and steal your truck, be sure not to pull into a petrol station while it is being robbed"]
		};
	case 13:
		{
		_price = "";
		_jobsList = ["Truck Delivery","Payment is fixed depending on your trucking level",_price,"Truck missions are started any any jobs depot, your boss will provide you with the truck. As you complete jobs you will level up, this will increase your payments and give you bigger loads to deliver","The payout for truck delivery missions is fully dependant on your trucking level, the distance travel is not a factor however you can achieve a speed bonus for completing a delivery quickly","Fuel Delivery is a moderately risky job, thugs may attempt to rob you and steal your truck, you will also have police bothering you to make sure your load is safe"]
		};
	case 14:
		{
		_price = "";
		_jobsList = ["Chopper Delivery","Payment is fixed depending on your chopper pilot level",_price,"Chopper missions are started any any jobs depot, you will need to bring your own helicopter. As you complete jobs you will level up, this will increase your payments and give you bigger loads to deliver which also require you to use bigger helicopters","The payout for chopper delivery missions is fully dependant on your pilot level, however the distance travelled will also factor into your total payout","Chopper missions are a low risk job, you spend most of your time in the air away from others. Your biggest risk are collisions with other air traffic, crashing and being robbed while starting jobs"]
		};
	case 15:
		{
		_price = "";
		_jobsList = ["Crop Dusting","Depends on distance travelled and quest completed",_price,"Crop dusting missions are started at most airfields, you will need to provide your own plane. You will be given three locations to dust in a row before retuning to where you started for payment. You will need to fly low and slow over each field to continue to your next one","The longer your distance the more you will be paid, civilian quest also heavily influence your payments making crop dusting one of the most profitable jobs","Crop dusting is considered a high risk job, you are at risk of crashing an expensive air craft. Rebels may try to steal your plane to chop also, since they are so high priced."]
		};
	case 16:
		{
		_price = format ["$%1",[(DS_sellArray select 27)] call DS_fnc_numberText];
		_jobsList = ["Heroin Dealer","Sell Price per Processed Unit:     ",_price,"Heroin can be collected at the heroin field by pressing tab, you must have at least 60kg free inventory space to collect. The drugs are processed at gang hideout 3 once your gang captures the area at the flag","The heroin price will lower when heroin is sold, and will rise when other illegal drugs are sold","This is an extremely high risk job, the drug fields and gang hideouts are both (Kill on sight zones) so the threat from civilians is large. The police will also be looking for drug dealers and will often raid drug areas and gang hideouts in high numbers"]
		};
	case 17:
		{
		_price = format ["$%1",[(DS_sellArray select 28)] call DS_fnc_numberText];
		_jobsList = ["Weed Dealer","Sell Price per Processed Unit:     ",_price,"Weed can be collected at the weed field by pressing tab, you must have at least 60kg free inventory space to collect. The drugs are processed at gang hideout 1 once your gang captures the area at the flag","The weed price will lower when weed is sold, and will rise when other illegal drugs are sold","This is an extremely high risk job, the drug fields and gang hideouts are both (Kill on sight zones) so the threat from civilians is large. The police will also be looking for drug dealers and will often raid drug areas and gang hideouts in high numbers"]
		};
	case 18:
		{
		_price = format ["$%1",[(DS_sellArray select 29)] call DS_fnc_numberText];
		_jobsList = ["Cocaine Dealer","Sell Price per Processed Unit:     ",_price,"Cocaine can be collected at the cocaine field by pressing tab, you must have at least 60kg free inventory space to collect. The drugs are processed at gang hideout 2 once your gang captures the area at the flag","The cocaine price will lower when cocaine is sold, and will rise when other illegal drugs are sold","This is an extremely high risk job, the drug fields and gang hideouts are both (Kill on sight zones) so the threat from civilians is large. The police will also be looking for drug dealers and will often raid drug areas and gang hideouts in high numbers"]
		};
	case 19:
		{
		_price = format ["$%1",[(DS_sellArray select 39)] call DS_fnc_numberText];
		_jobsList = ["Crystal Meth Dealer","Sell Price per Processed Unit:     ",_price,"Meth is processed in the rebel KOS area, in order to process 1 unit of meth you need 1 Hydrochloric Acid and 1 Sodium Acid, these can be stolen in packs from hospitals","The meth price will slowly rise over time as demand grows, the price will drop once meth is sold","This is an extremely high risk job, robbing hospitals makes them a KOS zone and will get police attention fast. Hardened rebels often hang out in the rebel KOS area also so processing can be very tricky"]
		};
	case 20:
		{
		_price = format ["$%1",[(DS_jobPayArray select 2)] call DS_fnc_numberText];
		_jobsList = ["Drug Convoy Driver","Payment per successful delivery:     ",_price,"Drug convoys are started from the flag in any gang hideout that you currently own, you will be provided with a truck. Your job will be to pick up drugs at a marked location then deliver them to another marked location","The payment does not alter much however sometimes when deliveries are low it may increase","This is a high risk job, you will be picking up a truck full of drugs from kos zones (Gang hideouts). Rebels may be there to kill you and police may want to search your vehicle"]
		};
	case 21:
		{
		_price = format ["$%1",[(DS_sellArray select 34)] call DS_fnc_numberText];
		_jobsList = ["Illegal Relic Collector","Sell Price Per Processed Unit:    ",_price,"illegal Relics can be collected at the ship wrecks marked in the ocean (Illegal Relics). Simply swim under the water below 10m and press tab (A wetsuit and re-breather is recommended). Illegel relics need to be processed at the illegal relics processor in the ocean, then sold at the illegal goods dealer","The price of illegal relics will rise and lower depending on demand, the price will rise when other illegal goods are sold, it will lower when illegal relics are sold","Illegal Relic collecting is a very risky job, both the shipwreck and processor are KOS areas, police will also want to bust you"]
		};
	case 22:
		{
		_price = format ["$%1",[DS_policeBank] call DS_fnc_numberText];
		_jobsList = ["Police Bank","Current amount in police bank:    ",_price,"Money is added to the police bank when police complete certain task, this money can be stolen by rebels when they crack open the safe at Fort Knox","The police bank money will change all the time as police get rewarded","This is simply here to show civilians how much money is in the police bank"]
		};
	case 23:
		{
		_price = "";
		_jobsList = ["Air Taxi","Payment depends on your current Air Taxi Level",_price,"Air Taxi missions are started at the Plane Mission markers at Air Fields. These will require you to fly your own plane around picking up and dropping off passengers","Your payments will increase as you level up through the missions, you will also receive a payment bonus everytime you are promoted","This is a moderately risky job as you will often be landing on run ways or fields, this leads to possible robbery attempts and crashes"]
		};
	case 24:
		{
		_price = "";
		_jobsList = ["Land Taxi","Payment depends on your current Taxi Level",_price,"Land Taxi missions are started by pressing F5 while inside a taxi SUV. These will require you to drive around picking up and dropping off passengers","Your payments will increase as you level up through the missions, you will also receive a payment bonus everytime you are promoted","This is a low risk job as you may come into contact with highway robbers"]
		};
	case 25:
		{
		_price = format ["$%1",[(gasMoneyArray select 11)] call DS_fnc_numberText];
		_jobsList = ["Fuel Price","Current fuel price:    ",_price,"The cost of fuel will rise as gas stations are robbed, the cost will lower when oil is sold or someone completes fuel missions (Air vehicle gas is 10 times this amount)","This is simply here to show civilians how much the current fuel price is"]
		};
	};

_jobsList;