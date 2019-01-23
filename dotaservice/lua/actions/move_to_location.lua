-------------------------------------------------------------------------------
--- AUTHOR: Nostrademous
-------------------------------------------------------------------------------

local MoveToLocation = {}

MoveToLocation.Name = "Move to Location"
MoveToLocation.NumArgs = 3

-------------------------------------------------

function MoveToLocation:Call( hUnit, vLoc, iType )
    -- Note: we test for valid conditions here on hUnit, but we shouldn't
    -- as the agent should only suggest legal and valid actions
    if not hUnit:IsAlive() or hUnit:IsRooted() or hUnit:IsStunned() then
        print("[ERROR] - MoveToLocation under death/root/stun")
        do return end
    end
    
    -- print("Moving to: <", vLoc[1],", " vLoc[2], "> from <", hUnit:GetLocation().x, ", ", hUnit:GetLocation().y, ">")
    
    iType = iType[1]
    
    vLoc = Vector(vLoc[1], vLoc[2], vLoc[3])
    DebugDrawCircle(vLoc, 25, 255, 255 ,255)
    DebugDrawLine(hUnit:GetLocation(), vLoc, 255, 255, 255)
    
    if iType == nil or iType == ABILITY_STANDARD then
        hUnit:Action_MoveToLocation(vLoc)
    elseif iType == ABILITY_PUSH then
        hUnit:ActionPush_MoveToLocation(vLoc)
    elseif iType == ABILITY_QUEUE then
        hUnit:ActionQueue_MoveToLocation(vLoc)
    else
        print("[ERROR] - Unknown iType: ", iType)
		do return end
    end
end

-------------------------------------------------

return MoveToLocation
