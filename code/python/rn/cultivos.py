# %% Imports
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import LabelEncoder
import matplotlib.pyplot as plt

import tensorflow as tf
from tensorflow.keras import Sequential
from tensorflow.keras.layers import Dense

from geneticalgorithm import geneticalgorithm as ga

#%%  General
datasetURL =  './data/data.csv'
epochs = 8
#%% load the dataset
df = pd.read_csv(datasetURL)
df = df.astype({'X': np.int8, 'Y': np.int8, 'Green': np.float64, 'Red': np.float64, 'NIR': np.float64, 'Red_edge': np.float64, 'crop': np.int8 })

# %%
df.head()

# %%
df.describe()

# %%
df.crop.value_counts().plot.barh(color="red")

# %% Un Random a todo el dataset
df = df.sample(df.shape[0])
df.head()
# %% 
df.pop('X')
df.pop('Y')
df.pop('Red')
figure = plt.figure(figsize=(19, 15))
plt.matshow(df.corr(), fignum=figure.number)
plt.xticks(range(df.select_dtypes(['number']).shape[1]), df.select_dtypes(['number']).columns, fontsize=14, rotation=45)
plt.yticks(range(df.select_dtypes(['number']).shape[1]), df.select_dtypes(['number']).columns, fontsize=14)
cb = plt.colorbar()
cb.ax.tick_params(labelsize=14)
plt.title('Matrix de correlación del Dataset', fontsize=16);

# %% vamos a balancear el dataset, subset de CROP = 0
# subset de CROP = 0
df0 = df[df.crop == 0]
df0.describe()
# %% subset de CROP = 1
tempDf1 = df[df.crop == 1]
df1 = tempDf1.sample(df0.shape[0])
df1.describe()

# balanced = df
# %% ahora se combinan los dataset
balanced = pd.concat([df1, df0])
balanced = balanced.sample(balanced.shape[0])

# %% ahora grafiquemos para verificar
balanced.crop.value_counts().plot.barh(color="red")

# %% un describe
balanced.describe()

# %% un head
balanced.head()
# %% 
figure = plt.figure(figsize=(19, 15))
plt.matshow(balanced.corr(), fignum=figure.number)
plt.xticks(range(balanced.select_dtypes(['number']).shape[1]), balanced.select_dtypes(['number']).columns, fontsize=14, rotation=45)
plt.yticks(range(balanced.select_dtypes(['number']).shape[1]), balanced.select_dtypes(['number']).columns, fontsize=14)
cb = plt.colorbar()
cb.ax.tick_params(labelsize=14)
plt.title('Matrix de correlación de dataset balanceado', fontsize=16);

# %% ahora preparemos la red neuronal
outputs = balanced.pop('crop')
inputs = balanced

# %%
inputs.head()

# %%
outputs.head()

# %% Extrae los dataset de entrenamiento y pruebas
inputTrain, inputTest, outputTrain, outputTest = train_test_split(inputs, outputs, test_size=0.30)
featuresCount = inputTrain.shape[1]

# %% ahora configuremos la red neuronal
# define model
model = Sequential()
model.add(Dense(featuresCount, activation='relu', kernel_initializer='he_normal', input_shape=(featuresCount,)))
model.add(Dense(3, activation='sigmoid', kernel_initializer='he_normal'))
# model.add(Dense(3, activation='sigmoid', kernel_initializer='he_normal'))
# model.add(Dense(3, activation='sigmoid', kernel_initializer='he_normal'))
model.add(Dense(1 , activation='relu'))

# %% 
model.summary()

# %%
model.compile(
  # optimizer=tf.keras.optimizers.RMSprop(), 
  optimizer='adam', 
  loss=tf.keras.losses.BinaryCrossentropy(from_logits=True),
  metrics=['accuracy']
)
# %% 
my_callbacks = [
    tf.keras.callbacks.EarlyStopping(patience=2),
    tf.keras.callbacks.ModelCheckpoint(filepath='./logscheckpoint', monitor='val_loss', verbose=1, save_best_only=False, mode='auto'),
    tf.keras.callbacks.TensorBoard(log_dir='./logs'),
]
# %%
history = model.fit(inputTrain, outputTrain, epochs=epochs, batch_size=128)

# %%
loss, acc = model.evaluate(inputTest, outputTest, verbose=1)
print('loss: ', loss)
print('acc: ', acc)


print('history: ', history.history)
print('history: ', history.history.keys())

epochsSerie = range(1, len(history.history['accuracy']) + 1, 1)

plt.title ('Curvas de entrenamiento')

plt.plot(epochsSerie, history.history['accuracy'], 'r--', label='Training acc')
plt.plot(epochsSerie, history.history['loss'], 'b--', label='Training loss')

plt.ylabel('Porcentaje')
plt.xlabel('Epochs')

plt.legend()
plt.figure()