package com.marocair.model;

public class Booking {
    
    private int idBooking;
    private int iduser;
    private int idvol;
    private int nb_places;
    private String typeBooking;
    private String status;
    private String classe;
    private String end_city;
    private String start_date_time;

    public String getStart_date_time() {
        return start_date_time;
    }

    public void setStart_date_time(String start_date_time) {
        this.start_date_time = start_date_time;
    }

    public Booking() {
        super();
    }

    public String getEnd_city() {
        return end_city;
    }

    public void setEnd_city(String end_city) {
        this.end_city = end_city;
    }
    
    

    public Booking(int idBooking, int iduser, int idvol, int nb_places, String typeBooking, String status, String classe) {
        this.idBooking = idBooking;
        this.iduser = iduser;
        this.idvol = idvol;
        this.nb_places = nb_places;
        this.typeBooking = typeBooking;
        this.status = status;
        this.classe = classe;
    }

    public int getIdBooking() {
        return idBooking;
    }

    public void setIdBooking(int idBooking) {
        this.idBooking = idBooking;
    }

    public int getIduser() {
        return iduser;
    }

    public void setIduser(int iduser) {
        this.iduser = iduser;
    }

    public int getIdvol() {
        return idvol;
    }

    public void setIdvol(int idvol) {
        this.idvol = idvol;
    }

    public int getNb_places() {
        return nb_places;
    }

    public void setNb_places(int nb_places) {
        this.nb_places = nb_places;
    }

    public String getTypeBooking() {
        return typeBooking;
    }

    public void setTypeBooking(String typeBooking) {
        this.typeBooking = typeBooking;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }
    
}
