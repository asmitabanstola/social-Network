#!C:\Users\Dell\AppData\Local\Programs\Python\Python39\python.exe
import numpy as np
import pandas as pd
import sklearn
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.neighbors import NearestNeighbors

import warnings

warnings.simplefilter(action='ignore', category=FutureWarning)

ratings = pd.read_csv("ratings.csv");
ratings.head()

posts = pd.read_csv("posts.csv");
posts.head()

n_ratings = len(ratings)
n_posts = len(ratings['post_id'].unique())
n_users = len(ratings['user_id'].unique())

# print(f"Number of ratings: {n_ratings}")
# print(f"Number of unique posts: {n_posts}")
# print(f"Number of unique users: {n_users}")
# print(f"Average ratings per user: {round(n_ratings / n_users, 2)}")
# print(f"Average ratings per post: {round(n_ratings / n_posts, 2)}")

user_freq = ratings[['user_id', 'post_id']].groupby('user_id').count().reset_index()
user_freq.columns = ['user_id', 'n_ratings']
user_freq.head()

# Find Lowest and Highest rated posts:
mean_rating = ratings.groupby('post_id')[['rating']].mean()
# Lowest rated posts
lowest_rated = mean_rating['rating'].idxmin()
posts.loc[posts['post_id'] == lowest_rated]
# Highest rated posts
highest_rated = mean_rating['rating'].idxmax()
posts.loc[posts['post_id'] == highest_rated]
# show number of people who rated posts rated post highest
ratings[ratings['post_id'] == highest_rated]
# show number of people who rated posts rated post lowest
ratings[ratings['post_id'] == lowest_rated]

## the above posts has very low dataset. We will use bayesian average
post_stats = ratings.groupby('post_id')[['rating']].agg(['count', 'mean'])
post_stats.columns = post_stats.columns.droplevel()

# Now, we create user-item matrix using scipy csr matrix
from scipy.sparse import csr_matrix


def create_matrix(df):
    N = len(df['user_id'].unique())
    M = len(df['post_id'].unique())

    # Map Ids to indices
    user_mapper = dict(zip(np.unique(df["user_id"]), list(range(N))))
    post_mapper = dict(zip(np.unique(df["post_id"]), list(range(M))))

    # Map indices to IDs
    user_inv_mapper = dict(zip(list(range(N)), np.unique(df["user_id"])))
    post_inv_mapper = dict(zip(list(range(M)), np.unique(df["post_id"])))

    user_index = [user_mapper[i] for i in df['user_id']]
    post_index = [post_mapper[i] for i in df['post_id']]

    X = csr_matrix((df["rating"], (post_index, user_index)), shape=(M, N))

    return X, user_mapper, post_mapper, user_inv_mapper, post_inv_mapper


X, user_mapper, post_mapper, user_inv_mapper, post_inv_mapper = create_matrix(ratings)



"""
Find similar users using KNN
"""


def find_similar_users(p_id, X, k, metric='cosine', show_distance=False):
    neighbour_ids = []

    post_ind = post_mapper[p_id]
    post_vec = X[post_ind]
    k += 1
    kNN = NearestNeighbors(n_neighbors=k, algorithm="brute", metric=metric)
    kNN.fit(X)
    post_vec = post_vec.reshape(1, -1)
    neighbour = kNN.kneighbors(post_vec, return_distance=show_distance)
    for i in range(0, k):
        n = neighbour.item(i)
        neighbour_ids.append(post_inv_mapper[n])
    neighbour_ids.pop(0)
    return neighbour_ids


post_titles = dict(zip(posts['post_id'], posts['added_by']))

p_id = 78

similar_ids = find_similar_users(p_id, X, k=9)
post_title = post_titles[p_id]
for i in similar_ids:
    print(post_titles[i])