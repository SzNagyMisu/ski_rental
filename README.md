# README

Ruby version: 2.3.3

Rails version: 5.0.1

## Important information
  * the application has seeds
  * the value of constants RENTAL_DAYS_MAX, RENTAL_DAILY_PRICE and FINE_DAILY_PRICE can be modified
    in the model `Rental` - if so, it must be done before `rails db:seed`, because it uses those values

### Parts of the application
  * Main page (root)
  * Boxes (/boxes)
    * table of the boxes
    * green: available, link to new rental for the box
    * red: occupied, link to its rental
  * Active rentals (/rentals)
    * table of active rentals
    * show for every row
      * details of rental, possibility to edit (prolong, correct name, identifier) or end rental
    * query form for ticket serial (=> /rentals/search)
    * link to new rental
      * choose box, give name and identifier for customer and days count (1..3) - counts price to pay
      * validation for inputs
      * clicking on the submit button means the customer has payed the price
  * Total rentals (/rentals/total)
    * all (active and ended) rentals
    * additional information: is active?
    * show for all rows
      * ended rentals cannot be ended but have additional data: ended date
  * language selector
    * possibility to switch between English and Hungarian
