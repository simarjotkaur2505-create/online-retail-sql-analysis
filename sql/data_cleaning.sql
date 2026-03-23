--Remove null CustomerID
  DELETE FROM online_retail
  WHERE CustomerID is null;


--Remove invalid transactions
  DELETE FROM online_retail
  WHERE Quantity <= 0;


--Remove incorrect pricing
  DELETE FROM online_retail
  WHERE UnitPrice <= 0;
