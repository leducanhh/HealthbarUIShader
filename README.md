# HealthbarUIShader
Learn to create Healthbar UI by yourself, independent of Unity UI
## Introduction
Hi everyone, after Unity 5.x, it's not difficult to make a **HEALTHBAR** with Unity GUI. 

Something likes this **(fill horizontal)**:

![fill_horizontal](https://user-images.githubusercontent.com/19847972/37563106-231d6a4e-2aac-11e8-8965-72d159a60657.gif)

or this **(fill radial 360)**:

![fill_radial_360](https://user-images.githubusercontent.com/19847972/37563148-e1495050-2aac-11e8-9081-23db0ff76744.gif)

But... what if we need healthbar which has **unusual shape**, what method we have to choose???

![unusual_hp_bar](https://user-images.githubusercontent.com/19847972/37563206-3b2cd2b2-2aae-11e8-9861-8832d0acbe60.png)

Okay, if you've already figured it out the way to solve that. So i have nothing to show you more ^^. 

But if you don't? Let's find out together!!!

## How it works?
To understand this, I think you need to know the basic knowledge of shader. 

And to do it, we need 2 textures. I will take example with **Healthbar - Radial 360**:

### Preparation:
1. **First** is the actual RGB texture, what you want to show on your game:

![texture_RGB](https://user-images.githubusercontent.com/19847972/37563537-913770de-2ab5-11e8-96b6-364443686a87.png)

2. **Second** is the alpha texture (or black & white texture). This texture will decide **HOW** your healthbar is gonna work. You can find this texture on internet or create it by photoshop (tutorial ![here](https://www.photoshopessentials.com/basics/how-to-draw-gradients-with-the-gradient-tool-in-photoshop/)):

![texture_alpha](https://user-images.githubusercontent.com/19847972/37563538-9343718e-2ab5-11e8-907a-73512b2c89e3.png)

3. And we need a **shader script** to manipulate the mechanism.

### Result:

![result](https://user-images.githubusercontent.com/19847972/37563524-1fcea8ea-2ab5-11e8-8581-5ff1a17f0680.gif)

### Mechanism:
1. At first, we need to know: *What is our purpose?*
  - Our purpose is when player's HP is reducing -> HP bar also reduces.
  - In mathematics, we define: HP reduces from 1 to 0.
2. After that, we need to understand: *How the second texture manipulate the mechanism?*:
  - In above example, we use **B&W texture**. We could see: the color interpolate from *White* to *Black*, also mean from *RGB(1, 1, 1)* to *RGB(0, 0, 0)*. So the first texture will be rendered that depended on the **second texture's RGB color channel**.
  - What happen if we use **Alpha texture**? It depended on the **second texture's Alpha color channel**.
3. And we applied that calculations to our **shader script**
  - **B&W texture**: *if (HP percent != 1) && (second texture's __red__ channel >= HP percent) -> we render that pixel of first texture with alpha = 0*
  
![b w](https://user-images.githubusercontent.com/19847972/37563800-384cff92-2abb-11e8-803b-0059a9a08a96.JPG)
  - **Alpha texture**: *if (HP percent != 1) && (second texture's __alpha__ channel >= HP percent) -> we render that pixel of first texture with alpha = 0*
  
![alpha](https://user-images.githubusercontent.com/19847972/37563799-36b4e4b0-2abb-11e8-9b5e-fdea107691f3.JPG)

