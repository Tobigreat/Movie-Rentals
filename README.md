# Movie-Rentals
You and your business partner were recently approached by another local business owner interested in purchasing your movie rental Business. He primarily owns restaurants and bars, so  he has lots of questions about your business and the rental business in general.

**Disclaimers**: All datasets and reports do not represent any company, institution, or country, but just a sample dataset to demonstrate capabilities and upskills in SQL.

## Problem Statement

I am excited about the potential acquisition and learning more about your rental business. Please bear with me as I am new to the industry. I have a number of questions for you. Assuming you can answer them all, and that there are no major surprises, we should be able to move forward with the purchase. 

## Objectives 
Leverage your SQL skills to extract and analyze data from various tables in the Movies Database to answer you potential Acquirer’s questions. Each question will require you to write a multi-table SQL query, joining at least two tables. 

## Skills:
The set of skills were used for the optimization of the analysis, which were: 
1. Create of database (new schema)
2. Create a table based on the field name,
3. Populate the data into the table created at each field,
4. Verify that data populated in the field,
5. Analyse the data,
## Data source:
https://onedrive.live.com/?authkey=%21ALp3YXmzM1z9AMw&id=CC0266B40F753FB5%2125874&cid=CC0266B40F753FB5 

## Data transformation 
Data was opened into Excel to study the data pattern which was later profiled, sorted and filtered to ensure the data types, remove nulls, duplicates, and empty cells and to ensure the data was ready for use. 

## Analysis
MySQL were used to run the analysis including the data manipulation. 

## Use the resources to answer the following business questions.
1. My partner and I want to come by each of the stores in person and meet the managers. Please send over the managers' names at each store, with the full address of each property (street address, district, city, and country).
2. I would like to get a better understanding of all of the inventory that would come along with the business. Please pull together a list of each inventory item you have stocked, including the store_id number, the inventory_id, the name of the film, the film's rating, its rental rate, and replacement cost.
3. From the same list of films you just pulled, please roll that data up and provide a summary-level overview of your inventory. We would like to know how many inventory items you have with each rating at each store.
4. Similarly, we want to understand how diversified the inventory is in terms of replacement costs. We want to see how big of a hit it would be if a certain category of film became unpopular at a certain store. We would like to see the number of films, as well as the average replacement cost, and total replacement cost, sliced by store and film category.
5. We want to make sure you folks have a good handle on who your customers are. Please provide a list of all customer names, which store they go to, whether or not they are currently active, and their full addresses (street address, city, and country).
6. We would like to understand how much your customers are spending with you and also to know who your most valuable customers are. Please pull together a list of customer names, their total lifetime rentals, and the sum of all payments you have collected from them. It would be great to see this ordered on total lifetime value, with the most valuable customers at the top of the list.
7. My partner and I would like to get to know your board of advisors and any current investors. Could you please provide a list of advisor and investor names in one table? Could you please note whether they are an investor or an advisor, for the investors, it would be good to include which company they work with.
8. We're interested in how well you have covered the most-awarded actors. Of all the actors with three types of awards, for what % of them do we carry a film? And how about actors with two types of awards? Same questions. Finally, how about actors with just one award?

