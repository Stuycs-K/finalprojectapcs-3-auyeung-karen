
# Technical Details:

## Brief project description:
In this game, players are presented with a 9x9 board filled with different types of candies. Players can swap adjacent candies with each other to create rows or columns of three. Once players make a match, those candies will disappear and points will be gained. Candies are repeatedly replaced. Players will need to reach a certain score goal before their moves run out.

### Expanded description:  
#### Critical features:  
* 9x9 grid  
* Candies (at least 6 different types)  
* Candy swapping mechanic (only horizontal and vertical)  
* Limited # of moves  
* Score counter/high score counter  
* Game win/over mechanic  
* Gravity mechanic/replenishing candies  
#### Optional features:  
* Change the theme from candy to something else  
* Different board layouts  
* Different levels  
* Power ups  

### 9x9 Board:  
* 2D array  
* Each element in the array corresponds to a candy in the board  

### Swapping candies:  
* User input (clicking on candies)  
* Swapping logic  

### Matching mechanic:  
* After a swap, checks board for rows/columns of three (or more)  
* If candies are in a row/column, value is changed (to negative number) and candies destroyed  

### Crushing and gravity mechanic:  
* Candies with negative values are destroyed (should all be adjacent?)  
* Candies above the empty space fall down  
* If top row is detected as empty, more candies get replenished and fall down  
* If replenishing candies creates three in a row/column, candies need to be continuously   destroyed/replaced until it stops  

### Needed classes:  
* Board  
* Candy  


A description of your technical design. This should include:

How you will be using the topics covered in class in the project.

# Project Design

UML Diagrams and descriptions of key algorithms, classes, and how things fit together.



# Intended pacing:

How you are breaking down the project and who is responsible for which parts.

A timeline with expected completion dates of parts of the project. (CHANGE THIS!!!!!)

### Board and Candy classes, 9x9 grid filled with candies - 5/23
### Swapping candy mechanic - 5/26
### Matching mechanic - 5/28
### Crushing and gravity mechanic - 5/30 (or until 6/1 if needed)
