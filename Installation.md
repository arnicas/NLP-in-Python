Installing Python and Libraries:
-------

Download miniconda for Python 2.7 from here:
[http://conda.pydata.org/miniconda.html][1]

To install it on a Mac, you need to open a terminal window and find it in your downloads file. Then type:

>sh Miniconda-3.6.0-MacOSX-x86_64.sh

Accept the defaults.  Open a new terminal window afterwards.

Then from the command line in the new window:

    >conda create -n NLP ipython-notebook cython scipy matplotlib scikit-learn numpy nltk pip
    [accept the defaults]
    >source activate NLP
    >pip install pattern
    >pip install Image
    >pip install git+git://github.com/amueller/word_cloud.git

You should see a prompt that shows the name of your new virtual environment (venv):

>(NLP) morestuffhere$

Check it all worked by starting the notebook server from the directory with all the .ipynb files (top level of this repo):

>(NLP)etc$ ipython notebook

You should see the notebook server start up and open a web page with a list of directories.  (You can shut down the notebook server by typing Control-C in the window where you started it.)

To get out of the venv again, you just type:

>(NLP)etc$ source deactivate

