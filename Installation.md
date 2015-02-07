Installing Python and Libraries:
-------

Download miniconda for Python 2.7 from here:
[http://conda.pydata.org/miniconda.html][1]

To install it on a Mac, you need to open a terminal window and find it in your downloads file. Then type:

>sh Miniconda-3.6.0-MacOSX-x86_64.sh

Accept the defaults.  Open a new terminal window afterwards.

Then from the command line in the new window:

    >conda create -n topic_workshop ipython-notebook pandas numpy nltk pip
    [accept the defaults]
    >source activate topic_workshop
    >pip install pattern
    >pip install networkx

You should see a prompt that shows the name of your new virtual environment (venv):

>(topic_workshop) morestuffhere$

Check it all worked by starting the notebook server:

>(topic_workshop)$ ipython notebook

You should see the notebook server start up and open a web page with a list of directories.  (You can shut down the notebook server by typing Control-C in the window where you started it.)
