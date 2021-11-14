import pandas as pd
import numpy as np
from core.k_means_core import KMeansCore
from util.util import show_k_value, show_silhouette, show_silhouette_v


dataframe = pd.read_csv(r"../../CaracteristicasT.csv")
data = np.array(dataframe[["Red", "Green", "NIR", "Red_edge"]])
crop = np.array(dataframe['crop'])
pd.set_option('display.max_columns', None)
color1 = '#1BA6CC'
color2 = '#3E29AF'
print(dataframe.describe())
print(dataframe.groupby('crop').size())

show_k_value(data)
show_silhouette(data)
#show_silhouette_v(data)
k = KMeansCore(dataframe, data, crop, 2)
k.draw_drop_hist()
k.draw_group_data()
k.draw_original_data_by_crop()
k.execute_k_means(color1,color2)
#k.execute_k_means("Green","Red")
k.print_closest_by_channel(3)