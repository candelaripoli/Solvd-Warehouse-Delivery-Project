package com.solvd.warehouseProject.models;

import java.util.List;

public class Truck extends AbstractEntity{
    private Double capacity;
    private List<Driver> drivers;
    private List<Order> orders;

    public Truck() {
    }

    public Truck(Double capacity, List<Driver> drivers, List<Order> orders) {
        this.capacity = capacity;
        this.drivers = drivers;
        this.orders = orders;
    }

    public Double getCapacity() {
        return capacity;
    }

    public void setCapacity(Double capacity) {
        this.capacity = capacity;
    }

    public List<Driver> getDrivers() {
        return drivers;
    }

    public void setDrivers(List<Driver> drivers) {
        this.drivers = drivers;
    }

    public List<Order> getOrders() {
        return orders;
    }

    public void setOrders(List<Order> orders) {
        this.orders = orders;
    }
}
