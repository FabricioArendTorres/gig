# distutils: language = c++
# distutils: extra_compile_args = -std=c++11

import numpy as np
cimport numpy as np
cimport cython

cdef extern from "<random>" namespace "std":
    cdef cppclass mt19937:
        mt19937() # we need to define this constructor to stack allocate classes in Cython
        mt19937(unsigned int seed) # not worrying about matching the exact int type for seed

cdef extern from "gig/gig.cpp":
    pass

cdef extern from "gig/gig.h" namespace "gig":
    cdef cppclass GIG_gen:
        GIG_gen() # stack allocate
        GIG_gen(unsigned int) except +
        double sample(double, double, double)
        


cdef class GIG:
    cdef GIG_gen gig

    def __cinit__(self, int seed):
        self.gig = GIG_gen(seed)

    def sample(self, lambda_, chi, psi):
        """ Draw one random sample from the GIG distribution.
        
        Arguments:
            lambda_ {[type]} -- [p in wikipedia GIG parametrization]
            chi {[type]} -- [b in wikipedia GIG parametrization]
            psi {[type]} -- [a in wikipedia GIG parametrization]
        """
        return(self.gig.sample(lambda_, chi, psi))

    def sample_n(self, lambda_, chi, psi, n):
        cdef np.ndarray[np.double_t, ndim=1] samples = np.empty(n)
        for i in range(n):
            samples[i] = self.gig.sample(lambda_, chi, psi)
        return(samples)

