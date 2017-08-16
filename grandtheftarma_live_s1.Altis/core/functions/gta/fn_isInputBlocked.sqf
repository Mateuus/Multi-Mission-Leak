/**
 * Copyright © 2015 DnA, Grand Theft ArmA.
 * All Rights Reserved.
 */

player getVariable ["incapacitated", false] || {player getVariable ["restrained", false]} || {player getVariable ["tased", false]} || {animationState player == "unconscious"}
