select a.StockID, a.InvSha3, b.InvSha3, a.InvSha3+b.InvSha3 as TotalSha3 from twnforinvtrad_chip a, twnfundtrad_chip b where a.StockID = b.StockID order by TotalSha3 desc limit 30;

