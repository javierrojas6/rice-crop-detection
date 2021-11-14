import matplotlib.pyplot as plt
import seaborn as sb
from mpl_toolkits.mplot3d import Axes3D
from sklearn.cluster import KMeans
from sklearn.metrics import pairwise_distances_argmin_min
plt.rcParams['figure.figsize'] = (64, 64)
plt.style.use('ggplot')


class KMeansCore:

    def __init__(self, old_data, dataframe, crop, n):
        self.old_data = old_data
        self.dataframe = dataframe
        self.crop = crop
        self.n = n

    def execute_k_means(self, color1, color2) -> None:
        k_means = KMeans(n_clusters=self.n).fit(self.dataframe)
        centroids = k_means.cluster_centers_
        print(centroids)

        labels = k_means.predict(self.dataframe)
        # Getting the cluster centers
        C = k_means.cluster_centers_
        colors = [color1, color2]
        assign = []
        for row in labels:
            assign.append(colors[row])

        fig = plt.figure()
        ax = Axes3D(fig)
        ax.set_xlabel("Red")
        ax.set_ylabel("Green")
        ax.set_zlabel("Red-Edge")
        ax.xaxis_inverted()
        ax.scatter(self.dataframe[:, 0], self.dataframe[:, 1], self.dataframe[:, 3], c=assign, s=10)
        ax.scatter(C[:, 0], C[:, 1], C[:, 3], marker='*', c=colors, s=10)
        mapping = {0: 'crop', 1: 'other'}
        a = [mapping[i] for i in labels]
        ax.legend(a)
        plt.savefig('../kmeansClusters-Green-Red-RedEdge-CH2.png')

    def draw_drop_hist(self) -> None:
        self.old_data.drop(['crop'], 1).hist()
        plt.savefig("../dispersion-data.png")

    def draw_group_data(self) -> None:
        sb.pairplot(self.old_data.dropna(), hue='crop', size=4, vars=["Red", "Green", "NIR", "Red_edge"], kind='scatter')
        plt.savefig("../correlation-ch_vs_crop.png")

    def draw_original_data_by_crop(self) -> None:
        fig = plt.figure()
        ax = Axes3D(fig)
        ax.set_xlabel("Red")
        ax.set_ylabel("Green")
        ax.set_zlabel("Red-Edge")
        colors = ['#3E29AF', '#1BA6CC']
        assign = []
        for row in self.crop:
            assign.append(colors[row])
        ax.scatter(self.dataframe[:, 0], self.dataframe[:, 1], self.dataframe[:, 2], c=assign, s=10, label="crop")
        plt.savefig("../groups-data-by-r-g-re.png")

    def print_closest_by_channel(self, ch) -> None:
        k_means = KMeans(n_clusters=self.n).fit(self.dataframe)
        closest, _ = pairwise_distances_argmin_min(k_means.cluster_centers_, self.dataframe)
        closest
        channels = self.dataframe[:, ch]
        for row in closest:
            print(channels[row])
