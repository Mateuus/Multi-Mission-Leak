/*
File:   Config_Lumbering.hpp
Author: noms
*/
class CfgLumbering {

  class Trees {

    /*

      To Add a Tree to the lumbering system, the tree needs to have a name that begins with "t_"

      You need to add two options:
      1. A tree type (see example below)
      2. Add the check statement in lumbering\fn_gatherAction.sqf (see example below)
      3. TEST! You need an AXE and then use your ActionKey on the Tree

      EXAMPLE TREE CLASS
      ---------
      class Tree_Type {
        displayName = "";
        harvestItems[] = {{"fish", 2}}; //(Items retrieved on harvest)
        rewardAmountArray[] = {1,2,3}; //(An array of numbers randomly selected to reward when the plant is farmed)
        farmWait = 5; //(The amount in seconds a player must wait before farming is complete)
        xpReward = 5; //(The amount of XP awarded to a player for succesfully harvesting a tree) only use this if you use my xp system
      };
      ---------


      EXAMPLE CHECK FOR fn_gatherAction.sqf
      ---------
      if([str _curObject,"text_in_filename"] call KRON_StrInStr) then {           //Text between t_ and _f in the filename for the tree.
        _resourceClass = "Tree_type";                                             //The tree class you defined in Config_Lumbering.hpp
      };
      ---------


    */

    class t_ficusb1s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {1,2,2,2,2,3};
      farmWait = 2;
    };
    class t_populusn3s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {1,2,2,2,2,3};
      farmWait = 2;
    };
    class t_oleae2s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {1,2,2,2,2,3};
      farmWait = 2;
    };
    class t_ficusb2s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {2,3,3,3,3,4};
      farmWait = 2;
    };
    class t_oleae1s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {1,2,2,2,2,3};
      farmWait = 2;
    };
    class t_pinuss2s_b_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {2,3,4,4,4,5};
      farmWait = 2;
    };
    class t_pinuss1s_b_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {2,3,4,4,4,5};
      farmWait = 2;
    };
    class t_fraxinusav2s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 4}};
      xpReward = 5;
      rewardAmountArray[] = {2,4,5,5,5,6};
      farmWait = 2;
    };
    class t_phoenixc3s_f {
      displayName = "Lumber";
      harvestItems[] = {{"lumber", 3}};
      xpReward = 5;
      rewardAmountArray[] = {2,4,5,5,5,6};
      farmWait = 3;
    };
  };
};
