package com.gpec.FarmFood.model.db;

import com.gpec.FarmFood.enums.RoleEnum;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import javax.persistence.*;
import java.util.Collection;
import java.util.List;

@Data
@Entity
@Table(name = "users")
@NoArgsConstructor
public class User implements UserDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private String email;

    private String password;

    @Transient
    private String favoriteSity;

    @ManyToOne
    @JoinColumn(name = "role", nullable = false)
    private Role role;

    @Transient
    @ManyToMany(mappedBy = "sellers")
    private List<Long> favoriteSellers;

    @Transient
    private List<Long> userReviewsIds;

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return null;
    }

    @Override
    public String getUsername() {
        return name;
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
        return false;
    }

    @Override
    public boolean isEnabled() {
        return false;
    }

//    @Transient
//    @OneToMany(mappedBy = "user_reviews")
//    private List<Long> userReviewsIds;
}
