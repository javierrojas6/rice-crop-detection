# Rice Crop Image Segmentation UsingArtificial Intelligence Techniques
## Edgar Steven Correa Pinzón, Héctor Javier Rojas Silva, Juan Esteban Sacristan Vargas, Deimer De Jesus Ballesteros Padilla, Ronald Fernando Rodriguez Barbosa and Manuel Fernando Párraga Meneses
### School of Engineering, Pontificia Universidad Javeriana, Cra. 7No. 40-62, Bogota, 110231, Bogota, Colombia.


# Abstract
Diferentes técnicas de inteligencia artificial son utilizadas actualmente en la solución de problemas complejos que se presentan en múltiples áreas del conocimiento.  
Existen métodos clásicos y otros nuevos con el enfoque fuzzy-neuro-genético, los cuales se han desarrollado con gran velocidad en las últimas décadas debido a sus buenos resultados, flexibilidad y adaptabilidad. 
Capturar información de cultivo mediante imágenes se ha convertido en una manera no invasiva de modelar el rendimiento de las parcelas.   
Esto hace posible aplicar técnicas de inteligencia artificial para caracterizar la informacion capturada principalmente por vehiculos aéreos no tripulados y por estructuras satelitales.  
Este articulo aborda la segmentación de imágenes como herramienta para caracterizar cultivos de arroz. Se presenta un enfoque orientado a los algoritmos genéticos, en particular sontratados los enfoques de Michigan y Pittsburg. Se evalúa el desempeño de cada uno mediante métricas de desempeño **los resultados son contrastados con otras ténicas validadas en el estado del arte - informacion munerica de posibles mejoras se especifica aquí, falta modificar el resumen**  

**Keywords**:Rice Crop, Image Segmentation, Artificial Neural Networks,fuzzy logic, genetic algorithms.  

# 1  Introduction  

Con  el  avance  tecnol ́ogico  encuanto  a  mayores  capacidades  de  computo,  lainteligencia  artificial  se  ha  posicionado  como  una  poderosa  herramienta  enmuchos  procesos  de  la  cotidianidad.  Se  ha  llegado  a  un  punto  en  el  cual  esimposible imaginarse el mundo sin estos desarrollos tecnol ́ogicos propios de lossistemas inform ́aticos [1].  
Estos sistemas inteligentes presentan el potencial de abordar problem ́aticasde  talla  mundial  como  la  escasez  y  la  calidad  de  los  recursos  alimenticios. En  este  contexto,  el  arroz  es  un  deseable  caso  de  estudio,  dado  que  per-mitiria  mitigar  su  impacto  y  aportar  a  la  solución.  El  avance  tecnologicorelacionado con vehiculos a ́ereos no tripulados (UAV) y estructuras satelitaleshan permitido capturar información de cultivo. Esta configuración hace posi-ble  aplicar  técnicas  de  inteligencia  artificial  para  modelar  el  rendimiento  de muchos cultivos.  
El enfoque de modelamiento de parcelas se fundamenta en el procesamientode imagenes. El objetivo se formaliza en la segmentación de imágenes. En esta area de investigacion, los algoritmos inevitablemente cometen errores depen-diendo de la robustez que aborden, esto ocasiona que disminuya el desempe ̃node  los  sistemas  que  poseen  la  capacidad  de  recuperación de imágenes y reconocimiento de objetos [2].  
En  este  mismo  sentido,  el problema  de  segmentacion  de  imágenes  es  unenfoque consolidado en el  ́area de investigación de procesamiento de im ́agenesy presenta gran cantidad de aplicaciones. Existen diferentes enfoques para elan ́alisis en la segmentación de imágenes. El enfoque cl ́asico depende de t ́ecnicasde filtrado y aproximaciones estadísticas [1].    
Los métodos en este enfoque trabajan técnicas de umbralización, detección de  bordes  o  técnicas  basadas  en  los  límites,  técnicas  basadas  en  la  región, técnicas morfológicas, corte normalizado, un enfoque teórico de gráficos, enfo-ques  k-means,  etc[1,  3,  4].  Los  enfoques  no  clásicos  se  fundamentan  en  elparadigma fuzzy-neuro-genético o sus variantes y aportan características para aplicaciones en tiempo real [1].  
Con  relación  a  las  generalidades  del  algoritmo  genético  (AG),  se  puede inferir  que  es  capaz  de  superar  muchos  de  los  defectos  de  otras  técnicas  de optimización como las técnicas exhaustivas, las técnicas basadas en el cálculo, el  conocimiento  parcial  (hill  climbing,  beam  search,  best  first,  branch  andbound, programación dinámica, técnicas basadas en el conocimiento (sistemasde reglas de producci ́on, métodos heurísticos)[5]. Debido a la generalidad delproceso genético, son independientes de la técnica de segmentación utilizada, requiriendo   ́unicamente  una  medida  de  rendimiento,  que  se  denomina  calidad  de  segmentación,  para  cualquier  combinación  de  parámetros  dada.  Los AG se han utilizado para resolver varios problemas de visión por ordenador, como la segmentación de imágenes[5, 6], la selección de características[7], la comparación  de  imágenes  y  el  reconocimiento  de  objetos[7].  Recientemente, los  investigadores  han  estudiado  la  aplicación  de  los  algoritmos  genéticos  al problema  de  la  segmentación  de  imágenes.  Quizás  el  trabajo  más  extenso  y detallado sobre los AGs dentro de la segmentaci ́on de im ́agenes es el de Bhanuy Lee [6].  


# 2 Métodos  

Esta  sección  aborda  el  problema  de  segmentaci ́on  de  im ́agenes  a  trav ́es  decuatro  t ́ecnicas  fundamentadas  en  el   ́area  de  investigacion de  la  inteligenciaartificial.  La  primera  se  desarrolla  entorno  a  las  redes  neuronales.  Se  desar-rolla un experimento con el objetivo de evaluar la influencia de la topolog ́ıa,par ́ametros y algoritmos de entrenamiento de la red neuronal en la tarea desegmentar im ́agenes de cultivos de arroz. La segunda integra la utilizaci ́on deun clasificador bajo el enfoque Michigan. Se conforman los individuos o posi-bles  soluciones  a  trav ́es  de  los  cromosomas  representados  por  los  colores  yestos  se  seleccionan,  cruzan  y  mutan  en  aras  de  definir  los  mas  aptos  comosoluciones  que  convergen  a  la  clasificaci ́on  y  segmentaci ́on  de  los  pixeles  delas im ́agenes. La tercera desarrolla una estructura difusa en la tarea de seg-mentaci ́on de im ́agenes y finalmente la cuarta t ́ecnica se fundamenta en el  ́areade aprendizaje de maquina.

## 2.1  UAV and rice crop

Los veh ́ıculos a ́ereos no tripulados (UAV) se han posicionado en el estado delarte como una herramienta para adquirir información del cultivo. El potencial se debe a que integran cámaras con mejor resolución y mejores capacidades de computo y almacenamiento. En este contexto, el insumo de esta investigación son las imágenes capturadas en campo. Las imagenes contiene información del espectro visible e información multiespectral del infrarrojo cercano y medio. El conjunto de datos contiene 201.440 muestras, y es tomado de la investigación[8]. En la Fig. 1 se observa la forma en la que el UAV captura la imformacion delcultivo. La informacion se compone de cuatro canales a diferentes longitudesde honda, este conjunto conforma el conocimiento del cultivo.

## 2.2 Algoritmos Geneticos

Los Algorítmos genéticos son mecanismos de búsqueda de propósito generalque utilizan principios inspirados en las poblaciones genéticas naturales para evolucionar las soluciones a los problemas [9, 10]. En los algorítmos genéticos la idea básica es mantener una población de cromosomas, que representan soluciones candidatas al problema concreto que evolucionan con el tiempo a través de un proceso de competencia y variación controlada. El algoritmo comienza con una población de cromosomas generados aleatoriamente, y avanza hacia

# Resultados y Análisis 

# Conclusiones


# Referencias

