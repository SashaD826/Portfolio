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
  **Description:** The Book Recommender is a Python-based application that suggests books based on a user's favorite book, using a relatively large database of books and their ratings. It analyzes book attributes like title, author and returns a list of recommended books that were chosen according to their correlation with the user's favorite book. The system handles errors for invalid inputs, incomplete book titles and typos.
   
  **Goal:** A user-friendly Python application that delivers personalized book recommendations based on a user's favorite book. The highly tunable system features robust error handling for invalid inputs.
   
  **Obstacles:** The dataset is relatively large, the same book can have variations in its book titles.

   - Python code: [`Book Recommender`](https://github.com/SashaD826/Portfolio/blob/main/book_recommender2.ipynb)
   
  **Results:** A user-friendly application that recommends books to a users according to his preferences.
   
  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/arashnic/book-recommendation-dataset?select=Ratings.csv)
### 🚲 Bike Sales Breakdown
  **Description:** The dataset captures detailed sales data from a bike store over a one-month period, encompassing key metrics such as product descriptions, revenue, profits, production cost, customer details and transaction dates.
  
  **Goal:** To analyse the sales history of the store and extract insights on its performance, show crucial KPIs, search for potential improvements.
  
  **Obstacles:** The dataset requires targeted data cleaning to ensure accuracy and usability, including handling missing values, standardizing product descriptions, and correcting inconsistencies in transaction dates or sales figures. 
  
  - SQL code: [`Bike Sales SQl`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales_mysql.sql)
  
  - Python code: [`Bike Sales Python`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales.ipynb)
  
  - Excel Worksheet: [`Bike Sales Excel`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales_data.xlsx)
  
  - Power BI Dashboard: [`Bike Sales Power BI`](https://github.com/SashaD826/Portfolio/blob/main/bike_sales_bi.pbix)

  **Results:** Key data to optimize efficiency, including revenue trend over time, a histogram of typical order sizes, and detailed breakdowns by week day, country, region, and product.

  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/ratnarohith/uncleaned-bike-sales-data/data)
 ### 🧑‍💻 IBM Employees Evaluation
  **Description:** Dataset contains information about IBM Employees: their Job Satisfaction, Education Level, Hourly Rate, Experience, etc.

  **Goal:** To analyse IBM employees' performance, identify key trends to optimize workforce productivity.
  
  **Obstacles:** Complex Dataset, some columns are indexed, instead of containing readable data.

  - SQL code: [`IBM Employees SQL`](https://github.com/SashaD826/Portfolio/blob/main/ibm_employees_mysql.sql)

  - Power BI Dashboard: [`IBM Employees Power BI`](https://github.com/SashaD826/Portfolio/blob/main/ibm_employees_bi.pbix)

  **Results:** Crucial data about employees. Trends of their performance depending on age, education, experience.
  
  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/pavansubhasht/ibm-hr-analytics-attrition-dataset)
 ### 💰🌎 IT salaries all over the world
  **Description:** This simple yet useful dashboard that shows salaries for different employment types and positions in numerous countries.

  **Goal:** To get statistical data for multiples positions. Can be used for Machine Learning, for example.
  
  **Obstacles:** The dataset is vast, requiring careful handling as values cannot be directly compared without segmentation. Implementing slicers enables precise filtering and meaningful comparisons, ensuring accurate insights from the complex data.

  - Python Code: [`IT Salaries Python`](https://github.com/SashaD826/Portfolio/blob/main/it_salaries.ipynb)

  - Power BI Dashboard: [`IT Salaries Power BI`](https://github.com/SashaD826/Portfolio/blob/main/it_salaries_bi.pbix)

  **Results:** A Dashboard with key statistical indicators and multiple slicers that enables to compare jobs depending on employment type, company location, experience level or job title itself.
  
  **Data Source:** [Link to Kaggle](https://www.kaggle.com/datasets/saurabhbadole/latest-data-science-job-salaries-2024)
   ### 📊 Automated Portfolio Rebalancing
  **Description:** This simple, but useful Python code helps with rebalancing the portfolio: calculates number of shares that has to be purchased, and the amount that has to be spent per position.

  **Goal:** To automate the process to make it more effective. Just import the file, set the composition thresholds and code will do all the work.
   
  **Obstacles:** For the purpose of tax optimization, no shares can be sold, only buying is allowed.

  - Python code: [`Portfolio Rebalancing Python`](https://github.com/SashaD826/Portfolio/blob/main/portfolio_rebalancing.ipynb)

  **Results:** Goal achieved, but to make the code even better API should be used to fully automate the process.

  **Data Source:** [Portfolio Composition CSV](https://github.com/SashaD826/Portfolio/blob/main/etf_portfolio_rebalancing.csv)
   ### 💻🔮💰 Monte Carlo Simulation for a Stock Portfolio
  **Description:** This Python script executes a Monte Carlo simulation, a stochastic model that accounts for the historical performance of selected assets, but also introduces volatility to simulate market unpredictability. 30000 unique simulation paths are generated.
  
  **Goal:** To forecast the potential value of the portfolio over a 10-year period. To calculate the probability of incurring loss vs. the probability of assets doubling or tripling in value.
  
  **Obstacles:** Prices of non-US assets have to be converted to USD. The model performs daily rebalancing to maintain constant asset weights over the ten-year period. While this simplifies the model, it provides a more consistent baseline for modeling than allowing asset allocation to drift.

  - Python code: [`Monte Carlo Simulation Python`](https://github.com/SashaD826/Portfolio/blob/main/monte_carlo_sim.ipynb)

  **Result:** The mean (average) and median portfolio values are visualized using a line chart and a histogram, with the histogram illustrating the distribution of outcomes.
  
  **Future Improvements:** Planned updates include calculating the Sharpe ratio and adding an algorithm to determine optimal asset allocation.
   ### 📈📉 Alphabet Stock Evaluation
  **Description:** This Power BI dashboard delivers a comprehensive, interactive analysis of Alphabet’s (GOOG) stock performance spanning over two decades. By combining long-term historical data with P/E, the tool is meant to be used for identifying market trends and investment potential over time.

  **Goal:** To construct a composite visualization that combines technical and fundamental analysis. The primary objective was to overlay the daily stock price with the 50-Day Moving Average and historical P/E Ratios to identify clear patterns of overvaluation or undervaluation.
  
  **Obstacles:** Historical valuation data (P/E ratio) was not readily available in standard stock datasets. To resolve this, I had to scrape it manually.

  - SQL Code: [`GOOG stock SQL`](https://github.com/SashaD826/Portfolio/blob/main/goog_stock_postgres.sql)

  - Power BI Dashboard: [`GOOG stock Power BI`](https://github.com/SashaD826/Portfolio/blob/main/goog_stock_bi.pbix)

  **Results:** The final dashboard enables users to make informed decisions by showing the correlation between historical price and intrinsic value. It successfully highlights the best and the worst moments for the stock, allowing investors to see exactly how market sentiment aligns with company earnings and momentum trends.

  **Future Improvements:** A specific API should be added to automate the web-scraping process.

  **Data Sources:** [Link to Kaggle](https://www.kaggle.com/datasets/henryshan/google-stock-price), [Link to macrotrends](https://www.macrotrends.net/stocks/charts/GOOG/alphabet/pe-ratio)
# Contacts
LinkedIn: https://www.linkedin.com/in/oleksandr-detsyk

