# HW2: Wind Visualization


This homework is done by Brighten Jelke and Khin Kyaw.

For the wind visualization, we experimented with changing the number and lifetime of the generated particles as well as the step size for calculating movement along the vector. As the lifetime of the particles decreases, we chose to decrease the opacity as well, so that the particles with the maximum amount of life left are fully opaque and the ones with 0 are fully transparent. 

**Lifetime and Number of Particles**

Increasing the number of particles on the screen increases the size of the patterns that emerge because showing more particles makes the lines appear to be more continuous. Any number above 10000, however, is slightly overwhelming to look at, and it becomes much more difficult to see the direction of movement. A similar effect occurs when the lifetime of the particles is significantly increased, because after a certain period of time, no new movement appears to happen at all. If the lifetime is smaller than 100, there is not enough time for patterns to emerge and the particles will just appear to be moving about randomly.

**Step Size**

We started with the number of particles = 3000, lifetime = 300, and step size = 0.1.
With these parameters, the following data visualization is generated:

![alt text](https://github.com/bjelke/WindVis_HW2/blob/master/WindVis/WindVisImages/Screen%20Shot%202017-12-15%20at%206.58.05%20PM.png)

Then, we doubled the step size, keeping the other variables constant. The number of particles = 3000, lifetime = 300, step size = 0.2. This was not as dramatic as increasing the step size to 0.5, so the following visualization is created with step size = 0.5: 

![alt text](https://github.com/bjelke/WindVis_HW2/blob/master/WindVis/WindVisImages/Screen%20Shot%202017-12-15%20at%207.13.11%20PM.png)


Changing the step size does not change the path that the particles take. However, the bigger the step size the faster we see the wind patterns emerging because the distance moved by each particles has increased. For instance, when we change the step size to 2, we do not even see how the particles slowly changes directions as they move along the map. All the particles move a greater distance and form clumps in certain areas where the vectors converge on each other, and little can be seen in other regions.

By contrast, decreasing the step size to 0.5 gives the impression of very slow movement with little change in location. It becomes harder to pick out the wind patterns because of the short distance the particles are moving. 0.1 appears to be the optimal step size to easily identify trends while retaining the context of surrounding areas.
