
### Some Overview Stuff About Libraries and Books

#Python libraries for NLP:

* NLTK
 * NLTK is used in conjunction with sklearn for low-level token/parsing
operations including POS, tokenization, spelling correction, etc. (The point
where it breaks down is tf-idf, which is weirdly laborious. Switch over to
pattern or sklearn.)
  * http://www.nltk.org/
  * Cheatsheet: https://blogs.princeton.edu/etc/files/2014/03/Text-Analysis-
with-NLTK-Cheatsheet.pdf
* Pattern.py
 * A lib that evolved rather independently in NL, has nicer api for some
operations at low level and mid-level (like doc similarity and clustering), but
may not be fast enough (built entirely in python, AFAIK)
  * http://www.clips.ua.ac.be/pattern - for nlp, especially pattern.en and
pattern.vector
* Also TextBlob:
  * http://textblob.readthedocs.org/en/dev/
  * Looks like it overlaps with NLTK and pattern a bit; handles the model part of document collections

### Advanced Python Toolkits (machine learning etc):
* Sklearn (scikit-learn)
 * Standard in use for classification, but can be hard to examine features/etc.
Good for volume/speed.
  * http://scikit-learn.org/stable/ (excellent docs and tutorials/examples)
* Gensim - 'topic modeling for humans'
 * Some cutting edge stuff in here like word2vec. Good examples on dealing with
large offline text, and some mechanisms for exchanging data with sklearn.
  * https://radimrehurek.com/gensim/
  * Radim's blog has a bunch of tutorial/examples: http://radimrehurek.com/blog/

#Javascript Options

* Node package "natural" (beware some weird stuff - see my demo in utils):
https://github.com/NaturalNode/natural
* RiTa.js (won't do TfIdf or any machine learning, will do poetry-related
stuff!): http://rednoise.org/rita/
* Dan Shiffman's processing / node text tutorials (beware, these are toy examples and there are some
bugs that means they won't work on all our data): http://shiffman.net/teaching/a2z/

# R
### There are tons, and digital humanities folks use R more than Python,
currently; this is not an exhaustive list!

* See a list here:
http://cran.r-project.org/web/views/NaturalLanguageProcessing.html
* especially LDAVis, tm (topic modeling)
* Tutorial here on Stats Methods for Studing Literature:
http://www.chlt.org/StatisticalMethods/
* Book and code from Matthew Jockers - http://www.amazon.com/Analysis-Students-
Literature-Quantitative-Humanities/dp/3319031635/ref=sr_1_1?ie=UTF8&qid=14230029
60&sr=8-1&keywords=matthew+jockers

# Java
### Lots of libraries; I admit I only play with Stanford's right now

* Stanford NLP (written in java) - python API's exist:
http://nlp.stanford.edu/software/index.shtml
* OpenNLP from Apache: https://opennlp.apache.org/


# Some Python NLP-related Books:

* Python Text Processing with NLTK 2.0 Cookbook (Perkins)
* Python 3 Text Processing With NLTK Cookbook (Perkins) - maybe slightly updated
over NLTK 2.0 book?  I have both but don't know detailed diffs.
* Building Machine Learning Systems with Python (Willi Richert & Luis Coelho,
lots of text examples)
* Natural Languages Processing with Python (Bird, Klein etc. - first NLTK book,
out of date a bit) http://www.nltk.org/book/
* Some gensim tutorial stuff on iterating over large corpora:
https://github.com/piskvorky/topic_modeling_tutorial


