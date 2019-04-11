ScriptName TT_AutoLootFurniture Extends ObjectReference
{Automatically loot items from selected containers when the player uses this furniture.}

ObjectReference[] Property Containers Auto

Spell Property CraftingSpell Auto


Event OnActivate(ObjectReference akActivator)
	If (akActivator == Game.GetPlayer())
		(akActivator As Actor).AddSpell(CraftingSpell, False)
		Utility.Wait(0.5)
		Int i = 0
		While (i < Containers.Length)
			Containers[i].RemoveAllItems(akActivator)
			i += 1
		Endwhile
		While (IsFurnitureInUse())
			Utility.Wait(1.0)
		EndWhile
		(akActivator As Actor).RemoveSpell(CraftingSpell)
	EndIf
EndEvent
