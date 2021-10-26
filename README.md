# Rice Crop Image Segmentation Using Artificial Intelligence Techniques
## Edgar Steven Correa Pinzón, Héctor Javier Rojas Silva, Juan Esteban Sacristan Vargas, Deimer De Jesus Ballesteros Padilla, Ronald Fernando Rodriguez Barbosa and Manuel Fernando Párraga Meneses
### School of Engineering, Pontificia Universidad Javeriana, Cra. 7No. 40-62, Bogota, 110231, Bogota, Colombia.


# Abstract
Diferentes técnicas de inteligencia artificial son utilizadas actualmente en la solución de problemas complejos que se presentan en múltiples áreas del conocimiento.  
Existen métodos clásicos y otros nuevos con el enfoque fuzzy-neuro-genético, los cuales se han desarrollado con gran velocidad en las últimas décadas debido a sus buenos resultados, flexibilidad y adaptabilidad. 
Capturar información de cultivos mediante imágenes se ha convertido en una manera no invasiva de modelar el rendimiento de las parcelas.   
Esto hace posible aplicar técnicas de inteligencia artificial para caracterizar la informacion capturada principalmente por vehiculos aéreos no tripulados y por estructuras satelitales.  
Este articulo aborda la segmentación de imágenes como herramienta para caracterizar cultivos de arroz. Se presenta un enfoque orientado a los algoritmos genéticos, en particular son tratados los enfoques de Michigan y Pittsburg. Se evalúa el desempeño de cada uno mediante métricas de desempeño.

**Keywords**:Rice Crop, Image Segmentation, Artificial Neural Networks,fuzzy logic, genetic algorithms.  

# 1  Introduction  

Con  el  avance  tecnológico  encuanto  a  mayores  capacidades  de  computo,  la inteligencia  artificial  se  ha  posicionado  como  una  poderosa  herramienta  en muchos  procesos  de  la  cotidianidad.  Se  ha  llegado  a  un  punto  en  el  cual  es imposible imaginarse el mundo sin estos desarrollos tecnológicos propios de los sistemas informáticos [1].  
Estos sistemas inteligentes presentan el potencial de abordar problemáticas de  talla  mundial  como  la  escasez  y  la  calidad  de  los  recursos  alimenticios. En  este  contexto,  el  arroz  es  un  deseable  caso  de  estudio,  dado  que  permitiria  mitigar  su  impacto  y  aportar  a  la  solución.  El  avance  tecnologico relacionado con vehiculos a ́ereos no tripulados (UAV) y estructuras satelitales han permitido capturar información de cultivo. Esta configuración hace posible  aplicar  técnicas  de  inteligencia  artificial  para  modelar  el  rendimiento  de muchos cultivos.  
El enfoque de modelamiento de parcelas se fundamenta en el procesamiento de imagenes. El objetivo se formaliza en la segmentación de imágenes. En esta area de investigacion, los algoritmos inevitablemente cometen errores dependiendo de la robustez que aborden, esto ocasiona que disminuya el desempeño de  los  sistemas  que  poseen  la  capacidad  de  recuperación de imágenes y reconocimiento de objetos [2].  
En  este  mismo  sentido,  el problema  de  segmentacion  de  imágenes  es  unenfoque consolidado en el  ́area de investigación de procesamiento de imágenes y presenta gran cantidad de aplicaciones. Existen diferentes enfoques para el análisis en la segmentación de imágenes. El enfoque clásico depende de técnicas de filtrado y aproximaciones estadísticas [1].    
Los métodos en este enfoque trabajan técnicas de umbralización, detección de  bordes  o  técnicas  basadas  en  los  límites,  técnicas  basadas  en  la  región, técnicas morfológicas, corte normalizado, un enfoque teórico de gráficos, enfoques  k-means,  etc[1,  3,  4].  Los  enfoques  no  clásicos  se  fundamentan  en  elparadigma fuzzy-neuro-genético o sus variantes y aportan características para aplicaciones en tiempo real [1].  
Con  relación  a  las  generalidades  del  algoritmo  genético  (AG),  se  puede inferir  que  es  capaz  de  superar  muchos  de  los  defectos  de  otras  técnicas  de optimización como las técnicas exhaustivas, las técnicas basadas en el cálculo, el  conocimiento  parcial  (hill  climbing,  beam  search,  best  first,  branch  and bound, programación dinámica, técnicas basadas en el conocimiento (sistemas de reglas de producción, métodos heurísticos)[5]. Debido a la generalidad del proceso genético, son independientes de la técnica de segmentación utilizada, requiriendo   ́unicamente  una  medida  de  rendimiento,  que  se  denomina  calidad  de  segmentación,  para  cualquier  combinación  de  parámetros  dada.  Los AG se han utilizado para resolver varios problemas de visión por ordenador, como la segmentación de imágenes[5, 6], la selección de características[7], la comparación  de  imágenes  y  el  reconocimiento  de  objetos[7].  Recientemente, los  investigadores  han  estudiado  la  aplicación  de  los  algoritmos  genéticos  al problema  de  la  segmentación  de  imágenes.  Quizás  el  trabajo  más  extenso  y detallado sobre los AGs dentro de la segmentaci ́on de im ́agenes es el de Bhanuy Lee [6].  


# 2 Métodos  

Esta  sección  aborda  el  problema  de  segmentación  de  imágenes  a  través  de cuatro  técnicas  fundamentadas  en  el   ́area  de  investigacion de  la  inteligencia artificial.  La  primera  se  desarrolla  entorno  a  las  redes  neuronales.  Se  desarrolla un experimento con el objetivo de evaluar la influencia de la topología, parámetros y algoritmos de entrenamiento de la red neuronal en la tarea de segmentar imágenes de cultivos de arroz. La segunda integra la utilización de un clasificador bajo el enfoque Michigan. Se conforman los individuos o posibles  soluciones  a  través  de  los  cromosomas  representados  por  los  colores  y estos  se  seleccionan,  cruzan  y  mutan  en  aras  de  definir  los  mas  aptos  como soluciones  que  convergen  a  la  clasificación  y  segmentación  de  los  pixeles  de las imágenes. La tercera desarrolla una estructura difusa en la tarea de segmentación de imágenes y finalmente la cuarta técnica se fundamenta en el  ́area de aprendizaje de maquina.

## 2.1  UAV and rice crop

Los vehículos a ́ereos no tripulados (UAV) se han posicionado en el estado del arte como una herramienta para adquirir información del cultivo. El potencial se debe a que integran cámaras con mejor resolución y mejores capacidades de computo y almacenamiento. En este contexto, el insumo de esta investigación son las imágenes capturadas en campo. Las imagenes contiene información del espectro visible e información multiespectral del infrarrojo cercano y medio. El conjunto de datos contiene 201.440 muestras, y es tomado de la investigación[8]. En la Fig. 1 se observa la forma en la que el UAV captura la imformacion del cultivo. La informacion se compone de cuatro canales a diferentes longitudesde onda, este conjunto conforma el conocimiento del cultivo.

## 2.2 Algoritmos Geneticos

Los Algorítmos genéticos son mecanismos de búsqueda de propósito general que utilizan principios inspirados en las poblaciones genéticas naturales para evolucionar las soluciones a los problemas [9, 10]. En los algorítmos genéticos la idea básica es mantener una población de cromosomas, que representan soluciones candidatas al problema concreto que evolucionan con el tiempo a través de un proceso de competencia y variación controlada. El algoritmo comienza con una población de cromosomas generados aleatoriamente, y avanza hacia  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig1.png)  

mejores cromosomas aplicando operadores genéticos modelados en los procesos genéticos que ocurren en la naturaleza. La población sufre una evolución en  forma  de  selección  natural.  Sobre  la  base  de  las  evaluaciones,  se  forma una nueva población de cromosomas, utilizando un mecanismo de selección y operadores genéticos específicos como el cruce y la mutación [11]. Para cada problema que hay que resolver, hay que diseñar una función de evaluación ofitness (f). Dado un cromosoma concreto, una posible solución, la función de aptitud devuelve una  ́unica aptitud numérica, que se supone proporcional a la utilidad o adaptación de la solución representada por ese cromosoma[9].

## 2.3 Sistemas clasificadores de aprendizaje  

Todos los sistemas clasificadores de aprendizaje (SCL) tienen en común que son sistemas basados en reglas capaces de construir automáticamente el conjunto de reglas que manipulan. Inventados en 1975 por John Holland [12], estos sistemas  son,  paradójicamente,  menos  famosos  que  los  algoritmos  genéticos(AG),  a  pesar  de  que  los  AG  eran  originalmente  una  subparte  de  los  LCS. Sin  embargo,  durante  los   ́ultimos  años  la  investigacón  sobre  las  ECV  ha adquirido mayor visibilidad, lo que ha dado lugar a la oportunidad de publicar una presentación general para una amplia audiencia científica [13]. En la *figura 2* se puede apreciar la jerarquía de campos que fundamentan el concepto de aprendizaje de sistemas de clasificación. Un LCS está compuesto por una población de clasificadores. Cada clasificador es un triple c, a, p que contiene una parte [Condición], una parte [Acción] y una estimación de la recompensa acumulada esperada que el agente puede obtener si dispara este clasificador. Formalmente, la parte [Condición] de los clasificadores es una lista de pruebas. Hay tantas pruebas como atributos en la descripción del problema, y cada prueba se aplica a un atributo específico. En el caso más común en el que la prueba especifica un valor que debe tomar un atributo para que la [Condición] coincida, la prueba está representada sólo  

![Image text](https://https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig2.png)  

por este valor. Existe una prueba particular llamada ”no importa”, que significa que la [Condición] del clasificador coincidirá con cualquiera que sea elvalor del atributo correspondiente. A un nivel más global, la parte [Condición] de un clasificador coincide si todas sus pruebas se mantienen en la situación actual [13].  

## 2.4  Clasificadores de Michichigan y Pittsburgh

Los  sistemas  clasificadores  son  sistemas  basados  en  reglas  que  combinan  elaprendizaje  por  diferencias  temporales  o  el  aprendizaje  supervisado  con  un algoritmo genético para resolver problemas de clasificación y aprendizaje por refuerzo. Hay dos tipos de sistemas clasificadores: Los sistemas clasificadoresde Michigan, que están diseñados para el aprendizaje en línea, pero también pueden abordar problemas fuera de lınea; y los sistemas clasificadores de Pittsburgh, que sólo pueden aplicarse al aprendizaje fuera de línea. En los sistemas clasificadores de Michigan [14, 15], el aprendizaje se ve como un proceso de adaptación  en  línea  a  un  entorno  desconocido  que  representa  el  problema y proporciona retroalimentación en términos de una recompensa numérica. Los sistemas clasificadores de Michigan mantienen una   ́unica solución candidata que consiste en un conjunto de reglas, o una población de clasificadores. Los sistemas de Michigan aplican el aprendizaje por diferencia temporal para distribuir  la  recompensa  entrante  entre  los  clasificadores  que  son  responsables de ella; y un algoritmo genético para seleccionar, recombinar y mutar clasificadores individuales con el fin de mejorar su contribución a  la solución actual. En cambio, en los sistemas clasificadores de Pittsburgh [15, 16], el aprendizajese ve como un proceso de optimización fuera de línea en el que se aplica un algoritmo  genético  solo  para  buscar  la  mejor  solución  a  un  problema  dado. Además, los sistemas clasificadores de Pittsburgh no mantienen una, sino un conjunto de soluciones candidatas. Mientras que en el sistema de clasificadores de Michigan cada clasificador individual representa una parte de la solución global, en el sistema de Pittsburgh cada individuo es una solución candidata completa (formada a su vez por un conjunto de clasificadores). La aptitud de cada individuo de Pittsburgh se calcula fuera de línea probándolo en una muestra representativa de instancias del problema. Los individuos compiten entre sí a través de la selección, mientras que el cruce y la mutación recombinan las soluciones para buscar soluciones mejores [15].  


# 3. Resultados y análisis  

El  conjunto  de  datos  contiene  información  multiespectal  compuesta  por  4 canales, Red, Green, NIR y Red Edge. Cada pixel es etiquetado manualmente para indicar si corresponde a un pixel de plantación de arroz o no. En la Fig. 3-c se observa el ground truth generado como referencia. Se genera un datasetde alrededor de 1.7 millones de registros etiquetados. De los cuales, 201.440 son objeto de estudio de esta investigación.  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig3.png) 

## 3.1 Análisis del dataset  

En la Fig. 4 se observa que las imágenes presentan mayor tendencia a etiquetas en 1, relacionadas a plantación. Esto se hace evidente en la Fig. 3-a, debido a que el dron en campo tiende a observar mas regiones asociadas al material biologico del cultivo en relación al suelo. En la Fig. 4 se observa que los resultados están fuertemente influenciados por los canales infrarrojos, medianamente influenciados por el canal verde y poco influenciados por el canal rojo. Esto concuerda con la Fig. 3-b, las plantas reflejan las longitudes de onda infrarrojas y las relacionadas al color verde principalmente.  


![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig4.png)  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig5.png)  

El  desarrollo  metodologico  parte  de  balancear  el  dataset,  el  resultado  seobserva en la Fig. 6.  
En la Fig. 7 se observa que aunque se reduzca significativamente la cantidadde muestras, se respeta la integridad de los datos.  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig6.png)  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig7.png)  

Estos  datos  son  usados  para  el  entrenamiento  de  la  red  neuronal,  en proporción de 70% para entrenamiento y 30% para validación.  

## 3.2 Segmentación de imágenes con Algoritmos Geneticos  

El conjunto de datos esta conformado por 201.440 muestras. Cada vector de caracteristicas esta representado por cuatro entradas y una salida. La salida puede tomar dos valores, uno para planta y otro para suelo. En el experimentose  define  una  población  inicial  y  se  inicializan  los  cromosomas  de  los  posibles  individuos  o  soluciones.  Dichos  individuos  se  evalúan  mediante  función de  fitness,  en  la  que  se  implementan  un  conjunto  de  reglas  bajo  el  enfoque Michigan  en  aras  de  priorizar  los  individuos  de  mejor  aptitud  en  el  proceso de  selección  realizado  de  manera  aleatoria  mediante  ruleta.  A  continuación, realizamos  el  cruce,  seleccionando  tuplas  de  individuos  con  mejor  aptitud  y elegimos aleatoriamente de 1 a 8 genes para intercambiarlos. Por   ́ultimo, se realiza el proceso de mutación, eligiendo aleatoriamente 12% de los individuos y variando sus cromosomas aleatoriamente. Los resultados se presentan mediante  tres  parámetros,  (i)  métrica  verdaderos  positivos  como  función  fitness,(ii) métrica verdaderos negativos como función fitness y (iii) métrica fitness.En la figura. 8 se muestra la métrica de los verdaderos positivos como función fitness. En la figura. 9 se muestra la métrica de los verdaderos negativos comofunción fitness. En la figura. 10 se muestra la métrica fitness.  

![Image text](https://https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig8.png)  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig9.png)  

![Image text](https://github.com/javierrojas6/rice-crop-detection/blob/feature/documentacion/imagenes/Fig10.png)  


# 4. Conclusiones

Este enfoque de algoritmos genéticos a través de clasificadores tipo Michigan es una alternativa viable al problema de segmentación de imágenes. A partir de la definición adecuada de una función fitness y objetivo. De la que seleccionamos de los individuos de mejor aptitud de forma aleatoria a través de ruleta, aquellos con los que se realiza el cruce y posteriormente se mutan 12\% de los individuos aleatoriamente. El resultado denota convergencia de los individuos hacia un posible clasificador de los pixeles denotados por suelos o cultivos de arroz.  
***la pregunta que se busca responder (en el transcurso de esta investigación) es si ¿es suficiente 0.90 con los canales RED y NIR ó 0.92 con los canales RED, GREEN, RED-EDGE y NIR para resolver el problema de segmentacion de una manera adecuada? - en relación con las técnicas de segmentación presentadas en el estado del arte ***



# Referencias

[1]De, S., Bhattacharyya, S., Chakraborty, S., Dutta, P.: Hybrid Soft Com-puting  for  Multilevel  Image  and  Data  Segmentation.  Springer,  WestBengal (2016)  
[2]  Carson, C., Belongie, S., Greenspan, H., Malik, J.: Blobworld: Image seg-mentation using expectation-maximization and its application to imagequerying. IEEE Transactions on pattern analysis and machine intelligence24(8), 1026–1038 (2002)  
[3]  Banham, M.R., Katsaggelos, A.K.: Digital image restoration. IEEE signalprocessing magazine14(2), 24–41 (1997)  
[4]  Tyagi,  V.:  Understanding  Digital  Image  Processing.  CRC  Press,  Guna(MP), India (2018)  
[5]  Wen, X.-B., Zhang, H., Jiang, Z.-T.: Multiscale unsupervised segmenta-tion of sar imagery using the genetic algorithm. Sensors8(3), 1704–1711(2008)  
[6]Senthilkumaran,  N.,  Rajesh,  R.:  Image  segmentation-a  survey  of  softcomputing  approaches.  In:  2009  International  Conference  on  Advancesin Recent Technologies in Communication and Computing, pp. 844–846(2009). IEEE  
[7]  Karkavitsas,  G.,  Rangoussi,  M.:  Object  localization  in  medical  imagesusing genetic algorithms. International Journal of Signal Processing1(4)(2005)  
[8]  JD., C., F., C., D., M., E., P., JP., R., ES, C.: A novel nir-image segmen-tation method for the precise estimation of above-ground biomass in ricecrops.  PLoS  ONE15(10): e0239591(2020).  https://doi.org/10.1371/journal.pone.0239591  
[9]  Mehta,  S.B.,  Chaudhury,  S.,  Bhattacharyya,  A.,  Jena,  A.:  Tissue  clas-sification in magnetic resonance images through the hybrid approach ofmichigan and pittsburg genetic algorithm. Applied Soft Computing11(4),3476–3484 (2011)  
[10]  Ishibuchi,  H.,  Nakashima,  T.,  Murata,  T.:  Three-objective  genetics-based machine learning for linguistic rule extraction. Information sciences136(1-4), 109–133 (2001)  
[11]  Wang,  L.-X.,  Mendel,  J.M.:  Generating  fuzzy  rules  by  learning  fromexamples.  IEEE  Transactions  on  systems,  man,  and  cybernetics22(6),1414–1427 (1992)  
[12]  Holland, J.: Adaptation in natural and artificial systems, univ. of mich.press. Ann Arbor (1975)  
[13]  Sigaud,  O.,  Wilson,  S.W.:  Learning  classifier  systems:  a  survey.  SoftComputing11(11), 1065–1078 (2007)  
[14]  Sampson,  J.R.:  Adaptation  in  natural  and  artificial  systems  (John  H.Holland). Society for Industrial and Applied Mathematics (1976)  
[15]  Lanzi,  P.L.:  In:  Sammut,  C.,  Webb,  G.I.  (eds.)  Classifier  Systems,pp.  217–224.  Springer,  Boston,  MA  (2017).  https://doi.org/10.1007/978-1-4899-7687-1941.https://doi.org/10.1007/978-1-4899-7687-1941[16]  Smith, S.F.: A Learning System Based on Genetic Adaptive Algorithms.University of Pittsburgh, ??? (1980)

