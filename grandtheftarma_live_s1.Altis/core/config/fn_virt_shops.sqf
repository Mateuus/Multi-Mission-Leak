private "_shop";
_shop = _this select 0;

switch _shop do {
	case "boozemarket": {["Booze Market",["water","cornmeal","bottles"]]};
	case "rebel": {["Rebel Market",["water","rabbit","apple","tbacon","lockpick","pickaxe","axe","fuelF","peach","boltcutter","zipties","drill"]]};
	case "gang": {["Gang Market", ["water","rabbit","apple","tbacon","lockpick","pickaxe","axe","fuelF","peach","boltcutter","drill"]]};
	case "wongs": {["Wong's Food Cart",["turtlesoup","turtle"]]};
	case "heroin": {["Drug Dealer",["cocaine_p","heroin_p","marijuana", "cmeth_p"]]};
	case "oil": {["Oil Trader",["oil_p"]]};
	case "fishmarket": {["Altis Fish Market",["salema","ornate","mackerel","mullet","tuna","catshark"]]};
	case "glass": {["Altis Glass Dealer",["glass"]]};
	case "iron": {["Altis Industrial Trader",["iron_p"]]};
	case "copper": {["Altis Industrial Trader",["copper_p"]]};
	case "sugar": {["Altis Sugar Trader",["sugar_p"]]};
	case "rice": {["Altis Rice Trader",["rice_p"]]};
	case "diamond": {["Diamond Dealer",["diamond_p"]]};
	case "salt": {["Salt Dealer",["salt_p"]]};
	case "event": {["Event Shop",["present","team_red","team_blue","cream"]]};
	case "cmeth": {["Redneck Pharmacy",["cmeth_u_1","cmeth_u_2"]]};
	case "press": {["Press Shop", ["water","rabbit","apple","tbacon","fuelF","peach"]]};
	case "taxi": {["Metro Taxi Service", ["water","rabbit","apple","tbacon","fuelF","peach"]]};

  case "gang": {
    _return = ["Gang Market", []];

    (_return select 1) pushBack "water";
    (_return select 1) pushBack "rabbit";
    (_return select 1) pushBack "apple";
    (_return select 1) pushBack "tbacon";
    (_return select 1) pushBack "pickaxe";
    (_return select 1) pushBack "axe";
    (_return select 1) pushBack "fuelF";
    (_return select 1) pushBack "boltcutter";
    (_return select 1) pushBack "drill";
    (_return select 1) pushBack "zipties";
    (_return select 1) pushBack "lockpick";

    _return
  };

  case "advrebel": {
    _return = ["Advanced Rebel Market", []];

    (_return select 1) pushBack "spikeStrip";
    (_return select 1) pushBack "snapgun";

    _return
  };

	case "cop": {
		_copRank = ["GTA_copRank"] call GTA_fnc_const;
		_return = ["Cop Item Shop", ["donuts", "salad", "tobacco", "coffee", "spikeStrip", "water", "rabbit", "apple", "fuelF", "lockpick"]];

		if (_copRank >= 6) then {
      (_return select 1) pushBack "snapgun";
			(_return select 1) pushBack "boltcutter";
		};

		_return
	};

  case "mil": {
    _milRank = ["GTA_milRank"] call GTA_fnc_const;
    _return = ["Military Items", ["spikeStrip", "water", "ration_small", "ration_big", "fuelF", "snapgun", "lockpick", "boltcutter"]];

    if (_milRank >= 3) then {
      (_return select 1) pushBack "roadcone";
      (_return select 1) pushBack "tapebarrier";
      (_return select 1) pushBack "plasticbarrier_l";
      (_return select 1) pushBack "safetybarrier";
      (_return select 1) pushBack "concretebarrier_s";
      (_return select 1) pushBack "concretebarrier_l";
      (_return select 1) pushBack "bargate";
      (_return select 1) pushBack "cargohouse_g";
      (_return select 1) pushBack "cargohouse_b";
      (_return select 1) pushBack "cargopost_g";
      (_return select 1) pushBack "cargopost_b";
      (_return select 1) pushBack "cargohq_g";
      (_return select 1) pushBack "cargohq_b";
      (_return select 1) pushBack "cargotower_g";
      (_return select 1) pushBack "cargotower_b";
      (_return select 1) pushBack "portablelight_s";
      (_return select 1) pushBack "portablelight_d";
      (_return select 1) pushBack "roadsign";
      (_return select 1) pushBack "target1";
      (_return select 1) pushBack "target1_pop";
      (_return select 1) pushBack "target2";
      (_return select 1) pushBack "target2_pop";
      (_return select 1) pushBack "target3";
      (_return select 1) pushBack "target3_pop";
      (_return select 1) pushBack "target4";
      (_return select 1) pushBack "target4_pop";
      (_return select 1) pushBack "shoot_house_stand";
      (_return select 1) pushBack "shoot_house_crouch";
      (_return select 1) pushBack "shoot_house_prone";
    };

    _return
	};

  case "sru": {
		_copRank = ["GTA_copRank"] call GTA_fnc_const;
		_return = ["SRU Item Shop", []];

    (_return select 1) pushBack "donuts";
    (_return select 1) pushBack "water";
    (_return select 1) pushBack "spikeStrip";
    (_return select 1) pushBack "snapgun";
		(_return select 1) pushBack "boltcutter";
    (_return select 1) pushBack "fuelF";

		_return
	};

	case "shootingrange": {
		_copRank = ["GTA_copRank"] call GTA_fnc_const;
		_return = ["RTO Training Shop", ["roadcone"]];

		if (_copRank >= 6) then {

			(_return select 1) pushBack "tapebarrier";
			(_return select 1) pushBack "target1";
			(_return select 1) pushBack "target1_pop";
			(_return select 1) pushBack "target2";
			(_return select 1) pushBack "target2_pop";
			(_return select 1) pushBack "target3";
			(_return select 1) pushBack "target3_pop";
			(_return select 1) pushBack "target4";
			(_return select 1) pushBack "target4_pop";
			(_return select 1) pushBack "shoot_house_stand";
			(_return select 1) pushBack "shoot_house_crouch";
			(_return select 1) pushBack "shoot_house_prone";
		};

		_return
	};

	case "hato": {

		_hatoRank = ["GTA_hatoRank"] call GTA_fnc_const;
		_return = ["HATO Items", ["coffee", "donuts", "kitkat", "water", "rabbit", "apple", "snapgun", "lockpick", "fuelF"]];

		if (_hatoRank >= 2) then {
			(_return select 1) pushBack "roadcone";
			(_return select 1) pushBack "bargate";
			(_return select 1) pushBack "plasticbarrier_l";
			(_return select 1) pushBack "plasticbarrier_m";
			(_return select 1) pushBack "portablelight_s";
			(_return select 1) pushBack "portablelight_d";
			(_return select 1) pushBack "roadsign";
			(_return select 1) pushBack "safetybarrier";
			(_return select 1) pushBack "streetlamp";
			(_return select 1) pushBack "concretebarrier_s";
			(_return select 1) pushBack "concretebarrier_l";
		};

		if (_hatoRank >= 3) then {
			(_return select 1) pushBack "cargohouse_g";
			(_return select 1) pushBack "cargopost_g";
			(_return select 1) pushBack "cargohq_g";
		};

		_return
	};

	case "med": {
		_medRank = ["GTA_medRank"] call GTA_fnc_const;
		_return = ["NHS Market", ["water", "apple", "bubblegum"]];

		if (_medRank >= 2) then {
			(_return select 1) pushBack "coffee";
		};

		if (_medRank >= 3) then {
			(_return select 1) pushBack "salad";
			(_return select 1) pushBack "lockpick";
		};

		if (_medRank >= 4) then {
			(_return select 1) pushBack "fuelF";
		};

		_return
	};

  case "propane": {["Propane Trader", ["propane"]]};
	case "wood": {["Lumberyard", ["wood_p","axe"]]};
	case "cement": {["Cement Dealer", ["cement"]]};
	case "gold": {["Gold Buyer", ["goldbar"]]};
	case "bar": {["The Lounge", ["bottledbeer","bottledwhiskey"]]};
	case "speakeasy": {["Speakeasy's", ["bottledwhiskey","bottledshine","bottledbeer"]]};
	case "Prospector": {["Gold Ingot Dealer", ["goldbarp"]]};
	case "market": {["Altis Market", ["water","rabbit","apple","watermelon","tbacon","lockpick","pickaxe","axe","fuelF","peach","boltcutter","drill","storagesmall","storagebig"]]};
	case "bounty_hunter_market": {["Bounty Hunter Market",["water","rabbit","apple","tbacon","lockpick","fuelF","peach","zipties"]]};
	case "fridge": {["Fridge", ["donuts","coffee","water","rabbit","apple"]]};
	case "silver": {["Silver Trader", ["silver_p"]]};
	case "kfc": {["KFC Menu", ["kfc_popcorn","kfc_wings","kfc_bucket","kfc_pepsi"]]};
	case "greggs": { ["Greggs Menu", ["greggs_sausageroll", "greggs_pasty", "greggs_steakbake", "greggs_sausagebean", "greggs_cheesebacon", "coffee"]] };
	case "coffee": { ["Coffeehouse Menu", ["coffee", "donuts", "water", "tbacon", "tea"]] };
	case "kebab": { ["Kavala Greasy Kebabs", ["kebab", "kfc_pepsi"]] };
};
