# Data Analyst Portfolio, Oleksandr Detsyk
## About me
Greetings! 
I am Oleksandr, a data analyst with experience in data analytics and finance. I believe in having a wide spectrum of interconnected lattices of knowledge, which is why this portfolio features projects in Data Engineering, Data Analysis, and Quantitative Analysis.

## 🛠️ Technical skills
- PostgreSQL
- MySQL
- Snowflake
- Excel
- Python 
- Power BI 
- Keboola

## Portfolio projects
It showcases my proficiency in data cleaning, predictive modeling, and financial forecasting, demonstrating my ability to transform raw data into meaningful insights. Each project reflects my skills in tracking KPIs, creating impactful visualizations, and developing simulations that improve business efficiency.

### 📕 Book Recommender
  **Description:** The Book Recommender is a Python-based application that generated a list of recommended books by analyzing statistical correlations between user preferences and an extensive database of book ratings. By processing parameters like title and author's name, the system identifies and retrieves title with the highest similarity coefficients to the user's input. The system handles errors for invalid inputs, incomplete book titles and typos.
   
  **Goal:** To create a robust, highly-tunable, user-friendly command-line tool that delivers personalized book recommendations based on a user's favorite book. 
   
  **Challenge:** The primary obstacle was data inconsistency within the large dataset. Multiple variations of the same book title (e.g., "The Lord of the Rings Part I" vs. "The Lord of the Rings: The Fellowship of the Ring") threatened the accuracy of the correlation matrix.

   - Python code: [`Book Recommender`](https://github.com/SashaD826/Portfolio/blob/main/book_recommender2.ipynb)
   
  **Results:** I implemented a string matching algorithm (fuzzy wuzzy library) to resolve title differences and handle user input errors effectively. The final application successfully normalizes the dataset and delivers a list of recommended books, ensuring a seamless user experience even with ambiguous inputs.
   
  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/arashnic/book-recommendation-dataset?select=Ratings.csv)
### 🚲 Bike Sales Breakdown
  **Description:** This project involves a granular analysis of a bike store's order data over a one-month period. The dataset encompasses critical financial and operational metrics, including revenue, cost of goods sold, customer demographics, providing a detailed description of store operations.
  
  **Goal:** To conduct an Exploratory Data Analysis (EDA) that describes store performance over time. The objective is to visualize crucial KPIs and identify opportunities to increase efficiency and revenue.
  
  **Challenge:** The raw data presented certain data quality issues, including duplicates, missing values, inconsistent product descriptions, missing and incorrect numeric values.
  
  - SQL code: [`Bike Sales SQl`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales_mysql.sql)
  
  - Python code: [`Bike Sales Python`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales.ipynb)
  
  - Excel Worksheet: [`Bike Sales Excel`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales_data.xlsx)
  
  - Power BI Dashboard: [`Bike Sales Power BI`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales_bi.pbix)

  **Results:** The final report shows crucial business intelligence insights, including revenue trends, a distribution analysis of order sizes (basket size), and revenue segmentation by weekday, region, and product category.

  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/ratnarohith/uncleaned-bike-sales-data/data)
 ### 🧑‍💻 IBM Employees Evaluation
  **Description:** Dataset contains information about IBM Employees: their Job Satisfaction, Education Level, Hourly Rate, Experience, etc.

  **Goal:** To analyse IBM employees' performance, identify key trends to optimize workforce productivity.
  
  **Challenge:** Complex Dataset, some columns are indexed, instead of containing readable data.

  - SQL code: [`IBM Employees SQL`](https://github.com/SashaD826/Portfolio/blob/main/ibm_employees_mysql.sql)

  - Power BI Dashboard: [`IBM Employees Power BI`](https://github.com/SashaD826/Portfolio/blob/main/ibm_employees_bi.pbix)

  **Results:** Crucial data about employees. Trends of their performance depending on age, education, experience.
  
  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
 ### 💰🌎 IT salaries all over the world
  **Description:** This simple yet useful dashboard that shows salaries for different employment types and positions in numerous countries.

  **Goal:** To get statistical data for multiples positions. Can be used for Machine Learning, for example.
  
  **Challenge:** The dataset is vast, requiring careful handling as values cannot be directly compared without segmentation. Implementing slicers enables precise filtering and meaningful comparisons, ensuring accurate insights from the complex data.

  - Python Code: [`IT Salaries Python`](https://github.com/SashaD826/Portfolio/blob/main/it_salaries.ipynb)

  - Power BI Dashboard: [`IT Salaries Power BI`](https://github.com/SashaD826/Portfolio/blob/main/it_salaries_bi.pbix)

  **Results:** A Dashboard with key statistical indicators and multiple slicers that enables to compare jobs depending on employment type, company location, experience level or job title itself.
  
  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/saurabhbadole/latest-data-science-job-salaries-2024)
   ### 📊 Automated Portfolio Rebalancing
  **Description:** This simple, but useful Python code helps with rebalancing the portfolio: calculates number of shares that has to be purchased, and the amount that has to be spent per position.

  **Goal:** To automate the process to make it more effective. Just import the file, set the composition thresholds and code will do all the work.
   
  **Challenge:** For the purpose of tax optimization, no shares can be sold, only buying is allowed.

  - Python code: [`Portfolio Rebalancing Python`](https://github.com/SashaD826/Portfolio/blob/main/portfolio_rebalancing.ipynb)

  **Results:** Goal achieved, but to make the code even better API should be used to fully automate the process.

  **Data Source:** [Portfolio Composition CSV](https://github.com/SashaD826/Portfolio/blob/main/etf_portfolio_rebalancing.csv)
   ### 💻🔮💰 Monte Carlo Simulation for a Stock Portfolio
  **Description:** This Python script executes a Monte Carlo simulation, a stochastic model that accounts for the historical performance of selected assets, but also introduces volatility to simulate market unpredictability. 30000 unique simulation paths are generated.
  
  **Goal:** To forecast the potential value of the portfolio over a 10-year period. To calculate the probability of incurring loss vs. the probability of assets doubling or tripling in value.
  
  **Challenge:** Prices of non-US assets have to be converted to USD. The model performs daily rebalancing to maintain constant asset weights over the ten-year period. While this simplifies the model, it provides a more consistent baseline for modeling than allowing asset allocation to drift.

  - Python code: [`Monte Carlo Simulation Python`](https://github.com/SashaD826/Portfolio/blob/main/monte_carlo_sim.ipynb)

  **Result:** The mean (average) and median portfolio values are visualized using a line chart and a histogram, with the histogram illustrating the distribution of outcomes.
  
  **Future Improvements:** Planned updates include calculating the Sharpe ratio and adding an algorithm to determine optimal asset allocation.
   ### 📈📉 Alphabet Stock Evaluation
  **Description:** This Power BI dashboard delivers a comprehensive, interactive analysis of Alphabet’s (GOOG) stock performance spanning over two decades. By combining long-term historical data with P/E, the tool is meant to be used for identifying market trends and investment potential over time.

  **Goal:** To construct a composite visualization that combines technical and fundamental analysis. The primary objective was to overlay the daily stock price with the 50-Day Moving Average and historical P/E Ratios to identify clear patterns of overvaluation or undervaluation.
  
  **Challenge:** Historical valuation data (P/E ratio) was not readily available in standard stock datasets. To resolve this, I had to scrape it manually.

  - SQL Code: [`GOOG stock SQL`](https://github.com/SashaD826/Portfolio/blob/main/goog_stock_postgres.sql)

  - Power BI Dashboard: [`GOOG stock Power BI`](https://github.com/SashaD826/Portfolio/blob/main/goog_stock_bi.pbix)

  **Results:** The final dashboard enables users to make informed decisions by showing the correlation between historical price and intrinsic value. It successfully highlights the best and the worst moments for the stock, allowing investors to see exactly how market sentiment aligns with company earnings and momentum trends.

  **Future Improvements:** A specific API should be added to automate the web-scraping process.

  **Data Sources:** [Link to Kaggle](https://www.kaggle.com/datasets/henryshan/google-stock-price), [Link to macrotrends](https://www.macrotrends.net/stocks/charts/GOOG/alphabet/pe-ratio)
# Contacts
LinkedIn: https://www.linkedin.com/in/oleksandr-detsyk

