# Database-Disaster
Managing public record data into a searchable table that can be easily appended or edited
## Hello to anyone brave enough to delve into this mishap of a project! ##

########################SUMMARY###################################

To summarize what I am attempting, I have data that is currently in the format of:
EntryNumber /n FirstName,LastName /n Address /n


Where "/n" is a new line. For example:

1.
John Denver
123 Rocky Mountain Dr
2.
Jane Doe
321 Valley Ln

and I would like to be able to organize it into rows rather than one long column like so:

1.	John Denver	123 Rocky Mountain Dr
2.	Jane Doe	321 Valley Ln


So far I have only tried macros in excel to accomplish this, but I am hoping to find a better way. A full 
disclosure: I have NO experience with SQL Server, or Databases at all for that matter. 





###############DATA SOURCE#############################################

The data that I am trying to organize is public record, however it is obtained through private means. The
data comes from a website (which requires authentication. I am using a powershell Invoke-Webrequest script
to scrape the data which is then parsed using Regex to get rid of the HTML and clutter. What I am left with 
is a long list of relevant data, that is hard to organize and read.  



##############DISCLAIMER##############################################

This is my first attempt at getting help on any project and I apologize if the info is not consice or if it 
is lacking any neccessary info. Thanks in advance for anyone willing to help in any way!


