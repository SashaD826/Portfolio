/* Adding a column to the table */
ALTER TABLE goog_stock 
ADD column MA50 numeric(6, 3)

/* Moving Average is an Average Value between a certain number of previous Values and a current Value, perfect for stock price technical analysis */
UPDATE goog_stock a
SET MA50 = round(b.MA50, 3)
FROM (
	SELECT "date",
		CASE WHEN COUNT(*) over (ORDER BY "date" ROWS BETWEEN 49 PRECEDING AND CURRENT ROW) < 50
			THEN NULL
			ELSE AVG("close") over (ORDER BY "date" ROWS BETWEEN 49 PRECEDING AND CURRENT ROW)
	END AS MA50
	FROM goog_stock
) b
WHERE a."date" = b."date"
		
ALTER TABLE goog_stock
ADD column eps_ttm numeric(3, 2)

DELETE FROM goog_stock 
WHERE "date" < '2009-12-31'

/* Adding Trailing 12 Months EPS for each Day */
UPDATE goog_stock a
SET eps_ttm = b.eps_ttm
FROM (
	SELECT "date",CASE WHEN "date" >= '2009-12-31' AND "date" < '2010-03-31' THEN 0.51
	WHEN "date" >= '2010-03-31' AND "date" < '2010-06-30' THEN 0.55
	WHEN "date" >= '2010-06-30' AND "date" < '2010-09-30' THEN 0.57
	WHEN "date" >= '2010-09-30' AND "date" < '2010-12-31' THEN 0.61
						WHEN "date" >= '2010-12-31' AND "date" < '2011-03-31' THEN 0.66
	WHEN "date" >= '2011-03-31' AND "date" < '2011-06-30' THEN 0.65
	WHEN "date" >= '2011-06-30' AND "date" < '2011-09-30' THEN 0.70
	WHEN "date" >= '2011-09-30' AND "date" < '2011-12-31' THEN 0.74
						WHEN "date" >= '2011-12-31' AND "date" < '2012-03-31' THEN 0.75
	WHEN "date" >= '2012-03-31' AND "date" < '2012-06-30' THEN 0.83
	WHEN "date" >= '2012-06-30' AND "date" < '2012-09-30' THEN 0.85
	WHEN "date" >= '2012-09-30' AND "date" < '2012-12-31' THEN 0.8
						WHEN "date" >= '2012-12-31' AND "date" < '2013-03-31' THEN 0.81
	WHEN "date" >= '2013-03-31' AND "date" < '2013-06-30' THEN 0.84
	WHEN "date" >= '2013-06-30' AND "date" < '2013-09-30' THEN 0.87
	WHEN "date" >= '2013-09-30' AND "date" < '2013-12-31' THEN 0.93
						WHEN "date" >= '2013-12-31' AND "date" < '2014-03-31' THEN 0.94
	WHEN "date" >= '2014-03-31' AND "date" < '2014-06-30' THEN 0.94
	WHEN "date" >= '2014-06-30' AND "date" < '2014-09-30' THEN 0.94
	WHEN "date" >= '2014-09-30' AND "date" < '2014-12-31' THEN 0.92
						WHEN "date" >= '2014-12-31' AND "date" < '2015-03-31' THEN 1.02
	WHEN "date" >= '2015-03-31' AND "date" < '2015-06-30' THEN 1.03
	WHEN "date" >= '2015-06-30' AND "date" < '2015-09-30' THEN 1.04
	WHEN "date" >= '2015-09-30' AND "date" < '2015-12-31' THEN 1.11
						WHEN "date" >= '2015-12-31' AND "date" < '2016-03-31' THEN 1.15
	WHEN "date" >= '2016-03-31' AND "date" < '2016-06-30' THEN 1.19
	WHEN "date" >= '2016-06-30' AND "date" < '2016-09-30' THEN 1.29
	WHEN "date" >= '2016-09-30' AND "date" < '2016-12-31' THEN 1.38
						WHEN "date" >= '2016-12-31' AND "date" < '2017-03-31' THEN 1.39
	WHEN "date" >= '2017-03-31' AND "date" < '2017-06-30' THEN 1.48
	WHEN "date" >= '2017-06-30' AND "date" < '2017-09-30' THEN 1.38
	WHEN "date" >= '2017-09-30' AND "date" < '2017-12-31' THEN 1.5
						WHEN "date" >= '2017-12-31' AND "date" < '2018-03-31' THEN 0.9
	WHEN "date" >= '2018-03-31' AND "date" < '2018-06-30' THEN 1.18
	WHEN "date" >= '2018-06-30' AND "date" < '2018-09-30' THEN 1.16
	WHEN "date" >= '2018-09-30' AND "date" < '2018-12-31' THEN 1.33
						WHEN "date" >= '2018-12-31' AND "date" < '2019-03-31' THEN 2.19
	WHEN "date" >= '2019-03-31' AND "date" < '2019-06-30' THEN 2
	WHEN "date" >= '2019-06-30' AND "date" < '2019-09-30' THEN 2.48
	WHEN "date" >= '2019-09-30' AND "date" < '2019-12-31' THEN 2.34
						WHEN "date" >= '2019-12-31' AND "date" < '2020-03-31' THEN 2.47
	WHEN "date" >= '2020-03-31' AND "date" < '2020-06-30' THEN 2.48
	WHEN "date" >= '2020-06-30' AND "date" < '2020-09-30' THEN 2.28
	WHEN "date" >= '2020-09-30' AND "date" < '2020-12-31' THEN 2.59
						WHEN "date" >= '2020-12-31' AND "date" < '2021-03-31' THEN 2.93
	WHEN "date" >= '2021-03-31' AND "date" < '2021-06-30' THEN 3.75
	WHEN "date" >= '2021-06-30' AND "date" < '2021-09-30' THEN 4.60
	WHEN "date" >= '2021-09-30' AND "date" < '2021-12-31' THEN 5.18
						WHEN "date" >= '2020-12-31' AND "date" < '2021-03-31' THEN 2.93
	WHEN "date" >= '2021-03-31' AND "date" < '2021-06-30' THEN 3.75
	WHEN "date" >= '2021-06-30' AND "date" < '2021-09-30' THEN 4.60
	WHEN "date" >= '2021-09-30' AND "date" < '2021-12-31' THEN 5.18
						WHEN "date" >= '2021-12-31' AND "date" < '2022-03-31' THEN 5.61
	WHEN "date" >= '2022-03-31' AND "date" < '2022-06-30' THEN 5.53
	WHEN "date" >= '2022-06-30' AND "date" < '2022-09-30' THEN 5.3
	WHEN "date" >= '2022-09-30' AND "date" < '2022-12-31' THEN 4.96
						WHEN "date" >= '2022-12-31' AND "date" < '2023-03-31' THEN 4.56
	WHEN "date" >= '2023-03-31' AND "date" < '2023-06-30' THEN 4.5
	WHEN "date" >= '2023-06-30' AND "date" < '2023-09-30' THEN 4.81
	WHEN "date" >= '2023-09-30' AND "date" < '2023-12-31' THEN 5.3
						WHEN "date" >= '2023-12-31' AND "date" < '2024-03-31' THEN 5.8
END AS eps_ttm FROM goog_stock
) b
WHERE a."date" = b."date"

/*Adding a column for P/E ratio */
ALTER TABLE goog_stock
ADD column pe_ratio_ttm numeric (4,2)

/* Calculating daily GOOG P/E ratio */ 
UPDATE goog_stock a
SET pe_ratio_ttm = b.pe_ratio_ttm
FROM (
	SELECT "date", 
			close/eps_ttm AS pe_ratio_ttm
FROM goog_stock
) b
WHERE a."date" = b."date"
