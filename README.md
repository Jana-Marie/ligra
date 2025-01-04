# ligra

ligra is an open source image projector build from scratch and based off of flea market parts. ligra is not neccessarily a PCB-project nor a single thing, but rather an idea of how to design your own image-projection system. It is an introduction on how to create light-grafittis, how to share messages at large.

It's not strictly a Gobo, rather a way of building a system that may resemble one, but may also resemble a video projector or an abstract source of art. I have mostly used it with 2D printed stencils, usually used with so called "overhead projectors", one can of course also use metal-stencils, coloured effect-foils, 3D printed stencils and even LCDs, or really anything that may project an image. Get creative! 

<table>
  <tbody>
    <tr>
      <td>
        <img src="images/signal-2024-06-01-161329_003.jpeg"/>
      </td>
      <td>
        <img src="images/signal-2024-06-01-161329_004.jpeg"/>
      </td>
    </tr>
    <tr>
      <td colspan="2">
        <img src="images/e5e7f5f40d520a76.jpg"/>
      </td>
    </tr>
  </tbody>
</table>



This repo is very WIP and shall be expanded soon :3

## Working principle

ligra essentially functions as a backwards camera, well, most projectors do. This becomes more visible when we talk about its inner workings, it's heart and most fixed element is the lens, a Canon FD lens in our case. But instead of using it to project and image **onto** a 35mm film slide, we will project light **through** a ruffly 35mm film slide-sized, image forming medium (i.e. a 2D printed stencil). This light will enter the lens from the back, projecting an image onto a scene with the properties of the lens (focal length, aperture and focus). Given the quality of even early lenses, we can expect some sharp and crisp projections. [WIP ...]

## [Instructions](https://github.com/Jana-Marie/ligra/blob/main/instructions.md)

(Want to build one? ^ click me)

<table>
  <tbody>
    <tr>
      <td>
        <img height="300" src="images/drawing.jpg"/>
      </td>
    </tr>
  </tbody>
</table>

## [Projection-Media](https://github.com/Jana-Marie/ligra/blob/main/projection-media.md)

(You have one and need stencils? ^ click me)

<table>
  <tbody>
    <tr>
      <td>
        <img height="280" src="images/signal-2024-06-15-020726_002.jpeg"/>
      </td>
      <td>
        <img height="280" src="images/0b2d5d8d6d914120.jpg"/>
      </td>
      <td>
        <img height="280" src="images/da240891a95fc2dd.jpg"/>
      </td>
    </tr>
  </tbody>
</table>


## [Staging-Stages](https://github.com/Jana-Marie/ligra/blob/main/staging-stages.md)

(You have one and want to work on a different stage, a different way of adding media for projection? ^ click me)

<table>
  <tbody>
    <tr>
      <td>
        <img src="images/IMG_1345.jpg"/>
      </td>
      <td>
        <img src="images/Screenshot from 2025-01-04 12-20-47.png"/>
      </td>
      <td>
        <img src="images/Screenshot from 2025-01-04 12-24-28.png"/>
      </td>
    </tr>
  </tbody>
</table>

## Todo

- [ ] Add assembly instructions (65% done)
  - [ ] Refine by adding real images (15% done)
- [ ] Add 3D print instructions (5% done)
- [ ] Add BOM (0% done)
- [ ] Add drawings (60% done)
- [x] Make projection-media page more expressive
- [ ] Design more stages
- [x] Cleanup OpenSCAD file
