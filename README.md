![](images/cover-photo-2.jpg)

### ABOUT THE PROJECT:

This research is conducted to examine the impact of the **COVID-19** pandemic on global health using **SQL**. The project aims to analyze publicly available dataset in order to extract valuable insights regarding the extent and severity of the virus.

During the [**data exploration phase**](https://nlaeeq.github.io/Covid19_DataExploration/), an unstructured analysis of a significant COVID-19 dataset was performed to detect preliminary patterns, characteristics, and focal points.

In the **data cleaning phase** of this project, my priority is to verify the integrity and comprehensiveness of the data, with the aim of obtaining trustworthy insights. Also I will ensure to rectify any incorrect or missing values, getting rid of duplicate values and making sure that the data format is consistent. The importance of this stage cannot be overlooked as it is vital in obtaining accurate findings from the preliminary data exploration process.

<br>

### DATASET OVERVIEW:

For this project, I have used [Coronavirus (COVID-19) Deaths](https://ourworldindata.org/covid-deaths) dataset, which has been published on Our World In Data website, completely open access under the [Creative Commons BY license](https://creativecommons.org/licenses/by/4.0/).  This dataset updates on weekly basis and includes values since 3rd January 2020.

**Citation:**

Edouard Mathieu, Hannah Ritchie, Lucas Rodés-Guirao, Cameron Appel, Charlie Giattino, Joe Hasell, Bobbie Macdonald, Saloni Dattani, Diana Beltekian, Esteban Ortiz-Ospina and Max Roser (2020) - "Coronavirus Pandemic (COVID-19)". Published online at OurWorldInData.org. Retrieved from: 'https://ourworldindata.org/coronavirus' [Online Resource]

<br>

### DATA CLEANING:

Below is the working that I have done in Microsoft SQL Server to clean the dataset.

<style type="text/css">
  .gist {width:100% !important;}
  .gist-file
  .gist-data {max-height: 500px;max-width: 100%;}
</style>

<script src="https://gist.github.com/nlaeeq/68844ae4d69935853ed3ae67e3b93f56.js"></script>

<br>

### STEPS INVOLVED IN DATA CLEANING:

**Filtering accumulated rows of dataset:**

The dataset has been created in such a way that includes rows for Africa, Asia, Europe, European Union, North America, Oceania, South America and World to the complete dataset. This is good for facilitating accessibility, but it does not serve the purpose for the current study. As these are the total of all countries in those continents, and it would make comparing data for individual countries inaccurate.

**Filtering out income categories from Location column:**

Moreover it has been noted that there exist newly introduced income parameters in the designated location column, but we do not need them for our analysis.

•	Low income

•	Lower middle income

•	Upper middle income

•	High income

These rows have been filtered out of the dataset.

**Filtering out locations which are part of United Kingdom:**

England, Northern Ireland, Scotland and Wales, these all are the part of United Kingdom. However they also have been listed separately in the Location column. So we will filter out all these rows, as no data has been entered against these locations.

**Checking for duplicate values and Country data:**

There are 195 countries in the world. However, the dataset shows a total of 249 rows. Upon investigation, it has been found that few territories are added separately in the dataset, which collectively forms the part of a country, as per the above mentioned example of United Kingdom. Moreover, a number of territories exist that lack official recognition as independent nations, yet have provided Covid-19 related information to the World Health Organization.

**Filtering other Countries and territories having NULL values:**

Some of the countries and territories shows null values which includes Hong Kong, Macao, North Korea, Northern Cyprus, Taiwan, Turkmenistan and Western Sahara.  They also need to be filtered out before proceeding to the visualization phase.

**Changing date format from DATETIME to DATE (YEAR-MONTH-DAY):**

The current format of the date incorporates a timestamp that lacks functional significance. Therefore it needs to be converted from a date-time format to year-month-day format.

<br>

### NEXT AGENDA:

In the next phase of this project, I will be **visualizing this data** in **Tableau**. The visualization stage plays a vital role in effectively conveying the impact of the pandemic, and it will serve as the concluding phase of this project.

<br>

**Thank you for reading this project.**
