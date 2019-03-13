warmup01-Ryan-Chien.Rmd
================

R Markdown
----------

This is an R Markdown document. Markdown is a simple formatting syntax for authoring HTML, PDF, and MS Word documents. For more details on using R Markdown see <http://rmarkdown.rstudio.com>.

When you click the **Knit** button a document will be generated that includes both content as well as the output of any embedded R code chunks within the document. You can embed an R code chunk like this:

``` r
summary(cars)
```

    ##      speed           dist       
    ##  Min.   : 4.0   Min.   :  2.00  
    ##  1st Qu.:12.0   1st Qu.: 26.00  
    ##  Median :15.0   Median : 36.00  
    ##  Mean   :15.4   Mean   : 42.98  
    ##  3rd Qu.:19.0   3rd Qu.: 56.00  
    ##  Max.   :25.0   Max.   :120.00

Including Plots
---------------

You can also embed plots, for example:

![](warmup01-Ryan-Chien_files/figure-markdown_github/pressure-1.png)

Note that the `echo = FALSE` parameter was added to the code chunk to prevent printing of the R code that generated the plot.

Star Wars
=========

*Torra Doza*

[Character website](https://starwars.fandom.com/wiki/Torra_Doza)

### Torra Doza blockquote:

> "I'm an Ace pilot. I've battled pirates and marauders."

**Torra Doza Image**

![](https://vignette.wikia.nocookie.net/starwars/images/1/1c/SWResistance-TorraDoza.jpg/revision/latest?cb=20180914205610)

| Description | Value  |
|-------------|--------|
| Species     | Human  |
| Gender      | Female |
| Eye Color   | Brown  |
| Skin Color  | Light  |

Cooking Recipe
==============

*Boozy Baked French Toast*

### Ingredients

-   1 loaf supermarket Challah bread in 1-inch slices
-   3 cups whole milk
-   3 eggs
-   3 tablespoons sugar
-   1/2 teaspoon salt
-   Flavorings of choice (e.g. Bailey's, Cointreau, etc)

##### "Special" Kitchen Tools

-   9 X 13 inch baking dish

##### Steps

1.  Grease baking dish with butter
2.  Arrange bread in two tightly-packed layers in the pan
3.  Whisk milk, eggs, sugar, salt and flavorings of your choice to pour over the bread
4.  Wrap tightly with plastic wrap and refrigerate overnight
5.  Bake at 425 degrees for 30 minutes, or until puffed and golden
6.  Cut into generous squares and serve with maple syurp, fresh fruit, powdered sugar, or all of the above

![](https://smittenkitchendotcom.files.wordpress.com/2015/05/new-years-day-20011.jpg)

**Special Season:** not specified

**Variations of Recipe:** Recipes could vary by flavorings and toppings

Euclidean Distance
==================

Definition
----------

The **Euclidean distance** between points **p** and **q** is the length of the line segement connecting them ().

In Cartesian coordinates, if **p** = (*p*<sub>1</sub>, *p*<sub>2</sub>, ....,*p*<sub>*n*</sub>) and **q** = (*q*<sub>1</sub>, *q*<sub>2</sub>, ....,*q*<sub>*n*</sub>) are two points in Euclidean n-space, then the distance (d) from **p** to **q**, or from **q** to **p** is given by the Pythagorean formula.

$$d(p, q) = d(q, p) = \\sqrt{(q\_1 - p\_1)^2 + (q\_2 - p\_2)^2 + ... + (q\_n - p\_n)^2}$$

$$ = \\sqrt{\\sum\_{i=1}^{n} (q\_i - p\_i)^2}$$

The position of a point in a Euclidean n-space is a Euclidean vector. So, **p** and **q** may be represented as Euclidean vectors, starting from the origin of the space (initial point) with their tips (terminal points) ending at the two points. The Euclidean norm, or **Euclidean length**, or **magnitude** of a vector measures the length of the vector.

$$ ||p|| \\sqrt{p\_1^2 + p\_2^2 + ... + p\_n^2} = \\sqrt{p \\cdot p},$$

where the last expression involes the dot product.
