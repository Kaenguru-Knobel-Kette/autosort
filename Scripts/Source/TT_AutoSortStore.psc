ScriptName TT_AutoSortStore Extends ObjectReference
{Move items from a storage container to the sorting container.}

ObjectReference Property SortingContainer Auto


Event OnClose(ObjectReference akActivator)
	If (akActivator == Game.GetPlayer())
		RemoveAllItems(SortingContainer, True, True)
	EndIf
EndEvent
