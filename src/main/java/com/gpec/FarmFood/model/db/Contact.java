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

    @JoinColumn(name = "user_id")
    @Column(unique=true)
    User user;

    String phone;

    @Column(unique=true)
    String email;

    String site;
    String instagram;
    String viber;
    String whatsapp;
    String telegram;
}
