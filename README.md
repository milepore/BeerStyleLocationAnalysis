# Abstract
During this project we looked at the correlation between beer styles, ratings and geographical locations. There are clearly some beer styles that are geographically influenced (such as a Munich Lager or Belgian Tripple or even a Kentucky Common), but are there certian types of beers that are better in particular geographies than others. In order to look at this question, we will use the Beer Advocate data set. Finally at the end of this project we will build a model that will help us to predict the best beer styles in a given location - to help answer the question "what kind of beer should I get when I travel to a particular place".

# Overview and Motivation
When it comes to beer coming from Europe, it is clear that there is a correlation between style and geography. This correlation is so significant that most styles are named after the location they come from. Examples of this are "Munich Lager" or "Belgian Tripple".

What isn't clear without doing some research is if this correlation applies to beers in the USA, and if the "best" versions of those geographically correlated beers come from those locations.

I would like to explore the question - are there specific geographies that lend themselves to certain types of beers. I believe that this will definitely hold true through Europe - where beer styles are very historically oriented to the location they come from, but don't know how well this will hold for American Breweries, with a few stylistic exceptions.

# Related Work
There have been several other works that have looked at components of beer ratings. Two papers that I looked at to try and understnad work that had been done before are:

Rating Predicion for Beer - a paper written by Xun Jiao and Zhou Fang for a UCSD Computer Science class in 2015 - which looks at some of the key apsects of the RateBeer data set - a similar dataset to the one we used, to see what controtibuted to beer ratings. This also looked at the rating authors' impact to a given rating. This project looked at the textual ratings as well as several other factors (like ABV) that are directly in the data set.
From Amateurs to Connoisseurs: Modeling the Evolution of User Expertise through Oneline Reviews - this is a paper written by Julian McAuley, Jure Leskovec at Stanford in March of 2013, looking at how reviewers' trends changed over time - also using the RateBeer data set. They concluded that they could determine speicfic changes in users' tastes over time by analyizing their ratings over time.
# Dataset
In order to get to the bottom of this question, we need to have access to a wide range of beer reviews and the information about where those beers were brewed. There were no readily available datasets with all this information, so a significant amount of work was put in to create this dataset.

I have chosen the BeerAdvocate reiew dataset which contains aproxamately 1.5 million individual beer reviews, collected from 2000 through 2011. This dataset is available in several forms, the one used is a processed CSV file available here:

https://data.world/socialmediadata/beeradvocate

This dataset has the following fields:

* brewery_id - a unique identifier representing the brewery making the beer
* brewery_name - the name of the brewery making the beer
* review_time - the date/time of the review
* review_overall - the overall (numeric) score
* review_aroma - the score the reviewer gave the aroma of the beer
* review_appearance - the score the reviewer gave the appearance of the beer
* review_profilename - the username of the user doing the review
* beer_style - the style of beer (text)
* review_palate - the score the reviewer gave the palate of the beer
* review_taste - the score the reviewer gave the taste of the beer
* beer_name - the name of the beer
* beer_abv - the ABV of the beer
* beer_beerid - a unique ID for the beer

# Intermediate datasets

There are three intermediate datasets that are available - 

* breweries-cleaned.csv - for each brewery mentiouned in the beeradvocate dataset, the code has done its best to find the brewery name, and location, and translate that (using the google places API) to longitude and latitude
* merged.data.csv.gz - this dataset includes much of the data from the beer advocate dataset, but also includes the merged information from breweries-cleaned.csv
* individual_beers.csv - the avarage rating for each beer (so if multiple ratings were submitted for a given beer, this takes the mean score for the beer), making the dataset a bit easier to consume
