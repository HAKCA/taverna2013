/obj/effect/step_trigger/teleporter/hellish
	name = "terrible abyss"
	desc = "<font color='#f00'>You fell strange about this.</font>"
	icon = 'icons/obj/gun.dmi'
	icon_state = "revolver"

	invisibility = 0
	//var/strong_mobs = list()
	//var/moderate_mobs = list()
	//var/weak_mobs = list()

/obj/effect/step_trigger/teleporter/hellish/Trigger(var/atom/movable/A)
	if(teleport_x && teleport_y && teleport_z)

		A.x = teleport_x
		A.y = teleport_y
		A.z = teleport_z

	if(istype(A, /mob/living/carbon/human))
		var/mob/living/carbon/human/H = A
		var/obj/screen/S = H.damageoverlay
		H << sound('sound/event_stuff/portal.ogg')
		S.icon = 'icons/event_stuff/doom_3_portal.gif'

		var/R = rand(1, 100)
		switch(H.desc)
			if("strong")
				R = 25
			if("weak")
				R = 60
			if("sinner")
				R = 90

		switch(R)
			if(1 to 50)
				H << "<span class='danger'>You experience all your sins again. And again. And again. MAKE IT STOP!!!</span>"
				H.desc = "strong"
				H.Weaken(10)
			if(51 to 75)
				H << "<span class='danger'>Your spirit not strong enough to take all of this pain. You want to die.</span>"
				H.vomit()
				H.emote("collapse")
				H.Weaken(10)
				H.desc = "weak"
			if(76 to INFINITY)
				H << "<span class='danger'>You are a sinner. Your place in hell.</span>"
				H.vomit()
				H.emote("scream")
				H.emote("collapse")
				H.Weaken(10)
				H.desc = "sinner"
				H.adjust_fire_stacks(2)
				H.IgniteMob()

		spawn(10 SECONDS)
		S.icon = 'icons/mob/screen1_full.dmi'
//set_light(0,0,"#ffffff")

// icons/mob/screen1_old.dmi
//mob/living/carbon/human/proc/vomit()