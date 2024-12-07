package test;

import java.util.Date;

public class Transaction {
    private String accountNumber;
    private String type;        
    private double amount;
    private String recipientAccountNumber;     
    private String status;    
    private Date transactionDate;

    public Transaction() {}
    public Transaction(String accountNumber, String type, double amount, String recipientAccountNumber, String status) {
        this.setAccountNumber(accountNumber);
        this.setType(type);
        this.setAmount(amount);
        this.setRecipientAccountNumber(recipientAccountNumber);
        this.setStatus(status);
    }

	public String getAccountNumber() {
		return accountNumber;
	}

	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getRecipientAccountNumber() {
		return recipientAccountNumber;
	}

	public void setRecipientAccountNumber(String recipientAccountNumber) {
		this.recipientAccountNumber = recipientAccountNumber;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Date getTransactionDate() {
		return transactionDate;
	}

	public void setTransactionDate(Date transactionDate) {
		this.transactionDate = transactionDate;
	}
    
}
