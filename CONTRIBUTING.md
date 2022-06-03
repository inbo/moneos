# workflows

-   working in Rstudio : <https://inbo.github.io/git-course/workflow_rstudio.html>
-   collaboration : <https://inbo.github.io/git-course/workflow_review.html>

# setup

### copy the moneos project to your pc

-   if you have a folder 'moneos' existing on your local computer, delete it (make sure to back up files you migh still need somewhere else!)
-   open Rstudio
-   create a new project using 'file' -\> 'New Project...' -\> 'version control' -\> 'git'
    -   add '<https://github.com/inbo/moneos>' to 'repository url'
    -   the name of the project (moneos) should appear automatically; if not, fill it in
    -   choose the parent directory for the moneos project directory
    -   create the project

![image](https://user-images.githubusercontent.com/45075881/170995002-4847b3b7-d0c6-4aef-93c4-48b9470b032d.png)

### add a .Renviron file

-   browse to the folder 'moneos/moneos_XXX/000_template', where XXX stands for the year of reporting (e.g. 2022)
-   copy the file '\_.Renviron' to the folder 'moneos/moneos_XXX'
-   rename the '\_.Renviron' under 'moneos/moneos_XXX' to '.Renviron' (remove the underscore '\_')
-   in a text editor or in Rstudio, open the '.Renviron' file and adjust the folder paths to the paths used on your local pc
-   if you are already working in Rstudio, close Rstudio and reopen it

# open the moneos project for a given year in Rstudio

-   select 'file' -\> 'open project'
-   under the moneos folder, browse to the subfolder for the year of reporting (folder 'moneos_XXX' where XXX is the year)
-   select the 'moneos_XXX.Rproj' project

# Rstudio settings for the moneos project

-   under 'Tools' -\> 'Global Options'
    -   under 'R markdown'
        -   check that 'evaluate chunks in directory' is set to 'Project' ![image](https://user-images.githubusercontent.com/45075881/171018619-bb8a6a2e-67b7-4990-9ed0-42a6d004bdcd.png)
-   under 'Tools' -\> 'Project Options'
    -   under 'Build Tools'
        -   check that 'Project Build Tools' is set to ''Website'
        -   check that 'Book output format(s)' is set to 'INBOmd::pdf_report'
        -   check that 'Site directory' is set to '150_geintegreerd_rapport' ![image](https://user-images.githubusercontent.com/45075881/171019335-e213f765-ccab-43df-88bf-92f0ee053fe1.png)

# create a moneos chapter branch

-   read <https://inbo.github.io/git-course/workflow_rstudio.html>
-   create a new branch for your chapter
    -   name the branch according to:
        -   010_inleiding
        -   020_overzicht
        -   030_ecotopen
        -   040_vegetatiekaart
        -   050_hogere_planten
        -   060_sedimentkenmerken
        -   070_macrozoobenthos
        -   080_hyperbenthos
        -   090_vissen
        -   100_watervogels
        -   110_broedvogels
        -   120_zoogieren
        -   130_sedimentatie_erosie
        -   140_slik_schorrand
-   while being in your chapter branch
    -   under 'moneos/moneos_XXX/150_geintegreerd_rapport' create a `.Rmd` file for your chapter
        -   name this file the same as the branch
        -   you can use the file '000_template.Rmd' under 'moneos/moneos_XXX/000_template' as template
            -   make sure to change the variable 'hoofstuk' in the template .Rmd to the name of your chapter
            -   make sure to replace the '000' in the Rmd chunk titles with the number of your chapter
        -   instead of creating a new file, you can also copy from a previous version of the report
            -   **but** make sure to check that the chunks at the top of the file (chunks -hoofdstuk to -pad) correspond to the example as given in the 000_template.Rmd file
    -   under the folder 'moneos/moneos_XXX' create a subfolder for your chapter with the same name as the chapter
        -   use this folder to store `.Rmd` files for data management and analysis
        -   examples of such files are given in the folder 'moneos/moneos_XXX/000_template'
        -   make sure that the yaml header at the top of these files (between ---) has the correct information (copy from the templates and change 'hoofdstuk:' and 'title:')

# building the report pdf

-   to build the report, go to the tab 'Build'
-   make sure the 'pdf_report' is selected under 'build book'
-   hit the build book button

![image](https://user-images.githubusercontent.com/45075881/171016595-b1a3f3a1-d8b6-4d5b-80f7-9f787fcc9827.png)

-   when other chapters have been merged with main and are visible in your branch (see below)
    -   you can hide them by putting an underscore '\_' in front of the chapter .Rmd filename
    -   make sure to remove these underscores before merging with the main branch

# merging your branch with the main branch (pull request)

-   create a pull request as explained in <https://inbo.github.io/git-course/workflow_review.html#Create_a_pull_request>
-   make sure you merged the latest version of the main branch (potentially comprising already merged chapters) into your chapter branch before you make a pull request
    -   to merge the latest version of the main branch
        -   see <https://inbo.github.io/git-course/workflow_review.html#Merge_changes_to_main>
        -   switch to the main branch in Rstudio
        -   hit the 'pull' button
        -   switch back to your chapter branch
        -   open the (Git) Shell and enter the command: 'git merge main'

![image](https://user-images.githubusercontent.com/45075881/171647731-3d398ea2-6f20-4e03-8e40-3841f4e890b7.png) 
![image](https://user-images.githubusercontent.com/45075881/171015844-d28f3385-cfef-4727-8457-dc000c56ce89.png)

-   a reviewer is mandatory; choose Joost Vanoverbeke as reviewer

![image](https://user-images.githubusercontent.com/45075881/171813020-738149a3-cb49-4e66-818d-77979a42e415.png)
![image](https://user-images.githubusercontent.com/45075881/171812792-974b89a7-fa56-48cf-ab1b-2a7b41b1494c.png)

-   some checks are performed when you make a pull request. This may take a little time to finish

# avoiding GIT conflicts

-   In the first phase, only work in your own branch and on your own chapter (chapter directory and chapter .Rmd files)
-   if contribution to another chapter is needed
    -   work in the branch for that chapter
    -   communicate between contributors and make good agreements on who works when on the chapter
    -   make sure to `pull` changes made by others before you start working on the chapter
    -   make sure to `commit` and `push` your changes when you have finished
-   In the last phase, when chapters have been merged and a few modifications are needed
    -   communicate about the intended changes
    -   make sure to always merge the latest version of the main branch into your chapter branch before starting
        -  see <https://inbo.github.io/git-course/workflow_review.html#Merge_changes_to_main>
    -   keep the changes short and merge quickly (pull request) with the main branch
