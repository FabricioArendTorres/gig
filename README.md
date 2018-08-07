# gig
Draw sample from the Generalized Inverse Gaussian distribution using the method described in
<i>
Hörmann, Wolfgang, and Josef Leydold. "Generating generalized inverse Gaussian random variates." Statistics and Computing 24.4 (2014): 547-557.
</i>

This is just a Cython wrapper around https://github.com/horta/gig which again is a wrapper based on the
original R implementation https://cran.r-project.org/web/packages/GIGrvg/GIGrvg.pdf .

<b> Use at own risk, proper tests are still missing. </b>
<h3>Install</h3>

    pip install -e 'git+https://git@github.com/FabricioArendTorres/gig.git#egg=gig' 

<h3> Usage </h3>
Example via IPython console:

    In [1]: import gig
    In [2]: seed = 123
    In [3]: gen = gig.GIG(seed)
    In [4]: gen.sample(1,2,3)
    Out[4]: 0.678740392765086
    In [5]: gen.sample_n(1,2,3, 5)
    Out[5]: array([1.53534916, 1.18799838, 2.02144256, 0.55617329, 0.79051624])



<h3>TODO</h3>
Tests are still missing.
