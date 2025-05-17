/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package cinema.model.com;

/**
 *
 * @author Rajith Dewmina
 */

public class Payment {

    /**
     * @return the customerId
     */
    public int getCustomerId() {
        return customerId;
    }

    /**
     * @param customerId the customerId to set
     */
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }

    /**
     * @return the filmName
     */
    public String getFilmName() {
        return filmName;
    }

    /**
     * @param filmName the filmName to set
     */
    public void setFilmName(String filmName) {
        this.filmName = filmName;
    }

    /**
     * @return the showTime
     */
    public String getShowTime() {
        return showTime;
    }

    /**
     * @param showTime the showTime to set
     */
    public void setShowTime(String showTime) {
        this.showTime = showTime;
    }

    /**
     * @return the seats
     */
    public String getSeats() {
        return seats;
    }

    /**
     * @param seats the seats to set
     */
    public void setSeats(String seats) {
        this.seats = seats;
    }

    /**
     * @return the amount
     */
    public int getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(int amount) {
        this.amount = amount;
    }

    /**
     * @return the status
     */
    public String getStatus() {
        return status;
    }

    /**
     * @param status the status to set
     */
    public void setStatus(String status) {
        this.status = status;
    }

     private int customerId;
    private String filmName;
    private String showTime;
    private String seats;
    private int amount;
    private String status;
    
}
