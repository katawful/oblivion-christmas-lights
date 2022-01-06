# Running Christmas Lights Using Oblivion
**IF YOU'RE LOOKING FOR CSV FILES THEY'RE IN THE OUTPUT FOLDER**

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

## License
GPL v3
