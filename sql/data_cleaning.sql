/*
 * data_cleaning.sql
 * Use on raw Kaggle data loaded into MySQL (not on data/processed/online_retail_clean.csv).
 * Deletes rows that skew metrics: missing CustomerID, non-positive Quantity,
 * non-positive UnitPrice. Expects table online_retail. Back up or use a transaction in production.
 */

--Remove null CustomerID
  DELETE FROM online_retail
  WHERE CustomerID is null;


--Remove invalid transactions
  DELETE FROM online_retail
  WHERE Quantity <= 0;


--Remove incorrect pricing
  DELETE FROM online_retail
  WHERE UnitPrice <= 0;
