# Instructions

This document shall serve as a comprehenive assembly-manual. Feel free to diverge at any point to build the ligra you want.

## Table of Contents

* [Preface](#preface)
* [Planning](#planning)
* [BOM](#bom)
* [3D-Prints](#3d-prints)
* [Required Tools](#required-tools)
* [Detailed Instructions](#detailed-instructions)
  * [Lens](#lens)
  * [Stage](#Stage)
  * [Light-Source](#light-source)
    * [PAR-Spot](#par-spot)
    * [Flashlight](#flashlight)
  * [Tripod-Mount](#tripod-mount)
  * [Frame](#frame)
  * [Assembly](#assembly)

## Preface

This guide assumes that you are building the same ligra as I did, I will try to make it clear, when something is either optional or specific to my hardware/your hardware. All in all I want to show you, how you can design your own projector, Gobo, light-graffiti, art-, whatever-light-machine. I want to show you, how you can bring a lens, a light source and something image forming together to crate something that allows you to be creative.

Each ligra consists of various parts that all invidially fulfill a purpose, all working together to make ligra what it is. Each part can be individually modified, build to purpose or replaced. I tried to reflect this by showing how to build each part, but also how to assemble all of them into ligra. Feel free to replace or modify any part that you need to have changed. One ligra basically consists of the frame, the light source, the stage (a stencil in my case), a tripod mount and the lens. You can see each of these as an assembly to be changed internally or as a whole, however, they all fulfill a purpose and cannot simply be removed.

## Planning

Given that this is rather an instruction on how to design and build various projectors instead of a speicific one, you should think about which tools you have at your disposal, what your targeted usecase may be and what materials you have and can work with. Before starting, read all the instructions and plan your ligra accordingly.

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-14 23-44-12.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-14 23-45-36.png"/>
      </td>
  </tr>
  <tr>
      <td colspan="2">
        <img src="/images/Screenshot from 2024-06-14 23-45-00.png"/>
      </td>
    </tr>
  </tbody>
</table>

Please consult the OpenSCAD script 'ligra.scad' for this phase aswell.

## BOM

For one ligra, you will need ruffly the following parts.
***
* 1 **Lens** (Canon FD works great here)
  * Low f-number is preferable (\<f4.0 ideally)
  * Variable focal legth preferred ([70-210mm](https://www.canonclassics.com/canon-nfd-70-210mm-f4/10-119/) works great for me, [28-85mm](https://volkergilbertphoto.com/canon-zoom-lens-fd-28-85-mm-f-4/) is nice for smaller rooms)
  * Full manual control is a must
  * Generally, the higher the focal legth, the farther away you can project something
* A matching (back-)lenscap
* A set of 3D prints to hold the lens in place ([see 3D prints](#3d-prints))
  * 1x [FD-cap to cage-mount](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/fd_back_conn.stl)
  * 1x Supporting FD-front-cage
    * [e.g. for 70-210mm](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/fd_frontcage_70_210.stl)
    * [e.g. for 28-85mm](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/fd_frontcage_28_80.stl)
***
* A **light source**
  * Can be a flashlight, a LED with a lens or anything that outputs a narrow and uniform (10-15°) beam of light
  * I use [a cheap 3W PAR spotlight](https://www.ebay.de/itm/314966001859) (yes it says 30W, but it consumes about 3W)
* A set of 3D prints to hold the light source in place ([see 3D prints](#3d-prints))
***
* 4x [20x20mm **aluminium extrusions**](https://www.motedis.com/en/Profile-20x20-B-type-slot-6)
  * 400mm length works great for most lenses
  * 300mm length works for 28-85mm lenses, but is a tight fit
* 16x nuts + bolts for said extrusions (likely M4 or M5)
***
* Optionally a set of 3D prints to hold the **stencil** in place ([see 3D prints](#3d-prints))
  * 1x [Stencil stage](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/stencil_stage.stl)
  * 1x [Stencil rotor](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/stencil_rotor.stl)
  * 1x [Stencil counter-top](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/stencil_counter_top.stl)
  * A whole bunch of [Stencil-cages]() [FIXME]
  * A whole bunch of 3mm diameter, 2mm height disc-magnets
  * 4x ballbearings with 4mm inner diameter, 9mm outer diameter and 3-4mm height
  * Some M3x16 screws
***
* Optionally [1 **front-PCB** as blind](https://github.com/Jana-Marie/ligra/tree/main/ligra_front)
  * 4x M5x16mm screws
  * 4x M5 washer
  * 4x [3D printed endcaps](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/end_cap.stl)
***
* Optionally [1 **back-PCB** to drive the light source](https://github.com/Jana-Marie/ligra/tree/main/ligra_back)
  * 4x M5x16mm screws
  * 4x [3D printed endcaps](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/end_cap.stl)
  * 4x [3D printed feet](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/foot.stl)
***
* Optionally a [3D print](https://github.com/Jana-Marie/ligra/blob/main/CAD/stls/tripod_plate.stl) for a **tripod** to attach to
  * 4x sets of nuts + bolts for the extrusions
  * 1x [¼" thread insert](https://www.amazon.de/-/en/ruthex-Threaded-Insert-Bushings-Printing/dp/B09MTS6ZZQ/ref=sr_1_16)
* Optionally a tripod
***

## 3D prints

[WIP]

Plesae print all 3D printed parts with the same technologie and materials to avoid missalingment due to material shrinkage.

## Required Tools

* Hex-drivers (or whichever screwhead you choose)
* M3, M5 tapping kit
* A set of drills
* 3D printer, FDM, SLA or SLS will do
* Exactor knife (for cleaning up 3D prints)
* Optionally a 2D printer for printing out stencils
  * See [Projection-Media](https://github.com/Jana-Marie/ligra/blob/main/projection-media.md)

## Detailed Instructions

With ligra, the aluminium extrusion will make up the whole frame, holding everything in place. However, all four extrusions are not connected to each other, except through all parts that they are supposed to hold. This means that we don't need extra parts that will make up the frame, but it also means that all parts within the frame, will become part of its structure. It is important, especially for the lens- and lamp-mount to be sturdy. In terms of assembly, this means that we need to prepare a few parts first, before putting them together in one go.

### Lens

While the lens can be seen as the heart of ligra, it actually is one of the simplest parts/steps here. Mostly because it already is a finished part that we don't really need to modify. We will just need to build a mount to fix it to the frame. Not only do we need a mount, this mount will be inegral to ligras structure and sturdyness, so let's keep it thicc and easy.

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-14 23-39-46.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-14 23-40-12.png"/>
      </td>
    </tr>
  </tbody>
</table>

Our lensmount will actually be made out of two 3D printed and one pre-fabricated part. The latter is a lenscap that we need to buy, pretty much any lenscap should do, I got mine from amazon. One of the 3D printed parts will be joined with the lenscap, firmly attaching lens and frame to each other. The second 3D printed part will be a more loose support of the lenses front opening, we don't want the full levering force of the lens being exorted into the rear mount. This mount however, cannot be fully fixed to the lens as it moves and turns during focus and focal-length change.

### Stage

The stage ist probably the part where you can be the most creative, as already teased there are just so many ways of intercepting and transforming your light source. For more ideas, check out the [Projection-Media](https://github.com/Jana-Marie/ligra/blob/main/projection-media.md) page.

We will focus here on a, optionally motorized rotating stage, that hosts 2D laser-printed stencils. With stencil I mean foil that has been printed on. Initially I worked on 3-point rotary stage, which would allow for trapez correction. That idea got pushed to the back, to make room for a simpler stage, that is easier to iterate on. Eventually I will return to developing more stages. Check out the [Staging-Stages](https://github.com/Jana-Marie/ligra/blob/main/staging-stages.md) page.

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-14 23-38-24.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-14 23-38-51.png"/>
      </td>
    </tr>
  </tbody>
</table>

The design I came up with is illustrated above. It is for the most part 3D printed, making production quite accessible to me. The light pink, big outer part will be screwed to the frame.

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-42-35.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-43-40.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-42-41.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-44-55.png"/>
      </td>
      <td>
        <img src="/images/IMG_1345.jpg"/>
      </td>
    </tr>
  </tbody>
</table>

It hosts 4 ball-bearings with an inner diameter of 4mm, an outer diameter of 9mm and a height of ~4mm. They will be pushed into place altogether with dark-pink ring into their respective slots. Before you do that, you should put 9 magnets with a size of 3mm diameter and 2mm height into the 9 larger slots of the inner ring. It's important that all magnets face the same direction! Since it is a tight fit, they all should stay in place, you can of course fill all slots up with some UV-cure resin or glue. Now you can gently push the ring and all four ball-bearings into place. Afterwards, turn over the assembly and screw the big yellow gear into the ring. You can ignore the small gear for now, it can be mounted to a motor and used to automatically turn the stencil this stage will host. If you don't need this, skip it, the big gear will still be handy for aligning the stencil manually

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-58-11.png"/>
      </td>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-59-12.png"/>
      </td>
      <td>
        <img src="/images/signal-2024-06-15-020726_002.jpeg"/>
      </td>
    </tr>
  </tbody>
</table>

Next up, you can print a whole bunch of these stencil frames. Each will clamp and hold one stencil, each will also host 3 magnets that allow the holder to snap to the stage. This allows for easy stencil preparation and exchange, just remove the old frame from the stage by hand, it will come right off and put a new one in place, it will gently snap to it. You can now go ahead and print stencils on foil, cut them and puit each into its own holder. Add the magnets in a similar fashion to what you did before, make sure that they all are aligned with your stage.

Your finished stage should look similiar to this. (Please ignore the frame in the last two images for now)

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-15 01-43-00.png"/>
      </td>
      <td>
        <img src="/images/signal-2024-06-14-204829_005.jpeg"/>
      </td>
      <td>
        <img src="/images/signal-2024-06-14-204829_007.jpeg"/>
      </td>
    </tr>
  </tbody>
</table>

### Light-Source

#### PAR-Spot

#### Flashlight

In my earlier tests I used a flashlight as light-source and honestly I cannot recommend that enough if you are planning on testing the optical path. It's much easier to handle, easier to adapt and can freely held by hand at first. It helped me in establishing this project. I don't use it anymore, I've gotten myself a better light-source, still, I would like to quickly illuminate (heh!) its assembly.

<table>
  <tbody>
    <tr>
      <td>
        <img src="/images/Screenshot from 2024-06-15 02-27-37.png"/>
      </td>
      <td>
        <img src="/images/signal-2024-06-14-210620_004.jpeg"/>
      </td>
      <td>
        <img src="/images/signal-2024-06-14-210620_005.jpeg"/>
      </td>
      <td>
        <img src="/images/signal-2024-06-14-210620_007.jpeg"/>
      </td>
    </tr>
  </tbody>
</table>

It's quite simple and I don't think I need to explain a lot here, this LEDLenser flashlight is pressed into this simple block with four hair-ties and a counter-ring. This assembly is then asserted into ligra from the back. You can see on the last image, that this version is somewhat old already, based on the trivial, fixed stencil mount visible. 

### Tripod-Mount

### Frame

### Assembly