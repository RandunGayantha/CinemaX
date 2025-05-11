/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.model.com;

/**
 *
 * @author Rajith Dewmina
 */

public class Payments {
    private int customerId;
    private String cardName;
    private String cardNumber;
    private String expiryDate;
    private String cvv;
    private String filmName;
    private String showTime;
    private String seats;
    private double amount;

    // Constructor
    public Payments() {}

    // Setters
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    public void setCardName(String cardName) {
        this.cardName = cardName;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public void setExpiryDate(String expiryDate) {
        this.expiryDate = expiryDate;
    }

    public void setCvv(String cvv) {
        this.cvv = cvv;
    }

    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    public void setSeats(String seats) {
        this.seats = seats;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    // Getters
    public int getCustomerId() {
        return customerId;
    }

    public String getCardName() {
        return cardName;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public String getExpiryDate() {
        return expiryDate;
    }

    public String getCvv() {
        return cvv;
    }

    public String getFilmName() {
        return filmName;
    }

    public String getShowTime() {
        return showTime;
    }

    public String getSeats() {
        return seats;
    }

    public double getAmount() {
        return amount;
    }
}
