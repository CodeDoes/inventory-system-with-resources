Okay, let's start from scratch. CG

is good enough for tutorial.

too much. Now it's now I create layer animation instead

of

surface of

mind

3 1 that's my 1.7 that's my ideal 2.2 to 25. This is my ideal size

like that. Then we had a collision shape just well we're doing things the wrong way around but like we can just make so five and 1.7 hero proportions according to me and then you reparent to a new node character body call this

add.

Oh, let's just Yeah, let's let's just do it the old fashioned way for now. And then also you save the you save the save the branch as C just to be safe. You save this thing. You save this entire scene as another scene called main. Well, that's what I call all my main main scenes. And then just for the start, select current. So we can start in the scene does nothing because there's no camera.

Okay. Now the player is way off or maybe the players in the correct place in the vision shape. So just reset their positions and move them move them a bit up until they like touch the ground.

That's one easy way to do it. 1.7 / two. There we go. 0.5

and then the camera you move till it's 1.7 and then you move it down by two by 2. That's too much. minus2. There we go.

Okay. So now we are going to quickly set up camera player. Uh well one of the easiest ways to do a camera is to basically give the camera give the camera a new node that surrounds it which is called camera origin.
 
Okay. So, now we got a player. Sorry about the Let's just check the sound. The sound is too low. So, the sound is too Okay, let's just check this. Okay, there we go. Anyway, so we got a player and then we've got a script. Then we got a camera and a camera origin. And what are we going to do with it? So, first things first is input. We're going to get the mouse

velocity maybe. Yeah, sure. Let's do that. Do it that way. Anyway, so aim velocity um or like let's just call it look and then for the cam. Okay. Well, one thing I like to do is make these unique names anyway. So, camera origin. Um, and we're going to rotate that around the Y. Yeah. Around the Y around the Y axis, which is up. So, we rotate it. Yeah. Let's rotate the Y with the look dox. Oh, and this one should be negative because well, that's just the way it it rotates. That that's just the way it rotates best. So, this one. And also you want to divide it by like 1,000 because the camera the screen might be a bit big or let's limit length to 1,000 and then we divide it by 1,000 to get a ratio between 1 0 and one. Then we get okay

well that's fine for now anyway. So rotate X look X and then okay don't apply delta. is just basically you're going to say how much of a circle it's going to do. So if we move a,000 pixels is going to rotate one once around the origin. And then in the camera 3D we're going to rotate its Y its X which is like right um up and down looking up for looking up and down. So this one is

Maybe we should just keep it like that. Um, and maybe Okay. And this one will be um we will be clamping it. It's the amount it can rotate. So, we're going to get bases. Oh, maybe it's bases.

can bases. Okay. So,

what's the rotation? Is it a It's a Eer. Okay, never mind then. That's fine. Can just change the X here. The X is going to be plus the Y towel. Then we're just going to clamp it. Clamp F or the um pi / two negative pi and then also by two. might might want to do it like divided by three. That might be a pure angle

times two. Anyway, let's How would we test this out? Let's go to main. So, we're here and let's see. It's probably not going to work, but Oh, yep. It's going crazy. Also, we should add a light here while we can. Directional light. Or let's just add a world environment.

And just add a procedural sky. Sky

blah blah blah. Procedural sky. And go. It's going way too crazy here.

Why is it doing that? able

this and just look at the um rotation around the that's too much. Maybe something like 10,000.

Maybe the

Yep.

This is always like a freaking finicky thing to do. So that's that feels better. Okay. Don't know why it's like that, but that's how it is.

Okay. Camera look why look anyway. So okay. So it's not freaking gimbal locking. Okay. Okay. And then another thing I like to do is I like to um capture the mouse. So input uh input mouse mode is equal to capture. No, it captured and that happens if I click on the screen. So it's if is mouse button mask mouse mask

and just make sure it's not zero which means it's not getting clicked. Now if it is clicked with any any button then basically it just captures the mouse and if input.get get key is key pressed. And I'm just going to do this quickly because well, we can show you how the inputs work later. So, input mode and input mode

visible. That's the Okay. Then, oh, and also you want to make sure that you only move the camera if the mouse is actually captured. If mouse mode equals mouse mode captured or doesn't equal then we just return and we skip this part and if it is captured then we then we continue with this

all okay there it's working okay then I can look around okay

this is for the player oh wait yeah okay another thing I like to do is to make um look process. Let's go with that delta. Not probably not going to use it. So we just go like that. We add all of this inside here. And then we call it again process delta. Okay. Then I do a move process as well. Just keeping things nice and nice and neat and stuff. Yeah. Anyway,

so now, okay. Oh, well, I'm going to use the freaking um input mode, input map. So, M up, M down, M left, M right. So, we just set this to some quick settings. Okay, now we've got a vector we can use. So move equals input dot get vector and it's left right up M up a down anyway. And then we go and um this is a character body 3 3D. So, we Okay, we're going to set the velocity equal to rotation H. Maybe it's better to global basis. Yeah, that's what we want. Or anything global. I basically I'm just worried that rotation is an eer which isn't getting used to to rotate things. So, global bases might be better. Um, and then we move.

Okay. And then we also um set a character a movement speed

to like 10 units 10 m/ second. That's that's how I I keep it in my head. So every second we'll be moving at 10 10 units if we keep it um button down. And then I'll just show you how it looks now. It's not going to fall or anything. Velocity. Why is it not error setting with value of type basis global? Oh, stupid. Anyway, times move times move speed. Okay, let's go. It's still not working. Why not? Oh, yep. obviously. So, yeah, you do make these type of mistakes. So, X, this one would be X. I'm not going to go up or down. I'm going to go forward and back. That's what the um vector is for. So, okay. Okay. Look around. I can't move. Oh, yeah. Never mind. It's a freaking character body. So it should you should apply um move and slide and snap to floor if you have it. Apply floor snap. There we go.

Ah,

also I think it should not be Oh, the camera origin was for something else. This should just be the rotate the Y, the whole character around the Y. Don't worry about it for now. I'll show you what it's used for later. So, okay, I can go forward and back, left and right. But it's a bit too snappy. So, we'll we're going to like adjust the velocity to we're also going to introduce another variable like movement acceleration, which is like movement speed on ready or like okay movement acceleration multiplier. So it's going to be like we want to within one second we want to go um or like imagine this is like dividing it how how fast do you want to reach the full speed that's that's how it's um it is. So let's set this to 10 and that means within a tenth of a second we will be reaching full speed depending on various things. So it's going to be like um first you say desired velocity it's this and then velocity and desired velocity are not the same. So we see that we get the difference between them. So it's desired minus velocity and that's that's the real velocity we want to apply to to reach the velocity to reach the desired velocity. But we limit this by um the acceleration and the speed and the movement speed. Movement speed times the acceleration multiplier. Okay. And that will give us like a smoother a more smooth movement. Oh, that's not right. What the [ __ ] What?

Oh, delta. Yep. This is so embarrassing.

That's way too slow.

Still doing a crazy thing. What am I doing wrong? It's probably like my live jitters. I'm jittering because I'm on live on stage.

move speed limit length and then you apply the acceleration by delta. What's wrong here? What am I missing?

Let's start the character just look looking in the correct direction at least.

Yep. Cut this from the from the um start.

Let's see.

The character moves and it wobbles like crazy for some reason. Um what did I do wrong? Lost the

It's overshooting. So why is it overshooting? Not supposed to be a able to overshoot. Oh, you you apply you add this difference in velocity. So let's call this difference difference in a way. So we add the difference to the velocity and it's slowly moves towards the desired velocity. That's way too fast. But it's it's already smoother than than the start. So, let's just reduce this to like two it will um within a within a half second it will um reach the full speed. That's how it works. Except if I'm mistaken and you can leave it in the comments. Um okay. So that's just movement. Uh, okay. So, now we're going to add an inventory to the player. So, first things first, maybe I should show you how to set up a resource. So, first thing, okay, we're going to add an inventory resource or like um inventory item resource.

Inventory item resource. I'll just just call it inventory item. class name is in item. They have like a export var name equals

in item

export bar. Um and then we have got two and then the plan was two scenes. We have a scene for um for when the player holds the the object in his hands and a scene for when he drops it on the floor. Yeah, let's just go with that. Or yeah, you can have many things, but like let's just leave it at that for now. Um, we've got handheld tc scene equals to packed in

then uh

world tc scene. What's the Oh, you can't rename this. So let's say in name.

Um,

okay. Now we need a object. So let's or we can just probably like make a new scene. So like that and just use CSG for quick examples.

Um, one thing the guy had was a crowbar. So, maybe I should One of my friends have is a crowbar. Let's just go with that.

That's a crowbar. Yes, it's a crowbar. It's a crowbar.

Okay, let's call it crowbar.

uh crowbar mesh. Let's change its type to uh CSG combiner.

And then

what's use collisions?

But I don't want it to be a freaking Oh, it's going to be like a static body. I don't want that. I wonder if you can Oh, bake collision shapes. Yeah, that's it.

Oh, I should use bake collision shapes. Oh, never mind then. Uh well, okay, let's first things first is um let's save it as a scene. Save it. Okay, let's make a new new scene. Um crowbar, a new folder, crowbar, and we crowbar mesh. Okay. Then inside and then we make a new scene, new 3D scene. It's a rigid body. Then for crow or mesh, we add it here. Make the um collisions. Yay, it works sort of. What did I do wrong? When used for collisions concave. Well, let's change it. I wonder if it would work like fake mesh instance

create collision shape.

I just want a con convex single convex. That's that's fine. Oh, that's too

uh multiple convex. No, that's wrong. That's not what I want.

Bounding box. Multiple convex. simplified context. That's also wrong.

Let's check see this is going to require so much editing. Um

well, you know what? I'm just going to leave it like that. Don't tell anyone. Or you could just Oh. Oh, that's fine. Okay. So, it's got a uh collision shape it can use. Going to leave it like that. What's this back face?

This only works with static bodies.

So, we got a collision shape and a mesh. That's about all we need.

We save it as a crowbar world. And then we rename this to crowbar world.

Then the trick is we add this as a world in item world object. That's a very long

script name. Anyway,

so we um export for um and then

like that. That's about it.

This should be a resource. That's what I wanted to show you.

Have to reload this.

Why is it not working? Invite them as a resource.

Oh, this should be What's this now? Yeah, it should be load. It should be requiring. Okay, there we go. Freaking hell. That's That took a while. So, we create a new invite item and then we assign this world as the world T scene. We save and then we create a new one. Uh, three. Just go with 3D crow bar and held.

First things first, we copy the mesh over. And that's about it. Um I guess like if you are going to use it in in a game, you would rotate it a bit, adjust it. And then the other thing we have to do is to make a in item hand

export v in item. In item

then we go to the world scene. Copy this. Maybe we should save it first. Save as

robbar in

a bunch of copying here, but you'll just have to get used to it. So, we make a new inventory. Oh, no, we don't make a new inventory item. We use the old one. And then this is going to be shared between them. So you change this, it's going to be it's going to change this one. You can change the name here. You share the name, everything like that. And that's about it. Well, okay. Obviously, now I have to show you how it works. So, let's make a new folder here because it's getting a bit crowded called player. Player to drag in all the scripts and things related to to the player there. Going to make a new a new folder for the in item in item in like that there. Okay. So, the player will should have a slot to hold something and if you do things correctly, you can even see it updating in real time. Tool script. Okay, let's go with that. Export for in item. Oh yeah, let's go handheld.

In item in item. All right. Okay. Handheld will be a handheld.

Going to it's just going to name these classes handheld. class name world object.

Okay. Now we can whenever this is set

we can um well there's this thing you could do. Oh

that would be stupid. So we have a camera origin camera

no 3D call it hand going to move it a bit like inside the camera's view just a bit to the side or maybe just keep it there

you know what might not need to do

Oh, we'll see you in a in a bit. in item.

So for the inventory, we're going to use in uh an array of in item.

Going to change this. We're going to um every time it's set to something else, we're going to have to update the visuals.

Update and alt. I was thinking for a while there. So, this is what we're going to do. Um, active

active or equipped equipped in item.

And let's just call it equipped. Equipped. And this is going to be an inventory item.

And if this is set, we also have to update the handout. So

now we have to make this function.

This is going so confusing. I'm so confused. Such a confused person.

broken. Um, okay. We need uh to add something to camera origin. I guess that's the best way to do it. I'm just guessing though.

First things first, we have to have something which is like just keeping track of um what we have in handheld.

Then we check if there's something signed there and we release it. If handout is not null, if handheld, well, we just basically Q free it.

Then hand out equals equipped

dot uh um instantiate. Oh no. Oh, it's like scene t scene uh handheld tc scene instantiate it and then um take hand out. We we Okay. Then also we take camera origin and we add a child to it for the handheld. Okay, that's that's about it. Well, it will break. Let's see. Camera. Let's change this to a camera. I think that would be best. We can like preview how it would look. Obviously, that's wrong then. So, we rotate it

also. Like I would like to be able to preview this. Maybe I should I wonder if there's like Oh, I'm I'm guessing there is two ways to do that. One of them is going to be camera. Oh, I can preview. Yes. Okay, we are working. We're doing things. There's the crowbar.

I wanted something like this. Maybe it would be better to like have a different viewport, right? Yeah, I'm guessing that's best.

Might be better to like have the thing way out there and bring it down. Maybe rotate it a bit.

Can't really see what it is. That this. Anyway, so we're holding the thing. Okay. I'm guessing that would be that would work. Now we just have to like have some way to put this camera on top of the of the other camera. I'll figure it out in a bit. Anyway,

so we added something to camera origin and okay, let's just see see what Okay, it's not going to work like that. Okay, first things first is we do it. Oh, it's already a tool script. So, never mind. Okay. Go to player and then we assign something there. We use inventory. Why is it not changing things?

Um,

well, one of the ways here is you have to add this. Yes. Use a redal name and use internal front.

Um player crowbar

robore inventory item.

Is it not changing?

Um,

well, one way to do it is to check if it's actually working. It's supposed to be updating. Print

Um,

open player again. That's not going to work. Um, we have to go out here. Oh, this also has to be inside physics, by the way. But he's already in physics. Basically, um, if engine is editor hint, basically you just return don't do all the character body things. Thank you. No wonder it was not working.

Oh,
 
And I'm back. Okay, so the fan is was not being picked up, which is a good thing. Okay, so basically we want to get Okay, first things first is you want to make sure that the cell phone will detect when it is getting um ray pickable. That's basically what we what we want. So, okay. Also, nah, it's fine. Okay. So, physics process look process maybe

pickup process. I'm just throwing things around here. That's

pickup process.

Okay. Pick up process. Um, you want to cast a cast array from the player camera.

Just choose player here in the choose player inside the um scene scene tree panel so that you can get autocomplete.

Um, cost. No, that won't work. Let's just look. Ray cost.

Should I do it that way or another way?

I guess the let's just do it the the boring way, not with a fancy ass programming way.

Okay. So, we add add a raycast here. Ray cost 3D. And we can like preview the direction it's going. Um we don't want to hit from inside. We collide with like almost everything. Um,

the only thing we need to do is like make sure this thing is the target position is far enough. Debug shapes. Where is the rate cast?

Oh, it's going upwards. No wonder. Let's see. No, I'm I can't see it. Why not? Why not? What's wrong here?

It's going downwards which is not what I want. I want minus Z which is this this direction. So minus like 30 is a lot. Yeah, you probably won't want to pick up pick something up from that distance. Maybe like five minus 5 is also a lot

minus two. That would be fine. Let's see if like the crowbar. Let's just choose the crowbar. Yeah, that would look a bit weird. H maybe we should like move the crowbar a bit closer to the screen. So go here. Just

this

very Halfife 2 vibes. Anyway, save that. Close. Close. Save. Um

okay and then well it will pick something up from two direct two 2 m away. Let's implement that now. So okay let's just um access with unique name and we call it let's call it pickup ray. So, we use the word pick up ray and then um no well I I've got no idea how to use this. I'm only familiar with a scripting way but let's just look at the documentation which you can access from that and then um basically we want to see how it calculates intersection for each physics frame which is what we want and also result in till the next physics frame. Um you can update it manually. Collide with areas. Add exception. Get collider. Get collision. Collision with areas. Where's the where's the where where is it held? Collide with bodies.

Let's go look at properties. There's no array over here.

is colliding.

So that's not that's not what we want. Um

collide with bodies hit from hit back face target position ext.

Well, is this what return the first object that the ray intersects? I guess that's that's fine. Okay. Get collider which will like return the rigid body. Get collider for um other equals pickup rate get collider. Okay. Okay. And then you can say if other is

um world object. Yeah.

Then we can like I guess the easiest way is to just q free it. Okay. Wait. Before we free it, we um we're going to add the other inventory item to our inventory.

inventory.append

other inventory item. Okay. And then we Q free the other. Um yeah, I guess we have to go to to the in input settings and then add a a a button for picking things up or um let's interact. Use interact. So E is like the the normal thing except if you got leaning mechanics.

So go like this. Well, nothing's going to happen. Whoa. Click.

Oh, if inventory.

So yeah, basically just check the check check that the inventory actually exit actually has has more than one more than zero

things fall down which is not a good thing. Let's go look inside the um main scene and we have to give this thing a glider. Combine mesh use collision.

Hey, it works. It's not broken. It's turning strangely, but what do you expect? And it's also like disappeared for some reason. What happened?

Oh, as soon as you look at it, it it picks it up.

Let's go pick it up. Pick it up without like pressing a button.

First things first is if not input dot is action just pressed. M interact.

Then we just return and do nothing.

Okay. So, when we press the um E the E key, it can pick things up. But it's pretty difficult now because we can't really see where we're going to pick things up. So, let's add a um indicator on the screen for that. This might also not be really useful to have as a tool. H, it's fine.

My things are like broken there.

Okay. So, let's add an indicator exactly on top of this. I guess it's like the center of the screen

canvas layer.

go into 2D view,

then add a control, and we're going to put it inside the center of the screen with the anchor preset. And we want like h maybe texturect.

Well, maybe we just want to change this one to a texture instead.

entered and then I guess I'm just going to wing it because I'm pretty uh is this Oh, you can't do it. You can't do it. Well, I guess we can't use a texture egg then.

What's this?

Got that color is fine. Yeah. Okay, that's fine. You can just make it a bit smaller like 20 pixels is a bit bit big. Let's go with Okay, let's make a little um what do you call it? A aim cursor. What do you Yeah. pointer four pixels wide by well 40. Let's keep it at that. Then just center it. And then just duplicate it and maybe ro. No, let's just do it the other way around. 40x4. And then just center that as well. Save.

Um, well, go into camera view.

It's not showing the canvas,

but let's play the game and see if it works. It works. Okay. Yeah, it's working sort of. Okay. Pressing A on the these parts doesn't work. Pressing A there, it works. Um, okay. So, it adds it to inventory, but there's no feedback really. Uh,

one of the easiest ways to do that is to add more user interface. Um, well, we could just make uh some bo boxes on the side that like lists out what what's inside your inventory. So, um, Vbox and then we add this to the side. Um, we fill the side with it. In fact, we make it a bit bit wider. Okay. And then the idea is this thing is going to be filled with the players inventory. So I'm going to add a script into this and and just call it like inventory um UI or let's call it HUD since it's like in in game HUD

and then export bar player equals player. Okay, player also doesn't have a name, but let's give it a name here. Player class must have a name. Okay, in this give it a name. Okay,

assign the player to it. Now we're rolling.

One of the things you want to do is on on ready, you want to be um listening to the players player for changes to its inventory. So, I guess there's some way we can emit a signal when the inventory changes. Signal inventory change. Yeah, that's what that's that's fine. emit. We could probably also make one for the um h for the equip equipped equip index changed. Equip index changed. You could also like index int. That's like the common way to do it. Here we go. Emit v. There we go. That's how you do it. And then inside the inventory we now we're going to listen to the to that signal equip inventory change dotconnect. Now we're going to make a function here called inventory changed

and connect it. Now the we're going to look at the inventory inside the player and we're just going to first things first we're going to clear the children for C in get children

C.Q3.

That's probably the cleanest way to do it. Maybe there's a better way. Please tell me in the comments. And then um for each for item in inventory we um create a first thing we make a label label new and then we set the text to item in name.

And then we add the child to this. Let's call this inventory HUD heads up display. Okay. Start. It's not working in the beginning because the because the player players inventory is already um set from the start. See if it works. There. There we go. Okay. Also, we might want to add um something for when the um equip item change equip index changes. Index changed index int player dot index changed. connect.

Um,

now we have to Okay. Well, yeah, let's just do it like this. Let's um look at the players inventory, but we Okay, the index. We find the player inventory or player inventory.

No. Flip. The easiest way to do it is get.

Okay. We just want to add something to the to the label. And I I'm not sure how to do that. Uh oh. Okay.

Is there a way to to give it some sort of decoration or something?

Uh, I could probably show you how to do it the long way around, which is more much cleaner.

Okay, let's do it the long way around.

Okay, first things first. Let's make a new folder. Player HUD inventory

HUD. Move the HUD in the script inside. Um save this inside that folder.

Then we make a um a scene for

inventory HUD item. We give it a um we give it a script. Basically,

this one is also going to use a um inventory in item which can be set and we can just like preview it inside the editor as well. Also, we're going to have a a variable for whether it should be in this selected state or not. Uh state False.

The enam state selected. Wait. Oh, this is so simple. Selected equals false.

And then we're going to okay, we're going to change this type into a Hbox. We're going to add a invisible um WCT uh color rect. There we go.

And then we're going to add a label.

The label is going to expand

also. It's going to be filling the screen. Just going to let's just reduce the size bit. And the color rate should have a um minimum size like 16 by 16. Maybe that's not right. Maybe like 32x 32. Ah, that's that uh 16 x 16 is better probably. Um then we're going to put this in the center. Yep, that looks better. I wonder if there's a way to add like margins or something, but I can't see it right now. H it's too much of a hassle. So, we're going to toggle this on and off. And then inventory item name. Oh, we don't want to toggle it on and off. We just want to make it transparent or not. So, it's going to be like this. Yep. Okay.

TP get um set V and then selected equals V image change. Uh you don't have that changed. Nope, doesn't exist. But let's function changed.

And then when inventory item changes we also change um trigger a call back on that in that case as well change like this. Okay. The label will be labels text will be equal to the inventory item text um um inventory name. Yeah. And then um

color rect do um modulate will be switching between color white. Oh wait, let's just change the alpha

equals um selected or not. Selected one if selected else zero. So if it's selected it's going to show itself. If it's not selected, then it's going to be transparent.

Um, yep, I think that's that's fine. Now, for the what what did I do? Item changed. Okay. Basically, we're just going to go through all the um four C in get children and we're going to let's just fix the the the the other one f first. Um, first things first is we're going to preload the um, inventory HUD item TC scene and we're going to instantiate that

HUD item. Okay,

we're going to set the the type as well. Let's let's go look. Let's set the class name to in HUD item and set the inad to class name to in HUD. Yeah. Anyway, a hu. Okay. If C is in HUD item which we all we know already it will be like that's like a given um item.

There we go. Yay. I might have to change edit this but whatever.

And it's we're not going to set if it's selected. This will be uh we might add item. Nope, we won't set it if it's selected. Get child at the um player dot equip equip index dot has item dot selected equals true.

That's probably the best way to go about it.

Well, we could just as well do this here as well.

And then we just do the same thing here. Quick and easy. Well, go look if it Let's go look if it works. It's probably going to break something. Inventory changed. Invalid access. Null instance. Oh, it's not set. Probably like reset itself somewhere when I saved it, I guess.

whip index exchanged. So basically it's saying that it can't find the the um the child probably because it doesn't exist. Probably because the inventory is like empty. But let's go. Um this is like a

uh a edge case for when the player's inventory is empty. But like let's just handle it in the same place all the time. So ind if index um more or equal to get child count then we just return. I'm guessing that's the correct way to do it.

Still not correct. What did I do wrong? Invalid assignment of property. Look, that's a correct way with a value ble on a bas type base object of type null. So you can't assign this to and this is null for some reason.

Why am I doing it like that? Okay. Yeah, that was the wrong way to do it. But let's try let's try again. book. Um, invalid assignment of property or key selected with type of value

24.

Well, they see it's not null. And we can set its Oh, is it even Why is it not inventory hide item? Let's go look.

Let's change this to tool so it updates inside the editor.

Why is it not changing?

Okay, this might be one of the reasons. Um, if you go like that and then Yeah,

let's close everything and open it again.

Might be better to transition that

uh create tween tween or that's not going to work. Let's not do that for now. We can do it later. Um

inventory HUD

Might be better to like use this use a resource for the inventory, but here we are. Nothing's perfect.

Well, I noticed that the it doesn't update when the um when you add some something to the inventory. Probably because like when it gets set, it it doesn't like change um an array doesn't change itself when you set when you append to it. So there's no sort of signals on it. So that's you just have to do it the old fashioned way. The process pickup process um end changed. What did I change? Changed it. There we go.

Actual property for null instance. Oh, we can't find color rect. Why not

self? Let's go look.

Um, origin. Maybe I should like add it to add it before I change the selected status. Oh, maybe this that that's the correct way around.

still not working. Well, it's selected the um but maybe just can't find um color rect. So, well, we can there's one easy way to do it. Get or we can just do it like that. This null get node

null

node not found. Um why not it like why is it not found?

Maybe because it's not inside the tree. If not is inside tree. Await. Enter tree. Entered.

You might have property or assignment selected with bull on a base of type null.

Still not finding it.

Okay, so I figured out the problem. The problem was that I was being stupid. Let's go fix that. So on the script, it's adding a label somewhere. Okay, let's just restart. Well, there's the problem immediately. Why is there a label over there? It should not be there. That's that what was what was causing the problem. Anyways, okay. So, select. Okay, it added it. Did you see that? It was amazing. It added it again. Okay. So, let's go out.

First things first, we're going to fix the crowbar's name to crowbar.

Maybe we can do another thing like make a different type of inventory item. It's probably just going to be simple. Yeah. Okay. You know what? Uh, so in world we're just going to duplicate this one and we're going to call it a bad bar. Bad bar. We're going to change we're going to duplicate the um inventory item inside here. Make it unique and then we're going to change the name just for examples. And then um

here we're going to duplicate this one. and we're going to call it a smartphone instead, even though it's going to look exactly the same, but it's going to have a unique resource.

Going to call it a smartphone. Smart. Very smart phone. I hope that was not I hope I was changing the correct one. Let's go look. Uh, smartphone. Yep, cell phone is there. If you go here, you select that. It's a smartphone. Okay. Then you can then we go into the main scene. We swap out these with the correct scenes. I wonder if you could do if there's like an easy way to do that, but I don't see anything. Let's see. Um, nope. I don't see anything. It's fine. It's fine. We can just like drag it in.

and smartphone. There we go. Remove these two.

Let's raise them a bit.

Okay. Raise them up a bit. Move the south into the side.

Start the game. Okay. Pick it up. See, it's a smartphone instead of a cell phone. This one's um collision shape is way wrong. I'm going to figure that out in a moment. Crowbar. Bad bar. Oh, I didn't change the name. Let's go look. Oh no, it's not supposed to be crowbar. Yep, that's wrong. The wrong one. Um, bad bar. There we go. It's still that one, which is not the correct one. Make unique

bad bar. Save. Save. Okay, there we go.

That collision shape is totally wrong, but I'm going to figure it out later. Okay, see the names on top. You can change the inventory slot position or index.

There we go. I'm guessing I'm almost finished. There's There's a bunch of like um polishing and stuff you could do, but that's that's about it. Let's go. Okay, let's go figure out the um why the crowbar is doing the weird dance

collision shape. There's the collision shape. Here's the rigid body. Um where's the mass distribution auto?

Why is it doing that? It should not be using collisions. Maybe that's the reason. I'm guessing that's not the reason, but let's just see. U mesh. Also, this one should not be using collision. Let's see if that was the reason. Yep, that seems to be the reason.

But now I Oh, yeah. Press the E key, not the F key. Okay. Um, what else? What else? Well, I guess um that's done for now. I'll I'll do the polishing later. Well, that's how you do a inventory in GDAU with resources without breaking anything. Well, just don't do the things I did wrong. Anyway, I see you later. Leave a comment down below. Like and subscribe. All that jazz. Bye.
 
I'm back. Anyway, I'm going to have to do this with export file

documentation here. Oh, that's about it.

PSN

and we also change this to strings. Yay. Um, makes probably makes more sense like this.

Not angry at me anymore. I can load the thing in peace.

This one is the world. This one is the handheld. I just wish it was better. Maybe there's like a better way to do it. Scene resource ecene

does it say load preload export

category custom directory

Oh well, whatever. It's fine for now.

load.

Let's go look at the player.

There we go. Okay, it's sort of doing what I wanted to. What happens if I start the game? Can't add the child to camera origin because it's null. Handheld is null or camera origin is null. I'm guessing it's camera origin. That's not uh Okay, one of the ways to do this is like a waiting until the um it enters tree. I'm guessing if not is entry tree then you just wait three entered.

We've got a crowbar over there. Just wish there was a way to like um put it on top of that one. Let's go look at the crowbar handheld scene.

Oh, crowbar handheld is not in the correct position. Let's play the game again and then just look at the remote. um camera origin hand out and it's like incorrect position or something.

Yeah, it's not being placed on the correct position according to camera origin.

Camera origin is also not in the correct position. Never mind then. Okay, let's go fix that. And player camera origin should be basically the same as camera 3D. Copy this. Copy origin transform position. Paste. Oh, and then you just have to reset the position of anyway. Okay. So, if this is one of the cool things if we like now we can make a new let's go make a new um item. What are we going to do? Like freaking cell phone. Okay. Um and then we create the cell phone scene. Uh cell

phone mesh. And we make us change this ESG biner box that

copy up

while our cell phone.

Trust me, this is how cell phone looks like.

Okay, it's a cell phone mesh. Save that. We make a new scene which is a 3D scene. Um

cell phone world. Add the mesh to that. And this one is going to be a handheld. Maybe I should just change this in and handheld

world object

on world. Okay, so this is not a handle. This is a freaking world object. Okay, world object. Then we add an inventory item.

do this. Add a resource

in item

uh sell phone in item.

Then the next we copy this, we make a handheld version of this.

And then we rename this to handheld. Cell phone handheld. Then we Oh, al also change the type to a camera. I'm just going to preview how it looks like. Then press it for

camera preview.

if that's correct. Don't like that one. This version of it. I like the other one. Make that um because you can see the correct orientations for the mesh. We Where are we going to place the mesh? Over there. Rotate a bit.

that I guess that's fine.

And then we save this. Okay. And then okay, we also have to add the handheld to that. So this is handheld. We add the telephone inventory item to that. Save that. We go to the world, add the inventory item to that, and then we do the do it the other way around as well. Yeah, that's just how it is. And we call this a cell phone. I'm guessing there's better ways to do this, but this is one of the ways. So in So we we're going to make this a rigid body. Going to give it a Well, first thing is we are going to change it to uh let's Okay, going to change it into a machines. We're going to make a mesh in from it, which is this. We're going to um and then we're going to get the collision shape from it, which we could just make a simplified convex is probably the best way to do. Yeah, it's probably the same thing also. Anyway, and then we just delete the mesh. We've got a we've got a convex hole, which is pretty fine. Save that. One of the better ways would be to like have boxes for each of the parts. Um, that would be like more detailed, but this is also fine. This is good enough. Um, we save this. Save this. Down, down, down. Then I'm just going to show how it changes how the player um now if we if we add the cell phone to this we can then we can swap out the um inventory item the player is holding. So cell phone inventory item go there. Crowbar inventory item go there. Also, you really wanted to um you could go to handheld and then you could add a little um animation player. We could do something like make an automate start animation. Going to auto play going to move the the the cell phone mesh up and down. So, basically we um go to the end of the animation. We save the position. We reset this saved. And then we go to the beginning of the of the thing. And then we just move it down out of view. Save it. And then just this is probably too slow. Maybe make it bit faster.

I would prefer like something like bit of a over like a a bounce. How do you do that again?

I guess there's not an easy way to do or there isn't. Someone screaming at me.

How do you do it? The bounce. Anyway, you could do this if you wanted to. I'm sure there's better ways to do it. I'll check it out later. This is not what the focus is, but you could do this, which is like the point. You could do an animation and then um

player spawn. Okay. And then we we like simulate changing inventory by giving the player a different thing. Changes the item. We move back to the crowbar and change this back, but it obviously doesn't have an animation. Okay. And then, okay, we're going to do now we're doing the inventory. Wow, it took that long. Okay, so let's just add the crowbar and the sulfan to the inventory items. Crowbar and sulfa.

So the So now also we're going to um give the player like control over the moving the in switching between the inventory item slots. Um what are you going to call it? I up I down. basically just scroll up, scroll down with a mouse wheel, and then save that. And then um we're going to detect when the player is doing a scroll up and scroll down. Might be better to do it inside a function. And then input event if event is event.name

equals Oh, that's

action. Yeah, there we go. Up

axis vector

might be better to do it here. Let's see. Input dot is act vector vector down up.

If input dot is action just pressed I up

um equipped equals Okay, let's now we're going to

equip index. This might be the bit best way to do it actually. Sorry about lying. Let's just remove this. And then when this is changed, we also update the um we update the in we update the handout.

We could also like have an have a equipped bar equip but like not allow to be set. So we get return inventory dot add paid count index also you just check if the if equipped index more than inventory do size also you keep this between range zero and infinity. Why do you say that?

If hence or less.

So we basically go here. We Say here 12

one

or greater. There we go. Then

it's return. We don't do anything there in that in that in in the instance that the equipped index is more than um the inventory size we just don't do anything. We don't return anything or we return null. That's fine. We can also say we're going to return and a hand.

Um then

equipped index should be + one + one. Wait. Okay. This is going to be equipped index + one

modulo. Um the inventory size

minus

uh oh that will work. Let's see if it work. There's one way to figure out find out if it works. We just change it and then check anyway. So cannot return value of inventory item because function held.

Yeah.

Yeah. That's that's that's what we want. Okay.

And then well see if it works. What? What's broken? 15

index.

Still broken.

Okay, save that player again like this. And we just change this. Or we can also like here we can force it. Oh, you know what? We could just do this. We could just add one minus one. Then just do this part inside equip index.

Inventory size. I'm hoping that works.

Let's go back to the player.

Waiting. my freaking computer set. Anyway, um

that's how it looks. Pretty cool. The freaking It's not Oh, it can't animate while it's in the tool script. But what do you want from me? I think that's fine for now. So, that's the player. That's the inventory. You probably want something to like pick it up as well.

Okay. You also like might want to add it to the um instead of adding it to the camera origin, we might want to add it to the camera instead. Let's do that. Would look better. Way better.

3D.

Okay. Then go back.

Now you want something to pick it up. Let's go with that

main.

Then we're going to add from the world. We're going to drop it here. Also going to drop the crowbar. Everything is freaking white. Just change this to another color.

Just a bit tired of it.

You can stand a bit out a bit more. Fine.

Okay. So, basically we are um going to do the do the item pickup. Okay. The um audio is also good. Going to do the item pickup now. So, the idea is when the player looks at a certain place, he um Okay. Well, let's just look if the audio is actually working because my fan is running in the background.
