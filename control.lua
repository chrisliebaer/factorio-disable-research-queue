-- these events contain the force directly
local research_trigger_events_force = {
	defines.events.on_research_cancelled,
	defines.events.on_research_moved,
}

-- these events contain a research object with an attached force
local research_trigger_events_no_force = {
	defines.events.on_research_finished,
	defines.events.on_research_reversed,
	defines.events.on_research_started,
}

function research_trigger_events(force)
	-- if queue is enabled, do nothing
	if settings.global["research-queue-enable"].value then
		return
	end

	-- otherwise get current research queue and check if contains more than one research
	local research_queue = force.research_queue
	if research_queue and #research_queue > 1 then
		-- if so, remove all but the first research
		for i = #research_queue, 2, -1 do
			table.remove(research_queue, i)
		end

		-- update the research queue
		force.research_queue = research_queue

		local printSettings = {color = {r = 1, g = 0.2, b = 0.2}}
		force.print("Research queue is disabled, only one research can be queued at a time.", printSettings)
	end
end

script.on_event(research_trigger_events_force, function(event)
	local force = event.force
end)

script.on_event(research_trigger_events_no_force, function(event)
	local force = event.research.force
end)


-- since there is no event for adding elements to the research queue, we have to poll the research queue every tick
script.on_event(defines.events.on_tick, function(event)
	-- if queue is enabled, do nothing
	if settings.global["research-queue-enable"].value then
		return
	end

	-- otherwise get all forces and check their research queues
	for _, force in pairs(game.forces) do
		research_trigger_events(force)
	end
end)
