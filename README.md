# OGRenMutator
A mutator package for Renegade-X that is designed to replicate the gameplay and feel of original Renegade.

## What we changed

* Balancing: nerf infantry a bit, nerf flame tanks, make arties slower (or remove shift all together) , etc...
* Lock the MRLS turret from turning. It used to be very helpful around corners and hill.
* Remove refill timeout
* Remove obelisk's long charge. When it stops sounding "randy, know wot I mean?" it wouldn't hold a charge anymore and doesn't insta-zap the player.
* Remove inaccuracy from shooting off the hip, and shorten the scope distance. Right now close combat with a sniper rifle is quite hard.
* Remove emp, smoke, nades, airstrikes, and other mechanics that weren't present in old games

## How to install

Download OGRenMutator.u and place in your UDKGame\CookedPC\ directory.
```
Example directory: C:\Program Files (x86)\Renegade X\UDKGame\CookedPC\
```

## How to use

Add ?Game=OGRenMutator.OG_Game?Mutatorss=OGRenMutator.OG_Mutator on the startup line of server.
```
Example startup: start Binaries\Win32\UDK.exe server CNC-Field?Game=OGRenMutator.OG_Game?Mutator=OGRenMutator.OG_Mutator?AdminPassword=admin -debug -SCRIPTSTACKONWARNINGS -UTRACE -NOSTEAM

```

## Authors

* **John Doe** - *Author & Idea Master* - [vlatkozelka](https://github.com/vlatkozelka)
* **Sarah Evans** - *Co-Author* - [BubbleTea](https://github.com/sevans045)

See also the list of [contributors](https://github.com/sevans045/OGRenMutator/contributors) who participated in this project.

## License

This project is licensed under the GNU GPL v2 license - see the [LICENSE.md](https://github.com/sevans045/OGRenMutator/blob/master/LICENSE) file for details

## Acknowledgments

* Hat tip to anyone whose code was used
* Inspiration
* etc

