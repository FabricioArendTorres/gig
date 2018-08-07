from distutils.core import setup

from Cython.Build import cythonize

setup(name='gig', version='0.1', author='Fabricio Arend Torres', ext_modules=cythonize("gig.pyx"))