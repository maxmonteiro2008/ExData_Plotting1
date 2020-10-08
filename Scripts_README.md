<h1>  Plotting  Scripts Overview</h1>

*Author:Maxwell

*Date:10/07/2020

<h2>Scripts' List</h2>

* plot1.R

* plot2.R

* plot3.R

* plot4.R

<h2>Overall Steps</h2>
All scripts follow  the same steps, but the plot they must do.

**steps**

1. Installs packages

2. Sets English as default config Sys.setlocale("LC_ALL","English")

3. Downloads the Dataset

4. Unzips the Dataset,and put it into the right directory

5. Loads the Database as a table

6. Formats the column Date as.Date()

7. Subsets the Dataset for the desired days 2007-02-01 and 2007-02-02

8. Formats the remaining column as numerics, but Time

9. Creates a new colum join_timecombining Date and Time

10. Creates the PNG device

11.Configs the device

12. plots the required graph

13. colese the device
