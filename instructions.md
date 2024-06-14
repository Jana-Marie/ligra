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
  * [Stencil](#Stencil)
  * [Light-Source](#light-source)
    * [PAR-Spot](#par-spot)
    * [Flashlight](#flashlight)
  * [Tripod-Mount](#tripod-mount)
  * [Aluminium-Extrusions](#aluminium-extrusions)
  * [Assembly](#assembly)

## Preface

This guide assumes that you are building the same ligra as I did, I will try to make it clear, when something is either optional or specific to my hardware/your hardware. All in all I want to show you, how you can design your own projector, Gobo, light-graffiti, art-, whatever-light-machine. I want to show you, how you can bring a lens, a light source and something image forming together to crate something that allows you to be creative.

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


 
### Stencil

### Light-Source

#### PAR-Spot

#### Flashlight 

### Tripod-Mount

### Aluminium-Extrusions

### Assembly