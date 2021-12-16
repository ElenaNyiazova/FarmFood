package com.gpec.FarmFood.model.db;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Entity
@Table(name = "contacts")
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class Contact {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    Long id;

    String name;
    String phone;
    String email;
    String site;
    String instagram;
    String viber;
    String whatsapp;
    String telegram;
}
