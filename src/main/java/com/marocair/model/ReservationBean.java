package com.marocair.model;

public class ReservationBean {
    private int idBooking;
    private int idVol;
    private int nb_places;
    private String typeBooking;
    private String classe;



    public ReservationBean() {
        super();
    }



    public ReservationBean(int idBooking ,int idVol,int nb_places, String typeBooking,String classe) {
        this.idVol=idVol;
        this.idBooking = idBooking;
        this.nb_places = nb_places;
        this.typeBooking = typeBooking;
        this.classe = classe;
    }

    public int getIdBooking() {
        return idBooking;
    }

    public void setIdBooking(int idBooking) {
        this.idBooking = idBooking;
    }

    public int getidVol() {
        return idVol;
    }

    public void setidVol(int idVol) {
        this.idVol = idVol;
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

    public String getClasse() {
        return classe;
    }

    public void setClasse(String classe) {
        this.classe = classe;
    }


}
