# Roll-and-Pitch-angles-Estimator
Estimating roll and pitch angles of an aeroplane while using Giroscopy and Accelerometer measuments and the complementary filter.


The accelerometer problem is very susceptible to vibrations, since it is part of its function, it affects the orientation calculation producing a lot of noise. The problem with gyroscopes is that when integrating the angular velocity due to inaccuracies in the taking of changes and the sensorism accumulates an error that generates a deviation with the passage of time. However, it is not susceptible to noise because, in practice, these sensors are used together to have more reliable measurements, approving that the accelerometer does not drift and the gyroscope has no noise.


The most common way to connect these sensors to smooth noise in measurements is by means of a Complementary Filter, which takes the angles calculated based on the measurement of the sensors and by estimating if stable values ​​are obtained.


The way to calculate the angle using the complement filter is:

  angulo = 0.98(angulo + Wgiroscopio*dt) + 0.02(ANGacelerometro)


In this way, the angle of the accelerometer is passing through a low pass filter, damping sudden variations in acceleration; and the angle calculated by the gyroscope has a high pass filter having great influence when there are fast rotations. We can also try other values ​​other than 0.98 and 0.02 but they must always add 1.
