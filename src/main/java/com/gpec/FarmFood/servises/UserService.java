package com.gpec.FarmFood.servises;

import com.gpec.FarmFood.model.db.User;
import com.gpec.FarmFood.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class UserService implements UserDetailsService {

    @Autowired
    private UserRepository userRepository;

    public UserDetails loadUserByUsername(String email, String password) throws UsernameNotFoundException {
        Optional<User> user = userRepository.findByEmailIgnoreCase(email);

        if (user == null) {
            throw new UsernameNotFoundException("User not found");
        }
        return user.orElse(new User());
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return null;
    }
    // saveNewUser(userName, password)
}
