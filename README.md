# Disable Research Queue

![Mod Thumbnail](https://raw.githubusercontent.com/chrisliebaer/factorio-disable-research-queue/refs/heads/master/thumbnail.png)

This is a very basic Factorio mod that disables the research queue in version 2.0 of Factorio.
The previous version of the game had the option to disable the research queue in the settings, but this option was removed in version 2.0.

# Why?
Discussing, deciding and sabotaging research order is a great source of fun for me in multiplayer saves.
I don't like the research queue, because it makes it too easy to just queue up a bunch of research and forget about it with no further interaction.

# Issues and Shortcomings
Factorios modding API integrates very poorly with the research queue.
There is no way to be notified of changes to the research queue, so I have to poll the queue every tick.
Likewise, scripted updates to the queue are not reflected on the client side, until the research window is closed and reopened.
I'm not aware of any way to fix these issues, so I'm afraid they will remain.
