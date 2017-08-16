class CfgSpawnPoint {
	class civ {
		class civ_spawn_3
		{
			displayName = "Shukurkalay";
		};

		class civ_spawn_2
		{
			displayName = "Nagara";
      requirement = "license_civ_passport";
		};

		class civ_spawn_4
		{
			displayName = "Karachinar";
      requirement = "license_civ_passport && !license_civ_rebel";
		};

		class reb_spawn_1
		{
			displayName = "Loy Manara";
      requirement = "license_civ_rebel";
		};

    class civ_spawn_1
    {
      displayName = "Rasman";
      requirement = "license_civ_passport && !(Tower2 getVariable 'eg_terror')";
    };
  };

  class west {
    class cop_spawn_1
    {
      displayName = "UN Airfield";
    };

    class cop_spawn_2
    {
      displayName = "UN FOB"
    };
  };

  class guer {
    class medic_spawn_1
    {
      displayName = "Rasman Hospital"
    };
    class medic_spawn_2
    {
      displayName = "Garmsar Regional"
    };
    class medic_spawn_3
    {
      displayName = "medic_spawn_3"
    };
  };
};
