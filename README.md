# Emergency Vehicle Lighting
A new approach to vehicle lighting in FiveM
#### Discord: https://discord.gg/NGaWZGB
## Script Specific

### Natives:
  - (Secondary) https://runtime.fivem.net/doc/natives/#_0x81592BE4E3878728
  ```SetVehicleInteriorColour()```
  - (Dashboard) https://runtime.fivem.net/doc/natives/#_0x7D1464D472D32136
  ```SetVehicleInteriorColour()```
  
 ### Colors
 - 16 = Red (Secondary)
 - 28 = Red (Dashboard)

 - 53 = Blue (Secondary)
 - 70 = Blue (Dashboard)
  

## General Knowledge
### How EVL works:
 - **Each “light-head” is a white texture**
 
 - **Every light is a mod on a car (IE: Front bumper)**
 
 - **There is a blank model used to switch out the light to**
 
 - **The modkit is setup as a daytime running light (External ID 0)**
 - **Then (based upon setup) you set the each light to be a “mod color” like how you can change the color of a spoiler and not the car
  So in a sense instead of turning extras on and off, you are changing a modkit from ID 1 (light texture aka on) to ID 2 (blank model aka off)**

The light textures are white so you can use native GTA color switching to change the color of the light head on the fly

They are also daytime running lights so they look bright from a distance naturally.

### EVL Advantages:

 - **Everything that ELS has**
 - **36 light heads possible (50 mod types, 14 are engine and wheels and stuff)**
 - **No issues with cars fixing or the door glitch (yea no damage issues)**
 - **Look good from a distance**
 - **Changing light colors on the fly and natively**
 - **Still just as easy for modelers to make (also easy to convert existing cars)**

### EVL Disadvantages:

 - **Still only 36 light heads possible (its still a lot)**
 - **Would not be compatible with ELS cars (still very easy to convert)**
