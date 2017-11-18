#!/usr/bin/env python
try:
    from setuptools import setup
    args = {}
except ImportError:
    from distutils.core import setup
    print("""\
*** WARNING: setuptools is not found.  Using distutils...
""")

from setuptools import setup
try:
    from pypandoc import convert
    read_md = lambda f: convert(f, 'rst')
except ImportError:
    print("warning: pypandoc module not found, could not convert Markdown to RST")
    read_md = lambda f: open(f, 'r').read()

from os import path
setup(name='pg_comp',
      version='0.0.1',
      description='Working on finding optimal transformed Niggli Basis to improve computation time',
      long_description= "" if not path.isfile("README.md") else read_md('README.md'),
      author='John Christensen',
      author_email='JohnEdChristensen@gmail.com',
      url='https://github.com/JohnnyC1423/NiggliOptimization.git',
      license='MIT',
      setup_requires=['pytest-runner',],
      tests_require=['pytest', 'python-coveralls'],
      install_requires=[
          "numpy",
      ],
      packages=['pg_comp'],
      # scripts=[''],
      include_package_data=True,
      classifiers=[
          'Development Status :: 1 - planning',
          'Intended Audience :: Science/Research',
          'Natural Language :: English',
          'Operating System :: Ubuntu 16.04',
          'Programming Language :: Python',
          'Programming Language :: Python :: 2',
          'Programming Language :: Python :: 2.7',
      ],
)
