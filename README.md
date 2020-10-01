# Roll-and-Pitch-angles-Estimator
Estimating roll and pitch angles of an aeroplane while using Giroscopy and Accelerometer measuments and the complementary filter.


El problema del acelerómetro es que es muy susceptible a vibraciones, teniendo en cuenta que esa es parte de su función, eso afecta el cálculo de la orientación produciendo mucho ruido. Y el problema del giroscopio es que al integrar la velocidad angular debido a las imprecisiones en la toma de las muestras y a las del mismo sensor se acumula un error que genera una desviación con el paso del tiempo. Sin embargo, este no es susceptible a ruido por lo que, en la práctica, se utilizan estos dos sensores en conjunto para tener mediciones más confiables, aprovechando que el acelerómetro no tiene desviación y el giroscopio no tiene ruido.


La manera más común de unir estos dos sensores para suavizar el ruido en la medición es mediante un Filtro Complementario, el cual toma los ángulos calculados en base a la medición de los dos sensores y por medio de estimaciones se obtienen valores más estables.


La ecuación para calcular el ángulo usando el filtro de complemento es:
angulo = 0.98(angulo + Wgiroscopio*dt) + 0.02(ANGacelerometro)


De esta forma el ángulo del acelerómetro está pasando por un filtro pasa bajos, amortiguando las variaciones bruscas de aceleración; y el ángulo calculado por el giroscopio tiene un filtro pasa altos teniendo gran influencia cuando hay rotaciones rápidas. Podemos probar también con otros valores diferentes a 0.98 y 0.02 pero siempre deben de sumar 1.
