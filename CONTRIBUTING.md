# workflows

-   working in Rstudio : <https://inbo.github.io/git-course/workflow_rstudio.html>
-   collaboration : <https://inbo.github.io/git-course/workflow_review.html>

# Local 'moneos' folder on your pc 

## Case 1: you already have a local (git) folder 'moneos' on your computer

-   you have a local folder 'moneos' on your computer from working on the MONEOS report using github in previous year(s)
-   open Rstudio
-   open the project from previous year ('moneos_XXX.Rproj'), where XXX is a previous year

<img width="700" alt="image" src="https://user-images.githubusercontent.com/45075881/229511254-10852610-0eaf-45eb-8347-c8477c045722.png">

-   in the Git side panel, make sure to select the 'main' branch

<img width="300" alt="image" src="https://user-images.githubusercontent.com/45075881/229516889-93711696-89d1-4de0-90bb-10975f84fb9b.png">

-   `pull` ![image](https://user-images.githubusercontent.com/45075881/231096880-4d9c4b7c-930d-4838-99bf-7728baafb278.png) the latest changes from github 

## Case 2: you don't have a local (git) folder 'moneos' on your computer

-   create a new project using 'file' -\> 'New Project...' -\> 'version control' -\> 'git'
    -   add '<https://github.com/inbo/moneos>' to 'repository url'
    -   the name of the project (moneos) should appear automatically; if not, fill it in
    -   choose the parent directory for the moneos project directory
    -   create the project

![image](https://user-images.githubusercontent.com/45075881/170995002-4847b3b7-d0c6-4aef-93c4-48b9470b032d.png)

# Open and setup the moneos project for the current year in Rstudio

-   select 'file' -\> 'open project'
-   under the moneos folder, browse to the subfolder for the year of reporting (folder 'moneos_XXX' where XXX is the current year)
-   select the 'moneos_XXX.Rproj' project

## Rstudio settings for the moneos project

-   under 'Tools' -\> 'Global Options'
    -   under 'R markdown'
        -   check that 'evaluate chunks in directory' is set to 'Project' ![image](https://user-images.githubusercontent.com/45075881/171018619-bb8a6a2e-67b7-4990-9ed0-42a6d004bdcd.png)
-   under 'Tools' -\> 'Project Options'
    -   under 'Build Tools'
        -   check that 'Project Build Tools' is set to ''Website'
        -   check that 'Book output format(s)' is set to 'INBOmd::pdf_report'
        -   check that 'Site directory' is set to '150_geintegreerd_rapport' ![image](https://user-images.githubusercontent.com/45075881/171019335-e213f765-ccab-43df-88bf-92f0ee053fe1.png)

## Add a .Renviron file to the project folder

-   browse to the folder 'moneos/moneos_XXX/000_template', where XXX stands for the year of reporting (e.g. 2022)
-   copy the file '\_.Renviron' to the folder 'moneos/moneos_XXX'
-   rename the '\_.Renviron' under 'moneos/moneos_XXX' to '.Renviron' (remove the underscore '\_')
-   in a text editor or in Rstudio, open the '.Renviron' file and adjust the folder paths to the paths used on your local pc
-   if you are already working in Rstudio, close Rstudio and reopen it

# Moneos chapter branch

-   For each chapter in the moneos report use a separate branch to work in.
-   In doing so you can work independently of other chapters and avoid interference between work done on different chapters. 
-   read <https://inbo.github.io/git-course/workflow_rstudio.html> for more information on working with branches.
-   The chapter branches should be named as follows:  
    -   010_inleiding_en_overzicht
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

-   Check in the git panel in Rstudio (or on github) if the chapter branch you want to work in already exists

<img width="500" alt="image" src="https://user-images.githubusercontent.com/45075881/230022712-02400828-9d98-40cf-a1d6-9aab87ba2443.png">

## Case 1: the moneos chapter branch you intend to work in already exists

-   Select the branch for the chapter you want to work on.

## Case 2: the moneos chapter branch you intend to work in does not yet exist

-   create a new branch for your chapter <img width="60" alt="image" src="https://user-images.githubusercontent.com/45075881/230027175-e753193c-84c9-430d-8e66-bddfcddb97d3.png">

    -   name the branch according to the list above

<img width="400" alt="image" src="https://user-images.githubusercontent.com/45075881/230026926-905f1b81-51c3-452a-8c35-64dd1ca6fa61.png">


# Setup chapter R(md) files

-   While being in your chapter branch:
    -   Under the folder 'moneos/moneos_XXXcurrentYearXXX' create a subfolder for your chapter with the same name as the chapter.
    -   Use this folder to store `.Rmd` files for data management and analysis.

-   The folder 'moneos/moneos_XXXcurrentYearXXX/000_template' contains a number of template/example files for: 
    -   data preparation: '10_template_data.Rmd'
    -   analysis and creation of figures and tables: '20_template_analyse.Rmd'
    -   writing the report: '000_template_rapport.Rmd'

## Case 1: scripting files already exist from previous year(s)
### Data management and analysis scripts
-   Go to the folder 'moneos/moneos_ZZZpreviousYearZZZ/chapterYYY', with _ZZZpreviousYearZZZ_ the year you want to copy from and _chapterYYY_ the chapter of interest.
-   Copy the script files for data management and analysis to the folder 'moneos/moneos_XXXcurrentYearXXX/chapterYYY' you created earlier.   
-   Make sure that the yaml header at the top of these files (between ---) has the correct information. __!!This may change between years!!__
    -   You can check this in the templates for data preparation and analysis in the folder 'moneos/moneos_XXXcurrentYearXXX/000_template'.
    -   Make sure that 'hoofdstuk:' in the yaml header refers to the correct chapter.
    -   You can also specify a different 'title:'.
-   Check that the chunk named '{r pad} corresponds to the examples in the template directory.

### Bookdown script for writing the chapter report
-   Under 'moneos/moneos_XXXcurrentYearXXX/150_geintegreerd_rapport' copy the bookdown script file from a previous year.
-   Make sure the file has the same name as the chapter branch.
-   Check that the chunks at the top of the file (chunks -hoofdstuk to -pad) correspond to the example as given in the '000_template.Rmd' file in the template directory ('moneos/moneos_XXXcurrentYearXXX/000_template'). __!!This may change between years!!__
-   Make sure that the variable 'hoofstuk' in the top chunk is specified correctly for your chapter.
-   Make sure to start the name of all chunks with the number of the corresponding chapter: 
    -   {r XXX-chunkname} with XXX the number of the chapter (in the templates this number is 000)

## Case 2: no scripting files exist yet for the current chapter

-   follow the guidelines as above but use the template files in the folder 'moneos/moneos_XXXcurrentYearXXX/000_template' as a starting point.

# Working on a chapter

-   The following applies both for data analysis as for writing the report.
-   Make sure to be in the git branch for the chapter you want to work on.
-   make a habit of `pulling` ![image](https://user-images.githubusercontent.com/45075881/231096746-42c55df8-61b7-4a54-86c8-9561f2158553.png) potential work of others to the chapter, before you start to apply changes. 
    -   In doing so, you are sure to work on the latest version.
    -   A good habit is to do this daily.
-   On a regular basis (e.g. daily, at the end of the day) `commit` ![image](https://user-images.githubusercontent.com/45075881/231097461-beb20592-1e46-407a-8c2c-6913713b915c.png) and `push` ![image](https://user-images.githubusercontent.com/45075881/231096204-e9a59481-4790-4b8f-9545-3a9132750d23.png) your changes to github.
    -   In doing so, you ensure that they are visible to coworkers, and they can incorporate the changes in their version.

### Commiting changes
-   Select the files you want to commit from the git sidepanel

![image](https://user-images.githubusercontent.com/45075881/231098543-db8e6ae0-9878-49a9-84df-547d723e5817.png)

-   In the commit window
    -   Add a sensible 'commit message' to the committed changes.
    -   Hit the `commit` button.

![image](https://user-images.githubusercontent.com/45075881/231098773-a0cf7ba8-893a-4e54-8076-001c783a2e6f.png)

-   You can subsequently `push` ![image](https://user-images.githubusercontent.com/45075881/231096204-e9a59481-4790-4b8f-9545-3a9132750d23.png) the changes to github from the commit window or from the main github sidepanel.

# Working in `Visual` mode

-   To write the chapter report, it can be useful to use the `Visual` mode in the RStudio editing panel.

![image](https://user-images.githubusercontent.com/45075881/231721587-8515138d-386a-4c16-81f0-f76d83e1ca7d.png)

-   `Visual` mode works as a text editor and thus facilitates text editing. 
  
![image](https://user-images.githubusercontent.com/45075881/231722730-6ae5da1b-280e-45d9-8b3c-c12b7e209248.png)

-   To collapse (hide) the R code chunks you can choose `Collapse all` under `Edit` -> `Folding`.

![image](https://user-images.githubusercontent.com/45075881/231721255-b0a640de-bee7-4426-8b97-b4de27d18c45.png)

-   To visualize figures and tables, you can run `Run all`.

![image](https://user-images.githubusercontent.com/45075881/231723955-8c18cf05-ae5f-4691-8549-637fb8d37c44.png)

![image](https://user-images.githubusercontent.com/45075881/231724596-fd3071dd-9483-46b8-b378-d9450c54ecc6.png)

-   Under `Tools` -> `Project Options` -> `Spelling` you can set the dictionary language, which enables spell checking in the designated language.

![image](https://user-images.githubusercontent.com/45075881/231725551-0163bd39-8ec3-4f24-b823-330d756d6c33.png)

-   Co-authors can add comments blocks (which will not be rendered in the pdf report) during reviewing.

![image](https://user-images.githubusercontent.com/45075881/231726186-2f240adc-ce20-47ea-badd-ac210f3aad2b.png)

# Building the report pdf

-   To build the report, go to the tab 'Build'.
-   Make sure the 'pdf_report' is selected under 'build book'.
-   Hit the build book button.

![image](https://user-images.githubusercontent.com/45075881/171016595-b1a3f3a1-d8b6-4d5b-80f7-9f787fcc9827.png)

-   When other chapters have been merged with main and are visible in your branch (see below).
    -   You can hide them by putting an underscore '\_' in front of the chapter `.Rmd` filename.
    -   Make sure to remove these underscores before merging with the main branch.

## Avoiding build problems 

-   Don't use '%' as is in captions of figures and tables.
    -   Use '\\\\%' instead. 

![image](https://user-images.githubusercontent.com/45075881/231728266-bf3428ca-81f7-45b1-b357-2c12335f8aec.png)

-   Don't use underscore '\_' in column names of tables.


# Merging your branch with the main branch (pull request)

-   make sure you merged the latest version of the main branch (potentially comprising already merged chapters) into your chapter branch before you make a pull request
    -   to merge the latest version of the main branch
        -   see <https://inbo.github.io/git-course/workflow_review.html#Merge_changes_to_main>
        -   switch to the main branch in Rstudio
        -   hit the `pull` button
        -   switch back to your chapter branch
        -   open the (Git) Shell and enter the command: 'git merge main'

![image](https://user-images.githubusercontent.com/45075881/171647731-3d398ea2-6f20-4e03-8e40-3841f4e890b7.png) 
![image](https://user-images.githubusercontent.com/45075881/171015844-d28f3385-cfef-4727-8457-dc000c56ce89.png)

-   create a pull request as explained in <https://inbo.github.io/git-course/workflow_review.html#Create_a_pull_request>
-   a reviewer is mandatory to make a pull request; choose Joost Vanoverbeke as reviewer
-   some checks are performed when you make a pull request. This may take a little time to finish

![image](https://user-images.githubusercontent.com/45075881/171813020-738149a3-cb49-4e66-818d-77979a42e415.png)
![image](https://user-images.githubusercontent.com/45075881/171812792-974b89a7-fa56-48cf-ab1b-2a7b41b1494c.png)

# Avoiding GIT conflicts

-   In the first phase, only work in your own branch and on your own chapter (chapter directory and chapter `.Rmd` files)
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
