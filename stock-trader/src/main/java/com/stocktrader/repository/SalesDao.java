package com.stocktrader.repository;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import com.stocktrader.config.DatabaseConfig;
import com.stocktrader.model.RevenueItem;

public class SalesDao {
    
    private List<RevenueItem> getDummyRevenueItems() {
        List<RevenueItem> items = new ArrayList<RevenueItem>();

        /*Sample data begins*/
        for (int i = 0; i < 10; i++) {
            RevenueItem item = new RevenueItem();
            item.setDate(new Date());
            item.setNumShares(5);
            item.setAccountId("foo");
            item.setPricePerShare(50.0);
            item.setStockSymbol("AAPL");
            item.setAmount(150.0);
            items.add(item);
        }
        /*Sample data ends*/

        return items;
    }
    
    public List<RevenueItem> getSalesReport(String month, String year) {
        List<RevenueItem> items = new ArrayList<>();
        String sql = "SELECT o.dateTime AS date, o.numShares AS numShares, o.accountNum AS accountNumber, " +
                     "s.sharePrice AS pricePerShare, o.stockSymbol AS stockSymbol " +
                     "FROM orders o JOIN stock s ON o.stockSymbol = s.stockSymbol " +
                     "WHERE MONTH(o.dateTime) = ? AND YEAR(o.dateTime) = ?";
        
        try (Connection con = DatabaseConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            // Validate and parse month/year
            int monthInt = Integer.parseInt(month);
            int yearInt = Integer.parseInt(year);
            
            if (monthInt < 1 || monthInt > 12) {
                throw new IllegalArgumentException("Invalid month: " + month);
            }
            if (yearInt < 2000 || yearInt > 2100) {
                throw new IllegalArgumentException("Invalid year: " + year);
            }
            
            ps.setInt(1, monthInt);
            ps.setInt(2, yearInt);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RevenueItem item = new RevenueItem();
                    item.setDate(rs.getDate("date"));
                    item.setNumShares(rs.getInt("numShares"));
                    item.setAccountId(String.valueOf(rs.getLong("accountNumber")));
                    item.setPricePerShare(rs.getDouble("pricePerShare"));
                    item.setStockSymbol(rs.getString("stockSymbol"));
                    item.setAmount(item.getNumShares() * item.getPricePerShare());
                    items.add(item);
                }
            }
        } catch (NumberFormatException e) {
            System.err.println("Invalid month or year format: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("Error getting sales report: " + e.getMessage());
            e.printStackTrace();
        }
        return items;
    }

    public List<RevenueItem> getSummaryListing(String searchKeyword) {
        List<RevenueItem> items = new ArrayList<>();
        String sql = "SELECT o.dateTime AS date, o.numShares AS numShares, o.accountNum AS accountId, " +
                     "s.sharePrice AS pricePerShare, o.stockSymbol AS stockSymbol " +
                     "FROM orders o " +
                     "JOIN stock s ON o.stockSymbol = s.stockSymbol " +
                     "JOIN accounts a ON o.accountNum = a.accountNum " +
                     "JOIN customers c ON a.customerID = c.customerID " +
                     "WHERE o.stockSymbol = ? OR s.stockType = ? OR c.lastName = ?";
        
        try (Connection con = DatabaseConfig.getConnection();
             PreparedStatement ps = con.prepareStatement(sql)) {
            
            // Sanitize search keyword
            String keyword = (searchKeyword == null) ? "" : searchKeyword.trim();
            ps.setString(1, keyword);
            ps.setString(2, keyword);
            ps.setString(3, keyword);
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    RevenueItem item = new RevenueItem();
                    item.setDate(rs.getDate("date"));
                    item.setNumShares(rs.getInt("numShares"));
                    item.setAccountId(String.valueOf(rs.getLong("accountId")));
                    item.setPricePerShare(rs.getDouble("pricePerShare"));
                    item.setStockSymbol(rs.getString("stockSymbol"));
                    item.setAmount(item.getNumShares() * item.getPricePerShare());
                    items.add(item);
                }
            }
        } catch (Exception e) {
            System.err.println("Error getting summary listing: " + e.getMessage());
            e.printStackTrace();
        }
        return items;
    }
}
