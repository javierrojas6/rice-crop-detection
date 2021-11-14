from sklearn.cluster import KMeans
from sklearn.metrics import silhouette_score
from yellowbrick.cluster import SilhouetteVisualizer
import matplotlib.pyplot as plt

plt.rcParams['figure.figsize'] = (32, 18)
plt.style.use('ggplot')


def show_k_value(df):
    number_clusters = range(1, 20)
    k_means = [KMeans(n_clusters=i) for i in number_clusters]
    k_means
    score = [k_means[i].fit(df).score(df) for i in range(len(k_means))]
    score
    plt.plot(number_clusters, score)
    plt.xlabel('Number of Clusters')
    plt.ylabel('Score')
    plt.title('Elbow Curve')
    plt.savefig('../elbowCurve.png')


def show_silhouette(df):
    sil = []
    K = range(2, 11)
    for k in K:
        k_means = KMeans(n_clusters=k).fit(df)
        labels = k_means.labels_
        sil.append(silhouette_score(df, labels, metric='euclidean', sample_size=2000))
    plt.plot(K, sil, 'bx-')
    plt.xlabel('Clústeres')
    plt.ylabel('Puntaje de la silueta')
    plt.savefig("../silhouette.png")


def show_silhouette_v(df):
    fig, ax = plt.subplots(2, 2, figsize=(15, 8))
    for i in [2, 3, 4, 5]:
        km = KMeans(n_clusters=i, init='k-means++', n_init=10, max_iter=100, random_state=42)
        q, mod = divmod(i, 2)
        visualizer = SilhouetteVisualizer(km, colors='yellowbrick', ax=ax[q - 1][mod])
        visualizer.fit(df)
        visualizer.show()
