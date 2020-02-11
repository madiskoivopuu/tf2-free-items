#include <sourcemod>
#include <tf2_stocks>
#include <sdktools>
#include <client_group_status>
#include <clientprefs>
#include <morecolors>

Handle h_australiumOn[1];
Handle h_festiveOn[1];
Handle h_australiumFestive[1];

int Australium_EquipWeapon(int client, int weapon, int weaponId, int numAttributes)
{
  TFClassType class = TF2_GetPlayerClass(client);

  new String:aussieOnC[12];
  GetClientCookie(client, h_australiumOn[0], aussieOnC, sizeof(aussieOnC));
  int australiumOn = StringToInt(aussieOnC);
  int rval[2];

  if(australiumOn == 1)
  {
    if(class == TFClass_Scout)
    {
      if(weaponId == 13 || weaponId == 200)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 200, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 45)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 45, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Soldier)
    {
      if(weaponId == 18 || weaponId == 205)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 205, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 228)
      {
          rval[0] = Australium_SpawnWeapon(weapon, 228, numAttributes);
          rval[1] = 1;
          return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Pyro)
    {
      if(weaponId == 21 || weaponId == 208)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 208, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 38)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 38, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_DemoMan)
    {
      if(weaponId == 20 || weaponId == 207)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 207, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 19 || weaponId == 206)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 206, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 132)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 132, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Heavy)
    {
      if(weaponId == 15 || weaponId == 202)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 202, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 424)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 424, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Engineer)
    {
      if(weaponId == 141)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 141, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 7 || weaponId == 197)
      {
        rval[0] = Australium_SpawnGoldenWrench(weapon, 169, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Medic)
    {
      if(weaponId == 29 || weaponId == 211)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 211, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 36)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 36, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Sniper)
    {
      if(weaponId == 14 || weaponId == 201)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 201, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 16 || weaponId == 203)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 203, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 264)
      {
        rval[0] = Australium_SpawnGoldenPan(weapon, 1071, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
    else if(class == TFClass_Spy)
    {
      if(weaponId == 61)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 61, numAttributes);
        rval[1] = 1;
        return rval;
      }
      else if(weaponId == 4 || weaponId == 194)
      {
        rval[0] = Australium_SpawnWeapon(weapon, 194, numAttributes);
        rval[1] = 1;
        return rval;
      }
    }
  }

  // If NONE of the conditions were met, return base weapon
  rval[0] = weapon;
  rval[1] = 0;
  return rval;
}

int Australium_SpawnWeapon(int weapon, int id, int numAttributes)
{
  SetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex", id);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 542, 1.0);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2022, 1.0);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2027, 1.0);
  return weapon;
}

int Australium_SpawnGoldenPan(int weapon, int id, int numAttributes)
{
  SetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex", id);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 542, 0.0);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2022, 0.0);
  //TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2027, 0.0); //is_australium_item
  return weapon;
}

int Australium_SpawnGoldenWrench(int weapon, int id, int numAttributes)
{
  SetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex", id);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 542, 0.0);
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2022, 0.0);
  //TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2027, 0.0); //is_australium_item
  return weapon;
}

int Festive_EquipWeapon(int client, int weapon, int weaponId, int isAustralium, int isPaint, int numAttributes)
{
  TFClassType class = TF2_GetPlayerClass(client);

  char festiveOnC[12];
  GetClientCookie(client, h_festiveOn[0], festiveOnC, sizeof(festiveOnC));
  int festiveOn = StringToInt(festiveOnC);
  int rval[2];

  // Prioritize custom free item weapons first
  if(isAustralium != 0 || isPaint != 0)
  {
    if(festiveOn == 1)
    {
      rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
      rval[1] = 1;
      return rval;
    }
  }

  if(class == TFClass_Scout)
  {
    if(weaponId == 13)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 669, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 45)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1078, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 46)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1145, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 0)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 660, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 221)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 999, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Soldier)
  {
    if(weaponId == 18)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 658, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 228)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1085, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 129)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1001, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 10)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1141, 1);

        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Pyro)
  {
    if(weaponId == 21)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 659, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 38)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1000, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 40)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1146, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 12)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1141, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 39)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1081, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_DemoMan)
  {
    if(weaponId == 20)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 661, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 19)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1007, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 132)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1082, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 131)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1144, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Heavy)
  {
    if(weaponId == 15)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 654, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 11)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1141, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 42)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1002, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 239)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1084, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Engineer)
  {
    if(weaponId == 141)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1004, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 7 || weaponId == 197)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 662, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 140)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1086, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 9)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1141, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Medic)
  {
    if(weaponId == 29)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 663, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 305)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1079, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 8 || weaponId == 198)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1143, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 37)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1003, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Sniper)
  {
    if(weaponId == 14)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 664, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 16)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1149, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 56)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1005, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 58)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1083, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }
  else if(class == TFClass_Spy)
  {
    if(weaponId == 61)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1006, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 24)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1142, 0);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 735 || weaponId == 736)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 1080, 1);
        rval[1] = 1;
        return rval;
      }
    }
    else if(weaponId == 4)
    {
      if(festiveOn == 1)
      {
        rval[0] = Festive_SpawnWeapon(weapon, 665, 2);
        rval[1] = 1;
        return rval;
      }
    }
    else
    {
      if(festiveOn == 1)
      {
        if(CanBeFestivized(weaponId))
        {
          rval[0] = Festive_SpawnWeaponFestivize(weapon, numAttributes);
          rval[1] = 1;
          return rval;
        }
      }
    }
  }

  // If NONE of the conditions were met, return base weapon
  rval[0] = weapon;
  rval[1] = 0;
  return rval;
}

int Festive_SpawnWeapon(weapon, id, slot)
{
  SetEntProp(weapon, Prop_Send, "m_iItemDefinitionIndex", id);
  return weapon;
}

int Festive_SpawnWeaponFestivize(int weapon, numAttributes)
{
  TF2Items_SetAttributeNew("CBaseCombatWeapon", weapon, 2053, 1.0);
  return weapon;
}

bool CanBeFestivized(int weaponId)
{
	char query[128];
	Format(query, sizeof(query), "SELECT * FROM tf2idb_can_be_festivized WHERE id='%i'", weaponId);
	Handle result = TF2IDB_FindItemCustom(query);

	int size = GetArraySize(result);

	return size > 0;
}
