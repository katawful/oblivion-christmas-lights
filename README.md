# Running Christmas Lights Using Oblivion
**IF YOU'RE LOOKING FOR CSV FILES THEY'RE IN THE OUTPUT FOLDER**
**IF YOU'RE MATT PARKER, YOU ONLY NEED THE** `for-matt.csv` **FILE**

## Running LED Lights at All
In the grand scheme of the world, having a computing device turn on an LED programmatically is perhaps one of the simplest.
All that is needed is a device that can output the necessary voltages and process some sort of data that manipulates the lights how we like.
However, anyone that has worked with LED lighting strips knows that the index of how they're laid out may not line up with how they are hung in the real world.
Particularly with Christmas tree lights.
After all, wouldn't it be better if our lighting effects were based on the position in 3D space?

## Matt Parker and the GIFT Coordinate System
Matt Parker of Stand-up Maths has a project where he set up a coordinate system of Christmas tree lights that allow manipulation of them in 3D space.
The format, GIFT, gives the user a mapping of each LED light within the LED strip when laid upon a 3D object (i.e. a Christmas tree).
As it is a coordinate system and not worked out during runtime, the data is stored as strings within a CSV file.

## Turing Completeness
Alan Turing when formulating the theory for modern computers came up with the idea of what such computers needed to achieve.
While there's a lot to this system, the idea is essentially that *anything* can be computable with a machine in these conditions, even if it takes until the death of the universe to achieve.
Thus a Turing complete programming language is one that can compute anything, even if there isn't a specific library for what is desired for computing.

## The Elder Scrolls IV: Oblivion
Oblivion is a video game that features an internal scripting languages to implement game features.
While originally rudimentary as designed by its developers, the community has expanded its features over the years.
It features many of the modern luxuries of languages known by many, such as string functions, arrays, definable functions, variable storage, etc...
Truly it is Turing complete.
It also allows us to export strings of text arbitrarily.

Thus the only 2 requirements of the GIFT coordinate system are met: a Turing complete language and a way to export strings.
The only challenge is implementing it.

# Using
Due to licensing shenanigans, the actual Oblivion plugin is available on a different site.
This repo just contains my code.
In addition you need a GIFT format for your LED strip, I used [Matt's](https://github.com/standupmaths/xmastree2021/blob/main/coords_2021.csv).
Run the shell script in `bindings/` with the path of the CSV to make it into an Oblivion format.
Note, currently it expects a Windows file format.

You need [ConScribe](https://www.nexusmods.com/oblivion/mods/26510).
After installing, put the modified log file into `Oblivion\Data\ConScribe Logs\Per-Mods\`, naming it `coords_2021.log` until I dehardcode this value.
Then install the plugin provide [here](https://www.nexusmods.com/oblivion/mods/51660/), and `coc ChristmasLights` when in-game and hit the button.

# Performance
With the power of a single thread in a purely interpreted language, the Rainbow effect script takes about 2 minutes to run on a 4790k @ 4.4GHz.

# Further Details

## Color manipulation
RGB is a programmatic color space, only meant to mimic how lights work.
The human eye is much different.
Reducing each value of R, G, and B by 10% will have radical effects to the perception of color by our eyes.
A different color system is needed if one wants more accurate colors.

[HSLuv](https://www.hsluv.org/) is a color space designed to mimic how human eyes respond to color.
It's 3 components are hue (the actual color), saturation (how much of that color), and luminance (how bright that color is).
Therefore I needed to implement this, at least in part, in order to more cleanly and easily manipulate colors.

## Input
Input was weird.
Oblivion has an extremely strict typing system.
The only thing that can be converted implicitly is floats <-> ints, everything else must pass through a function.
Variables are also only able to be declared once within scope, they are essentially `const` containers.
The coordinates provided by Matt thus had to be input as a string, then split up into more strings, then converted to a float.
This might seem simple in most languages, but isn't as much here.

1. The split function requires delimiters on both sides of the thing being delimited (i.e. `,this,is,delimited,` but `this,is,not`). The CSV file must be modified to reflect this.
2. As we can't change variable types, we must put this in its own array for storage.
3. However, for some reason again, the CSV file has a [BOM](https://en.wikipedia.org/wiki/Byte_order_mark) character which cannot be parsed. The first line must be singled out and modified again.
4. Then we can store the coordinates into their own floats for my use.

## Math
Highest level math course I took was calculus 2 and pchem, both of which are not enough to generate the effects I would have liked programmatically.
While you could generate anything that can be done with pure math, or with input strings, alas I am done.
The essentials are here for anyone wishing to expand upon this, but I cannot.
I attempted to rotate a rainbow around the Z axis as it moves up, idk what I ended up making

## License
GPL v3
