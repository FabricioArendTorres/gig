#!/usr/bin/python3
# coding: utf-8

from scipy import stats
import numpy as np
import json
import seaborn as sns
from IPython import embed
import matplotlib
import matplotlib.pyplot as plt
matplotlib.style.use('ggplot')


import gig


if __name__ == '__main__':
    GIG = gig.GIG(26)

    with open("samples_R.json") as json_data:
        data_json = json.load(json_data)

    i = 0
    for data_row in data_json:
        i += 1
        a = data_row['a']
        b = data_row['b']
        p = data_row['p']
        samples_R = np.array(data_row['samples'])
        sns.distplot(samples_R, label="R")
        samples_py = GIG.sample_n(lambda_ = p, chi = b, psi = a, n = len(samples_R))
        sns.distplot(samples_py, label="Python")
        D_stat, p_val = stats.ks_2samp(samples_R, samples_py)
        plt.legend()
        plt.show()
        assert(p_val > 0.1)
        print("Parameter Setting #{0}: \t p value:{1}".format(i, p_val))