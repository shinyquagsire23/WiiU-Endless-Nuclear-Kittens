# Wii U Endless Nuclear Kittens

![In the year 2487 kittens are still cute and cuddly. Therefore they must die.](http://i.imgur.com/74b9Oep.png)

## About

This is a port of the game Endless Nuclear Kittens as released for Mojang's Humble Mojam Bundle to the Wii U. This was done by porting the game from Java to the D language while also porting it to the Wii U Toolkit (WUT).

## Compiling

To compile, first download GDC for devKitPPC from [here](ftp://ftp.gdcproject.org/binaries/devkitPPC/r27/), then clone the minlibd submodule and compile it. Once minlibd is compiled, the main repo can be compiled with the Makefile into an RPX.

## Notes

- Sound is not implemented yet.
- Multiplayer is partially implemented, but needs alternate controllers implemented and a screen to handle assigning controllers to players, along with selecting player colors.
- There may still be memory leaks from porting to Dlang from Java.
