package com.gpec.FarmFood.model.rest;

import com.gpec.FarmFood.model.db.City;
import com.gpec.FarmFood.model.db.Contact;
import com.gpec.FarmFood.model.db.User;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ContactDTO {

    @Id
    Long id;
    User user;
    String phone;
    String email;
    String site;
    String instagram;
    String viber;
    String whatsapp;
    String telegram;

    public ContactDTO(Contact contact) {
        this.id = contact.getId();
        this.user = contact.getUser();
        this.phone = contact.getPhone();
        this.email = contact.getEmail();
        this.site = contact.getSite();
        this.instagram = contact.getInstagram();
        this.viber = contact.getViber();
        this.whatsapp = contact.getWhatsapp();
        this.telegram = contact.getTelegram();

    }
}
