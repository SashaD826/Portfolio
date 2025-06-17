/* Adding a column to the table */
alter table goog_stock 
add column MA50 numeric(6, 3)

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
where a."date" = b."date"
		
alter table goog_stock
add column eps_ttm numeric(3, 2)

DELETE FROM goog_stock 
where "date" < '2009-12-31'

/* Adding Trailing 12 Months EPS for each Day */
UPDATE goog_stock a
SET eps_ttm = b.eps_ttm
FROM (
	Select "date", case when "date" >= '2009-12-31' and "date" < '2010-03-31' then 0.51
	when "date" >= '2010-03-31' and "date" < '2010-06-30' then 0.55
	when "date" >= '2010-06-30' and "date" < '2010-09-30' then 0.57
	when "date" >= '2010-09-30' and "date" < '2010-12-31' then 0.61
						when "date" >= '2010-12-31' and "date" < '2011-03-31' then 0.66
	when "date" >= '2011-03-31' and "date" < '2011-06-30' then 0.65
	when "date" >= '2011-06-30' and "date" < '2011-09-30' then 0.70
	when "date" >= '2011-09-30' and "date" < '2011-12-31' then 0.74
						when "date" >= '2011-12-31' and "date" < '2012-03-31' then 0.75
	when "date" >= '2012-03-31' and "date" < '2012-06-30' then 0.83
	when "date" >= '2012-06-30' and "date" < '2012-09-30' then 0.85
	when "date" >= '2012-09-30' and "date" < '2012-12-31' then 0.8
						when "date" >= '2012-12-31' and "date" < '2013-03-31' then 0.81
	when "date" >= '2013-03-31' and "date" < '2013-06-30' then 0.84
	when "date" >= '2013-06-30' and "date" < '2013-09-30' then 0.87
	when "date" >= '2013-09-30' and "date" < '2013-12-31' then 0.93
						when "date" >= '2013-12-31' and "date" < '2014-03-31' then 0.94
	when "date" >= '2014-03-31' and "date" < '2014-06-30' then 0.94
	when "date" >= '2014-06-30' and "date" < '2014-09-30' then 0.94
	when "date" >= '2014-09-30' and "date" < '2014-12-31' then 0.92
						when "date" >= '2014-12-31' and "date" < '2015-03-31' then 1.02
	when "date" >= '2015-03-31' and "date" < '2015-06-30' then 1.03
	when "date" >= '2015-06-30' and "date" < '2015-09-30' then 1.04
	when "date" >= '2015-09-30' and "date" < '2015-12-31' then 1.11
						when "date" >= '2015-12-31' and "date" < '2016-03-31' then 1.15
	when "date" >= '2016-03-31' and "date" < '2016-06-30' then 1.19
	when "date" >= '2016-06-30' and "date" < '2016-09-30' then 1.29
	when "date" >= '2016-09-30' and "date" < '2016-12-31' then 1.38
						when "date" >= '2016-12-31' and "date" < '2017-03-31' then 1.39
	when "date" >= '2017-03-31' and "date" < '2017-06-30' then 1.48
	when "date" >= '2017-06-30' and "date" < '2017-09-30' then 1.38
	when "date" >= '2017-09-30' and "date" < '2017-12-31' then 1.5
						when "date" >= '2017-12-31' and "date" < '2018-03-31' then 0.9
	when "date" >= '2018-03-31' and "date" < '2018-06-30' then 1.18
	when "date" >= '2018-06-30' and "date" < '2018-09-30' then 1.16
	when "date" >= '2018-09-30' and "date" < '2018-12-31' then 1.33
						when "date" >= '2018-12-31' and "date" < '2019-03-31' then 2.19
	when "date" >= '2019-03-31' and "date" < '2019-06-30' then 2
	when "date" >= '2019-06-30' and "date" < '2019-09-30' then 2.48
	when "date" >= '2019-09-30' and "date" < '2019-12-31' then 2.34
						when "date" >= '2019-12-31' and "date" < '2020-03-31' then 2.47
	when "date" >= '2020-03-31' and "date" < '2020-06-30' then 2.48
	when "date" >= '2020-06-30' and "date" < '2020-09-30' then 2.28
	when "date" >= '2020-09-30' and "date" < '2020-12-31' then 2.59
						when "date" >= '2020-12-31' and "date" < '2021-03-31' then 2.93
	when "date" >= '2021-03-31' and "date" < '2021-06-30' then 3.75
	when "date" >= '2021-06-30' and "date" < '2021-09-30' then 4.60
	when "date" >= '2021-09-30' and "date" < '2021-12-31' then 5.18
						when "date" >= '2020-12-31' and "date" < '2021-03-31' then 2.93
	when "date" >= '2021-03-31' and "date" < '2021-06-30' then 3.75
	when "date" >= '2021-06-30' and "date" < '2021-09-30' then 4.60
	when "date" >= '2021-09-30' and "date" < '2021-12-31' then 5.18
						when "date" >= '2021-12-31' and "date" < '2022-03-31' then 5.61
	when "date" >= '2022-03-31' and "date" < '2022-06-30' then 5.53
	when "date" >= '2022-06-30' and "date" < '2022-09-30' then 5.3
	when "date" >= '2022-09-30' and "date" < '2022-12-31' then 4.96
						when "date" >= '2022-12-31' and "date" < '2023-03-31' then 4.56
	when "date" >= '2023-03-31' and "date" < '2023-06-30' then 4.5
	when "date" >= '2023-06-30' and "date" < '2023-09-30' then 4.81
	when "date" >= '2023-09-30' and "date" < '2023-12-31' then 5.3
						when "date" >= '2023-12-31' and "date" < '2024-03-31' then 5.8
end as eps_ttm from goog_stock
) b
where a."date" = b."date"

/*Adding a column for P/E ratio */
alter table goog_stock
add column pe_ratio_ttm numeric (4,2)

/* Calculating daily GOOG P/E ratio */ 
UPDATE goog_stock a
SET pe_ratio_ttm = b.pe_ratio_ttm
FROM (
	Select "date", close/eps_ttm as pe_ratio_ttm
from goog_stock
) b
where a."date" = b."date"
