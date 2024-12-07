package test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class DAOClass {
	public static final String driver = "oracle.jdbc.driver.OracleDriver";
	public static final String dbUrl = "jdbc:oracle:thin:@localhost:1521:xe";
	public static final String uName = "RAJKUMAR";
	public static final String pword = "RAJ204";
	public static Connection con = null;
	static {
		try {
			Class.forName(driver);
			con = DriverManager.getConnection(dbUrl, uName, pword);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
    public boolean createUser(BeanClass user) {
        String sql = "INSERT INTO BANKUSER (account_number, name, email, password, balance, daily_limit) " +
                     "VALUES (?, ?, ?, ?, 0, 5000)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, user.getAccountNumber());
            ps.setString(2, user.getName());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPassword());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public BeanClass getUserByEmail(String email) {
        String sql = "SELECT * FROM BANKUSER WHERE email = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                BeanClass user = new BeanClass();
                user.setId(rs.getInt("id"));
                user.setAccountNumber(rs.getString("account_number"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
                user.setBalance(rs.getDouble("balance"));
                user.setDailyLimit(rs.getDouble("daily_limit"));
                return user;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
    
    public boolean deposit(int userId, double amount) {
		  try (PreparedStatement ps = con.prepareStatement("UPDATE BANKUSER SET balance = balance + ? WHERE id = ?")) {
		      ps.setDouble(1, amount);
		      ps.setInt(2, userId);
		      return ps.executeUpdate() > 0;
		  } catch (SQLException e) {
		      e.printStackTrace();
		      return false;
		  }
  	}
    
	  public boolean withdraw(int userId, double amount) {
		  try (PreparedStatement ps = con.prepareStatement("UPDATE BANKUSER SET balance = balance - ? WHERE id = ? AND balance >= ?")) {
		      ps.setDouble(1, amount);
		      ps.setInt(2, userId);
		      ps.setDouble(3, amount);
		      return ps.executeUpdate() > 0;
		  } catch (SQLException e) {
		      e.printStackTrace();
		      return false;
		  }
	}
	  
    public boolean transfer(String fromUserAccountNumber, String toUserAccountNumber, double amount) {
	    try (PreparedStatement ps1 = con.prepareStatement("UPDATE BANKUSER SET balance = balance - ? WHERE account_number = ? AND balance >= ?");
	    	 PreparedStatement ps2 = con.prepareStatement("UPDATE BANKUSER SET balance = balance + ? WHERE account_number = ?")) {
	        con.setAutoCommit(false);
	
	        ps1.setDouble(1, amount);
	        ps1.setString(2, fromUserAccountNumber);
	        ps1.setDouble(3, amount);
	        int k = ps1.executeUpdate();
	        if (k == 0) {
	            con.rollback();
	            return false;
	        }
	
	        ps2.setDouble(1, amount);
	        ps2.setString(2, toUserAccountNumber);
	        k = ps2.executeUpdate();
	        if (k == 0) {
	            con.rollback();
	            return false;
	        }
	
	        con.commit();
	        return true;
	    } catch (SQLException e) {
	        e.printStackTrace();
	        return false;
	    }
	}  
    
    public static boolean isEmailContains(String email){
		try(PreparedStatement ps = con.prepareStatement("SELECT * FROM BANKUSER WHERE email = ?")) {
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return true;
			}
			return false;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return false;
	}
    
    public static double getBalance(int id) {
    	try(PreparedStatement ps = con.prepareStatement("SELECT balance FROM BANKUSER WHERE id = ?")){
    		ps.setInt(1, id);
    		ResultSet rs = ps.executeQuery();
    		if(rs.next()) {
    			return rs.getDouble("balance");
    		}
    	}
    	catch(Exception e){
    		e.printStackTrace();
    		return -1;
    	}
    	return -1;
    }
     
    public boolean addTransaction(Transaction transaction) {
        String sql = "INSERT INTO BANKTRANSACTIONS (ACCOUNT_NUMBER, type, amount, recipient_ACCOUNT_NUMBER, status) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, transaction.getAccountNumber());
            ps.setString(2, transaction.getType());
            ps.setDouble(3, transaction.getAmount());
            ps.setString(4, transaction.getRecipientAccountNumber());
            ps.setString(5, transaction.getStatus());
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public ArrayList<Transaction> getTransactionHistory(String accountNumber) {
    	ArrayList<Transaction> transactions = new ArrayList<>();
        String sql = "SELECT * FROM BANKTRANSACTIONS WHERE ACCOUNT_NUMBER = ? ORDER BY transaction_date DESC";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, accountNumber);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Transaction transaction = new Transaction();
                transaction.setAccountNumber(rs.getString("ACCOUNT_NUMBER"));
                transaction.setType(rs.getString("type"));
                transaction.setAmount(rs.getDouble("amount"));
                transaction.setRecipientAccountNumber(rs.getString("recipient_ACCOUNT_NUMBER"));
                transaction.setStatus(rs.getString("status"));
                transaction.setTransactionDate(rs.getTimestamp("transaction_date"));
                transactions.add(transaction);  // Add to list
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return transactions;
    }

}