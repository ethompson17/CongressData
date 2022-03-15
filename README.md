# There are Two Tables of Data in this Dataset to Download and One Table created in the query file

# Congressional Resignations

This folder contains data behind the story [We’ve Never Seen Congressional Resignations Like This Before](https://fivethirtyeight.com/features/more-people-are-resigning-from-congress-than-at-any-time-in-recent-history/).

`congressional_resignations.csv` contains information about the 615 members of Congress who resigned or were removed from office from March 4, 1901 (the first day of the 57th Congress) through January 15, 2018, including the resigning member’s party and district, the date they resigned, the reason for their resignation and the source of the information about their resignation.

The reasons are categorized as follows:

Code | Category
-----| ---------
`X` | Unwanted sexual contact
`A` | Consensual sex scandals
`B` | Other scandals
`C` | Other office
`D` | Private sector
`E` | Health/family
`F` | Other
`G` | Left early
`H` | Military service
`I` | Election overturned


# Congress Age

This folder contains the data behind the story [Both Republicans And Democrats Have an Age Problem](https://fivethirtyeight.com/features/both-republicans-and-democrats-have-an-age-problem/)

`congress-age.csv` has an entry for every member of congress who served at any point during a particular congress between January 1947 and Februrary 2014.

House membership data is from the [@unitedstates project](http://theunitedstates.io/), with Congress meeting numbers added using code from [GovTrack](https://www.govtrack.us/developers/api):

* https://github.com/unitedstates/congress-legislators
* https://github.com/govtrack/govtrack.us-web/blob/master/us.py#L93

Senate membership data is mostly from the [New York Times Congress API](http://developer.nytimes.com/docs/read/congress_api) combined with birthdays from @unitedstates. (It does not include the birthday of Sen. Elmer Thomas.)

In addition, I added an `incumbent` field to each record.
