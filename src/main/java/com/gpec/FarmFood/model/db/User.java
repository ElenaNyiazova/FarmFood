package com.gpec.FarmFood.model.db;

import com.gpec.FarmFood.enums.RoleEnum;
import com.sun.istack.NotNull;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.io.File;
import java.util.Collection;
import java.util.List;

@Data
@Entity
@Table(name = "users")
@NoArgsConstructor
public class User implements UserDetails {

    @Id
    @Column(name = "id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long userId;

    @NotNull
    @Column(unique = true)
    private String email;

    @NotNull
    private String password;
    private boolean isSeller;

    @ManyToOne
    @JoinColumn(name = "city.id")
    private City city;

    private String name;

//    private File image;
//    private File image_blob;

//    @Transient
//    private String favoriteSity;

//    @ManyToOne
//    @JoinColumn(name = "role", nullable = false)
   // private Role role;

//    @Transient
//
//    private List<Long> favoriteSellers;

//    @ManyToMany//(mappedBy = "id")
//    @JoinTable(name = "users_roles")
//    @JoinTable(name = "users_roles", //the table that connects them
//            joinColumns = @JoinColumn(name = "id"),//todo rename id ?
//            inverseJoinColumns = @JoinColumn(name = "id"))//todo rename id ?
//    private List<Reviews> userReviews;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }//todo return role with Privileges

    @Override
    public String getUsername() {
        return email;
    }

    @Override
    public boolean isAccountNonExpired() {
        return false;
    }

    @Override
    public boolean isAccountNonLocked() {
        return false;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }

//    @Transient
//    @OneToMany(mappedBy = "user_reviews")
//    private List<Long> userReviewsIds;
}
