ScriptName TT_AutoLootSpell Extends ActiveMagicEffect  
{Keep track of automatically looted items and send them back when the player exits the furniture.}

ObjectReference Property SortingContainer Auto

Spell Property CraftingSpell Auto

Actor Target


Event OnEffectStart(Actor akTarget, Actor akCaster)
	Target = akTarget
EndEvent


Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	; Ignore crafted items
	If (akSourceContainer != None)
		While (Target.HasSpell(CraftingSpell)) 
			Utility.Wait(1.0)
		EndWhile
		Target.RemoveItem(akBaseItem, aiItemCount, True, SortingContainer)
	EndIf
EndEvent
