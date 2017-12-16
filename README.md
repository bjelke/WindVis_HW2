# HW2: Wind Visualization


This homework is done by Brighten Jelke and Khin Kyaw.<br />
For the visualization, we initially  started with number of particles = 3000, lifetime = 300, step size = 0.1, and the following data visualization is generated. 

![alt text](https://github.com/bjelke/WindVis_HW2/blob/master/WindVis/WindVisImages/Screen%20Shot%202017-12-15%20at%206.58.05%20PM.png)

Then, we double the step size having other variables constant to number of particles = 3000, lifetime = 300, step size = 0.2. Later on, we changed the step size to 0.5 while keeping the other variables constant. The following visualization is created with step size = 0.5. 

![alt text](https://github.com/bjelke/WindVis_HW2/blob/master/WindVis/WindVisImages/Screen%20Shot%202017-12-15%20at%207.13.11%20PM.png)


The step size does not change how the visualization looks. However, the bigger the step size the faster we see the wind patterns emerging because the distance moved by each particles has increased. For instance, when we change the step size to 2, we do not even see how the particles slowly changes directions as they move along the map. All the particles just move at a greater distance and start to form wind patterns with underlying data. 

As the lifetime of the particles decreases, the opacity also decreases, so that the particles with the maximum amount of life left are fully opaque and the ones with 0 are fully transparent. 
