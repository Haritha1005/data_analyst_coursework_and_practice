# Haritha - Data Analysis Portfolio

Welcome to my Data Analysis portfolio! Below you'll find a collection of projects and work samples that showcase my skills and experience in the field of Data Analytics.

## Table of Contents
- [About](#about)
- [Portfolio Projects](#portfolio-projects)
  - [Python Projects](#python-projects)
    - [App Ratings Prediction](#app-ratings-prediction)
    - [Insurance Data Analysis](#insurance-data-analysis)
  - [SQL Projects](#sql-projects)
    - [ScienceQtech Employee Performance Mapping](#scienceqtech-employee-performance-mapping)
    - [Air Cargo Analysis](#air-cargo-analysis)
  - [Power BI Reports](#power-bi-reports)
    - [HR Analytics Project](#hr-analytics-project)
    - [Zomato Project](#zomato-project)  
  - [R Projects](#r-projects)
    - [Bike Rental Prediction](#bike-rental-prediction)
  - [Excel / Google Sheets](#excel--google-sheets)
  - [Tableau](#tableau)
  
- [Education](#education)
- [Certificates](#certificates)
- [Contact](#contact)

## About

Hi, I'm Haritha. With one year of experience at Incedo, I've been working as an Associate for AssetMark, a leading asset management firm. My role revolves around supporting both internal stakeholders, such as financial advisors, and external stakeholders, including investors. On a daily basis, I perform validation checks on customer funds and data, generate reports, and provide status updates to our internal team. I hold a BSc in Computer Science from Anna Adarsh College and recently obtained a data analytics certification from Simplilearn. In my free time, I enjoy reading books on personal finance and financial markets, I am excited to bring my technical and analytical skills to the field of data science as an entry-level data specialist.

During my studies, I honed my ability to work with complex data and developed a keen eye for identifying patterns and trends. I also gained experience in laboratory techniques, data management, and statistical analysis, which I believe will be valuable assets in my role as a data Analyst and I am always looking for opportunities to expand my knowledge and skills. Whether working on a team or independently, I am driven by the thrill of discovering new insights and the satisfaction of using data to solve complex problems.

## Portfolio Projects

In this section, I will list data analytics projects briefly describing the technology stack used to solve cases.

### Python Projects

#### App Ratings Prediction

- **Code**: [App Ratings Prediction.ipynb](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/App%20Ratings%20Prediction.ipynb)
- **Goal**: To build a model to predict the app rating based on various features provided in the Google Play Store dataset.
- **Description**: The project involves thorough data analysis and preprocessing steps to clean and prepare the dataset for model building. It includes handling null values, correcting data types, performing outlier treatment, and conducting univariate and bivariate analysis to understand the relationship between different features and the target variable (app rating). The project also includes feature engineering, such as creating dummy variables for categorical features, and splitting the dataset into training and testing sets. Finally, a linear regression model is built to predict app ratings, and the performance of the model is evaluated using the R2 score.
- **Skills**: Data preprocessing, exploratory data analysis (EDA), feature engineering, linear regression, model evaluation.
- **Technology**: Python, Pandas, NumPy, Matplotlib, Seaborn, Scikit-learn.
- **Results**: The linear regression model achieved an R2 score of 0.1346 on the test set and 0.1946 on the train set. This indicates that the model explains 13.46% of the variance in the test data and 19.46% in the train data.

#### Insurance Data Analysis

- **Code**: [Insurance Data Analysis.ipynb](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/Insurance%20Data%20Analysis.ipynb)
- **Goal**: To analyze the insurance dataset and create a model to predict the cost of medical insurance based on various input features.
- **Description**: An insurance agency, ABC Insurance, wants to perform exploratory data analysis (EDA) on their dataset containing information about policyholders and claims to gain insights for better business decisions.
- **Skills**: Data analysis, Exploratory data analysis (EDA), Data visualization, Feature engineering, Machine learning modeling.
- **Technology**: Python, Pandas, Matplotlib, NumPy, Seaborn, Scikit-learn.
- **Results**: Using Python and various data analysis libraries, the project successfully analyzed the insurance dataset. Key findings included the relationship between age, BMI, smoking status, and insurance charges. A machine learning model was built to predict insurance charges based on input features.

### SQL Projects

#### ScienceQtech Employee Performance Mapping

- **Code**: [ScienceQtech Employee Performance Mapping.sql](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/ScienceQtech_Employee_Performance_Mapping.sql)
- **Goal**: To analyze employee details, performance, and projects within ScienceQtech to derive insights for organizational improvement.
- **Description**: This project focused on analyzing the employee database of ScienceQtech, a startup in the Data Science field. The dataset comprised employee information such as roles, departments, experience, salaries, performance ratings, and projects undertaken. Utilizing SQL queries, the analysis aimed to extract relevant insights on employee performance and project involvement. Key tasks included data importing, database creation, SQL queries execution, and performance optimization.
- **Skills**: Data importing, Database management, SQL querying, Data analysis and reporting.
- **Technology**: MySQL Workbench, SQL.
- **Results**: The project provided insights into employee performance and project engagement within ScienceQtech. This included identifying high-performing employees, analyzing project contributions, and assessing performance trends. The analysis facilitated data-driven decision-making to enhance organizational effectiveness and identify areas for employee development.

#### Air Cargo Analysis

- **Code**: [Air Cargo Analysis.sql](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/Air%20Cargo%20Analysis.sql)
- **Goal**: To identify regular customers, analyze busiest routes, and determine ticket sales details to improve operational efficiency and customer satisfaction at Air Cargo.
- **Description**: This project involved analyzing the dataset of Air Cargo, an aviation company, to identify regular customers for targeted offers, analyze busiest routes for resource allocation, and determine ticket sales details to improve operational efficiency. SQL queries were used to extract relevant information from tables such as Customer, Passengers_on_flights, Ticket_details, and Routes. Tasks included creating an ER diagram, writing queries for data extraction and analysis, implementing constraints, and creating stored procedures and views for efficient data retrieval.
- **Skills**: Data importing, Database management, SQL querying, Data analysis and reporting.
- **Technology**: MySQL Workbench, SQL.
- **Results**: Identified key regular customers who could be targeted with personalized offers, enhancing customer retention. Analyzed the busiest routes, leading to better allocation of aircraft and crew resources. Generated detailed ticket sales reports, providing insights into revenue patterns and helping to optimize pricing strategies.

### Power BI Reports

#### HR Analytics Project

- **Goal**: To analyze HR data for insights on employee demographics, attrition rates, and overall employee wellness.
- **Description**:
  - **Data Cleaning**: Removed redundant columns, renamed columns, dropped duplicates, cleaned individual columns, and handled NaN values.
  - **Data Visualization**: Created correlation maps and various charts (bar, donut, and stacked column charts) to analyze relationships between different HR metrics.
  - **Dashboards**:
    - Overview: Summary of all dashboards.
    - Demographic Insights: Key demographic data.
    - Turnover Analysis 1: Attrition by education field, marital status, and job role.
    - Turnover Analysis 2: Attrition by business travel, department, and years in current role.
    - Employee Wellness: Environmental satisfaction, job involvement, relationship satisfaction

, performance rating, and work-life balance.
  - **Conclusion**: The project provided actionable insights into factors influencing employee attrition and overall wellness, aiding in strategic HR decision-making.
- **Link to Power BI Report**: [HR Analytics Report](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/HR-Employee-Attrition.pbix)

#### Zomato Project

- **Goal**: To analyze the Zomato dataset to understand the distribution of restaurants, analyze ratings, and identify trends in customer reviews.
- **Description**:
  - **Data Cleaning**: Processed the dataset to remove duplicates, handle missing values, and standardize data formats.
  - **Data Visualization**: Created various charts (bar, line, and pie charts) to visualize restaurant distribution by location, cuisine, and rating distribution.
  - **Analysis**: Analyzed factors influencing restaurant ratings and customer reviews, identified popular cuisines and high-demand areas.
- **Skills**: Data cleaning, Data visualization, Exploratory data analysis (EDA), Trend analysis.
- **Technology**: Power BI.
- **Result**: The Zomato project provided insights into restaurant trends, popular cuisines, and factors affecting ratings. This analysis helps in understanding market dynamics and can guide business decisions for restaurant management and marketing strategies.
- **Link to Power BI Report**: [Zomato Data Manipulation and Reporting](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/Zomato%20Data%20Manipulation%20and%20Reporting.pbix)

### R Projects

#### Flight Data Analysis

- **Code**: [Flight Data Analysis.R](https://github.com/Haritha1005/DATA-ANALYSIS-PORTFOLIO/blob/main/Flight%20Data%20Analysis.R)
- **Goal**: The goal of the Flight Data Analysis project is to analyze flight data to understand the effect of various factors, such as weather conditions and other variables, on flight delays. By visualizing the data using histograms, scatter plots, box plots, and pie charts, the project aims to gain insights into the patterns and relationships within the dataset.
- **Description**: The project involves reading and understanding a flight dataset, identifying null values, and installing required packages. It then proceeds to analyze the data by plotting histograms to visualize the relationships between scheduled time, carrier, destination, origin, weather, and day of the week. Additionally, scatter plots are created to compare flights on time and delayed, while box plots depict delays by day of the month. The project also involves defining hours of departure, creating a categorical representation of data using a table, and redefining delay variables if necessary.
- **Skills**: Data importing and manipulation, Data visualization using histograms, scatter plots, box plots, and pie charts, Exploratory data analysis (EDA).
- **Technology**: R programming language, Packages: readxl, plotly, dplyr.
- **Result**: The result of the Flight Data Analysis project includes visualizations that provide insights into the relationships between various variables and flight delays. These visualizations aid in understanding the impact of weather conditions, scheduled time, carrier, destination, and other factors on flight delays, thus helping in making informed decisions to improve operational efficiency and customer satisfaction in the aviation industry.

## Education

- **Masters Program - Data Analyst**: Simplilearn Certified in collaboration with IBM, 2023 - 2024
- **University of Madras, Bachelor's degree, Computer Science** 2017 - 2020

## Certificates

- [Business Analytics with Excel Certification](https://acrobat.adobe.com/id/urn:aaid:sc:AP:7dcd18f7-d973-42f1-8ab1-b7b05b6d6426) (Simplilearn)
- [SQL training](https://acrobat.adobe.com/id/urn:aaid:sc:AP:163dab00-24c4-40d5-af41-6dcd32c13bc7) (Simplilearn)
- [Python for Data Science](https://acrobat.adobe.com/id/urn:aaid:sc:AP:2cba046a-d01d-4b33-a643-49729049a9f0) (IBM)
- [CFA Institute Investment Foundations](https://credentials.cfainstitute.org/2750fd3f-dc53-469f-bdfd-a68f1f2f1f31#gs.8wstql) (CFA Institute)
- [PL-300 Microsoft Power BI Training ](https://certificates.simplicdn.net/share/6796191.pdf) (Simplilearn)

## Contact

- [LinkedIn](https://www.linkedin.com/in/haritha1005/)
- Email: haritha110287@gmail.com

